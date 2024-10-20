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
CREATE TRIGGER totalComprasAnimales
AFTER INSERT ON compraAnimales
FOR EACH ROW
BEGIN
    DECLARE subtotalTemporal DOUBLE;
    SELECT precio INTO subtotalTemporal FROM animales WHERE id = new.idAnimal;
    UPDATE compras SET total = subtotalTemporal + total WHERE id = new.idCompra;
END //

-- 4
CREATE TRIGGER updateInventarioCosecha
AFTER INSERT ON cosecha
FOR EACH ROW
BEGIN
    DECLARE productoCultivado INT;
    DECLARE cantidadStock int;
    DECLARE cantidadVenta int;
    SELECT idProducto INTO productoCultivado FROM cultivos WHERE id = new.idCultivo;
    set cantidadStock = floor(new.cantidad / 3);
    set cantidadVenta = new.cantidad - cantidadStock;
    update inventarios set cantidad = cantidad + cantidadStock where inventarios.idProducto = productoCultivado and estado="stock";
        update inventarios set fechaIngreso = now() where inventarios.idProducto = productoCultivado and estado="stock";

    update inventarios set cantidad = cantidad + cantidadVenta where inventarios.idProducto = productoCultivado and estado="venta";
        update inventarios set fechaIngreso = now() where inventarios.idProducto = productoCultivado and estado="venta";
END //

-- 5
CREATE TRIGGER updateInventarioProduccion
AFTER INSERT ON produccion
FOR EACH ROW
BEGIN
    DECLARE productoProducido INT;
    DECLARE cantidadStock int;
    DECLARE cantidadVenta int;
    SET productoProducido = new.idProducto;
    set cantidadStock = floor(new.cantidad / 3);
    set cantidadVenta = new.cantidad - cantidadStock;
    update inventarios set cantidad = cantidad + cantidadStock where inventarios.idProducto = productoProducido and estado="stock";
        update inventarios set fechaIngreso = now() where inventarios.idProducto = productoProducido and estado="stock";

    update inventarios set cantidad = cantidad + cantidadVenta where inventarios.idProducto = productoProducido and estado="venta";
        update inventarios set fechaIngreso = now() where inventarios.idProducto = productoProducido and estado="venta";
END //

-- 6
CREATE TRIGGER ajustarStockAlimentos
AFTER INSERT ON compraAlimentos
FOR EACH ROW
BEGIN
    UPDATE alimentos SET stock = stock + new.cantidad WHERE id = new.idCompra;
END //

-- 7
CREATE TRIGGER comprobarStockVenta
BEFORE INSERT ON detallesVenta
FOR EACH ROW
BEGIN
    DECLARE stockDisponible INT;
    SELECT inventarios.cantidad INTO stockDisponible FROM inventarios WHERE inventarios.idProducto = new.idProducto;
    IF stockDisponible < NEW.cantidad THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay suficiente stock para la venta';
    END IF;
END //

-- 8
CREATE TRIGGER ajustarStockInventarioVenta
AFTER INSERT ON detallesVenta
FOR EACH ROW
BEGIN
    UPDATE inventarios
    SET inventarios.cantidad = inventarios.cantidad - NEW.cantidad
    WHERE idProducto = NEW.idProducto AND estado = "stock";
    
    
END //

-- 9
DELIMITER //
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