DELIMITER //
-- 1
CREATE TRIGGER subtotalCompraAlimentos
BEFORE INSERT ON compraAlimentos
FOR EACH ROW
BEGIN
    DECLARE precioAlimento DOUBLE;
    SELECT alimentos.precio INTO precioAlimento FROM alimentos WHERE id = new.idAlimento;
    SET new.subtotal = precioAlimento * new.cantidad;
END //

-- 2

CREATE TRIGGER totalComprasAlimentos
AFTER INSERT ON compraAlimentos
FOR EACH ROW
BEGIN
    DECLARE subtotalTemporal DOUBLE;
    SELECT subtotal INTO subtotalTemporal FROM compraAlimentos WHERE idCompra = new.idCompra AND idAlimento = new.idAlimento;
    UPDATE compras SET total = subtotalTemporal + total WHERE id = new.idCompra;
END //

-- 3
CREATE TRIGGER subtotalCompraMaquinaria
BEFORE INSERT ON compraMaquinaria
FOR EACH ROW
BEGIN
    DECLARE precioMaquinaria DOUBLE;
    SELECT maquinarias.precio INTO precioMaquinaria FROM maquinarias WHERE id = new.idMaquinaria;
    SET new.subtotal = precioMaquinaria * new.cantidad;
END //

-- 4

CREATE TRIGGER totalComprasMaquinaria
AFTER INSERT ON compraMaquinaria
FOR EACH ROW
BEGIN
    DECLARE subtotalTemporal DOUBLE;
    SELECT subtotal INTO subtotalTemporal FROM compraMaquinaria WHERE idCompra = new.idCompra AND idMaquinaria = new.idMaquinaria;
    UPDATE compras SET total = subtotalTemporal + total WHERE id = new.idCompra;
END //

-- 5
CREATE TRIGGER totalComprasAnimales
AFTER INSERT ON compraAnimales
FOR EACH ROW
BEGIN
    DECLARE subtotalTemporal DOUBLE;
    SELECT precio INTO subtotalTemporal FROM animales WHERE id = new.idAnimal;
    UPDATE compras SET total = subtotalTemporal + total WHERE id = new.idCompra;
END //

-- 6
CREATE TRIGGER updateInventarioCosecha
AFTER INSERT ON cosecha
FOR EACH ROW
BEGIN
    DECLARE productoCultivado INT;
    DECLARE existeVenta INT;
    DECLARE estadoProducto VARCHAR(50);

    SELECT productoEnParcela(new.idParcela) INTO productoCultivado;
    SELECT existenProductosAVender(productoCultivado) INTO existeVenta;

    IF existeVenta = 0 THEN
        SET estadoProducto = "venta";
    ELSE
        SET estadoProducto = "stock";
    END IF;

    INSERT INTO inventarios (idProducto, estado, fechaIngreso, cantidad) VALUES
    (productoCultivado, estadoProducto, NOW(), new.cantidad);
END //

-- 7
CREATE TRIGGER updateInventarioProduccion
AFTER INSERT ON produccion
FOR EACH ROW
BEGIN
    DECLARE productoProducido INT;
    DECLARE existeVenta INT;
    DECLARE estadoProducto VARCHAR(50);
    
    SET productoProducido = new.idProducto;
    SELECT existenProductosAVender(productoProducido) INTO existeVenta;
    IF existeVenta = 0 THEN
        SET estadoProducto = "venta";
    ELSE
        SET estadoProducto = "stock";
    END IF;
    INSERT INTO inventarios (idProducto, estado, fechaIngreso, cantidad) VALUES
    (productoProducido, estadoProducto, NOW(), new.cantidad);
END //

-- 8
CREATE TRIGGER ajustarStockAlimentos
AFTER INSERT ON compraAlimentos
FOR EACH ROW
BEGIN
    UPDATE alimentos SET stock = stock + new.cantidad WHERE id = new.idAlimento;
END //

-- 9
CREATE TRIGGER ajustarStockMaquinaria
AFTER INSERT ON compraMaquinaria
FOR EACH ROW
BEGIN
    UPDATE maquinarias SET maquinarias.cantidad = cantidad + new.cantidad WHERE id = new.idMaquinaria;
END //

