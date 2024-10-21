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
BEFORE INSERT ON compramaquinaria
FOR EACH ROW
BEGIN
    DECLARE precioMaquinaria DOUBLE;
    SELECT maquinarias.precio INTO precioMaquinaria FROM maquinarias WHERE id = new.idMaquinaria;
    SET new.subtotal = precioMaquinaria * new.cantidad;
END //

-- 4

CREATE TRIGGER totalComprasMaquinaria
AFTER INSERT ON compramaquinaria
FOR EACH ROW
BEGIN
    DECLARE subtotalTemporal DOUBLE;
    SELECT subtotal INTO subtotalTemporal FROM compramaquinaria WHERE idCompra = new.idCompra AND idMaquinaria = new.idMaquinaria;
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
    declare estadoProducto varchar(50);

    SELECT idProducto INTO productoCultivado FROM cultivos WHERE id = new.idCultivo;
    select count(*) into existeVenta from inventarios where idProducto = productoCultivado and estado = "venta";

    if existeVenta = 0 then
        set estadoProducto = "venta";
    else
        set estadoProducto = "stock";
    end if;

    insert into inventarios (idProducto, estado, fechaIngreso, cantidad) values
    (productoCultivado, estadoProducto, now(), new.cantidad);
END //

-- 7
CREATE TRIGGER updateInventarioProduccion
AFTER INSERT ON produccion
FOR EACH ROW
BEGIN
    DECLARE productoProducido INT;
    DECLARE existeVenta INT;
    declare estadoProducto varchar(50);
    
    set productoProducido = new.idProducto;
    select count(*) into existeVenta from inventarios where idProducto = productoProducido and estado = "venta";
    if existeVenta = 0 then
        set estadoProducto = "venta";
    else
        set estadoProducto = "stock";
    end if;
    insert into inventarios (idProducto, estado, fechaIngreso, cantidad) values
    (productoProducido, estadoProducto, now(), new.cantidad);
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
before INSERT ON detallesVenta
FOR EACH ROW
BEGIN
    DECLARE stockDisponible INT;
    declare stockARestar int;
    declare totalEnInventario int;
    set stockARestar = new.cantidad;
    SELECT cantidad INTO stockDisponible FROM inventarios 
    WHERE idProducto = new.idProducto and estado = "venta";
    
    select sum(inventarios.cantidad) into totalEnInventario from inventarios
    where idProducto = new.idProducto;
    
    if stockDisponible < totalEnInventario then
        set new.cantidad = totalEnInventario;
    end if;
    
    while stockDisponible < stockARestar do
        set stockARestar = stockARestar - stockDisponible;
        delete from inventarios where estado = "venta" and idProducto = new.idProducto;
        update inventarios set estado = "venta" where idProducto = new.idProducto 
        order by fechaIngreso limit 1;
        SELECT cantidad INTO stockDisponible FROM inventarios 
        WHERE idProducto = new.idProducto and estado = "venta";
    END while;

    if stockDisponible is null THEN
        set new.cantidad = new.cantidad - totalEnInventarioockARestar;
    else 
        update inventarios set cantidad = cantidad - stockARestar 
        where estado = "venta" and idProducto = new.idProducto;
    end if;
END //

-- 11
CREATE TRIGGER actualizarSubtotalVentas
before INSERT ON detallesVenta
FOR EACH ROW
BEGIN
    declare precioProducto double;
    select precio into precioProducto from productos where id = new.idProducto;
    set new.subtotal = new.cantidad * precioProducto;
END //

-- 12
CREATE TRIGGER actualizarTotalVenta
after INSERT ON detallesVenta
FOR EACH ROW
BEGIN
    declare subtotalProducto double;
    select detallesventa.subtotal into subtotalProducto from detallesventa where detallesventa.idProducto = new.idProducto and detallesventa.idVenta = new.idProducto;
    update ventas set total = total + subtotalProducto where id = new.idVenta;
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

DELIMITER ;