-- 10
CREATE TRIGGER comprobarStockVenta
BEFORE INSERT ON detallesVenta
FOR EACH ROW
BEGIN
    DECLARE stockDisponible INT;
    select totalEnInventario(new.idProducto) into stockDisponible;
    IF stockDisponible < new.cantidad THEN
        SET new.cantidad = stockDisponible;
        INSERT INTO registros (fechaRegistro, mensaje) VALUES
        (NOW(), CONCAT("No habian suficientes productos con id ",new.idProducto," para la venta ",new.idVenta));
    END IF;
END //

-- 11
CREATE TRIGGER actualizarSubtotalVentas
BEFORE INSERT ON detallesVenta
FOR EACH ROW
BEGIN
    DECLARE precioProducto DOUBLE;
    SELECT precio INTO precioProducto FROM productos WHERE id = new.idProducto;
    SET new.subtotal = new.cantidad * precioProducto;
END //

-- 12
CREATE TRIGGER actualizarTotalVenta
AFTER INSERT ON detallesVenta
FOR EACH ROW
BEGIN
    DECLARE subtotalProducto DOUBLE;
    SELECT detallesVenta.subtotal INTO subtotalProducto FROM detallesVenta WHERE detallesVenta.idProducto = new.idProducto AND detallesVenta.idVenta = new.idVenta;
    UPDATE ventas SET total = total + subtotalProducto WHERE id = new.idVenta;
END //

-- 13
CREATE TRIGGER aumentarComidaAnimalesEnfermos
AFTER UPDATE ON animales
FOR EACH ROW
BEGIN
    IF NEW.estadoSalud = "muerto" THEN
        UPDATE animales
        SET cantidadAlimento = 0
        WHERE animales.id = new.id;
    END IF;
    IF NEW.estadoSalud = "enfermo" THEN
        UPDATE animales
        SET cantidadAlimento = cantidadAlimento + 10
        WHERE animales.id = new.id;
    END IF;
END //

-- 14
CREATE TRIGGER registrarCambioPrecio
AFTER UPDATE ON productos
FOR EACH ROW
BEGIN
    insert into registros (fechaRegistro, mensaje) values
    (NOW(), CONCAT("Se actualizó el precio del producto ", NEW.nombre, ": ", OLD.precio, " -> ", NEW.precio));
END //

-- 15
create TRIGGER actualizarEstadoMaquinarias
AFTER INSERT ON mantenimiento
FOR EACH ROW
BEGIN
    update maquinarias set estado = "mantenimiento" where id = new.idMaquinaria and new.fechaFin < now();
    insert into registros (fechaRegistro, mensaje) values
    (now(),concat("Se puso la maquinaria ", new.idMaquinaria, " en mantenimiento por ", datediff(new.fechaFin,new.fechaInicio)," dias, ",timediff(new.fechaInicio,new.fechaFin)));
end//

-- 16
create trigger verificarVentasPrducto
BEFORE delete on productos
FOR EACH ROW
BEGIN
    if exists (select 1 from detallesVenta where idProducto = old.id) then
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Este producto esta siendo utilizado en ventas';
    end if;
end //

-- 17
create trigger cambioEstadoAnimal
AFTER update on animales
FOR EACH ROW
BEGIN
    if new.estadoSalud <> old.estadoSalud then
        insert into registros (fechaRegistro, mensaje) values
        (now(),concat("El animal ",new.id," cambio su salud: ",new.estadoSalud, " -> ", old.estadoSalud));
    end if;
end //

-- 18
create trigger actualizarParcelasCultivadas
AFTER INSERT ON cultivo
FOR EACH ROW
BEGIN
    update parcelas set idProducto = new.idProducto, cantidad = new.cantidad, fechaCultivo = now() 
    where id = new.idParcela;
END //

-- 19
create trigger actualizarParcelasCosechadas
AFTER INSERT ON cosecha
FOR EACH ROW
BEGIN
    update parcelas set idProducto =  0, cantidad = 0, fechaCultivo = now() where id = new.idParcela;
end //

-- 20
create trigger verificarCantidadProduccion
BEFORE INSERT ON produccion
FOR EACH ROW
BEGIN
    IF NEW.cantidad < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cantidad no valida para producir';
    end if;
END //

DELIMITER ;