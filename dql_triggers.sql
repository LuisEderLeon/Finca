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

    SELECT PRODUCTOENPARCELA(new.idParcela) INTO productoCultivado;
    SELECT EXISTENPRODUCTOSAVENDER(productoCultivado) INTO existeVenta;

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
    SELECT EXISTENPRODUCTOSAVENDER(productoProducido) INTO existeVenta;
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
    DECLARE stockARestar INT;
    
    SET stockARestar = new.cantidad;

    SELECT STOCKALAVENTA(new.idProducto) INTO stockDisponible;
    
    WHILE stockDisponible < stockARestar DO
        SET stockARestar = stockARestar - stockDisponible;
        DELETE FROM inventarios WHERE estado = "venta" AND idProducto = new.idProducto;
        UPDATE inventarios SET estado = "venta" WHERE idProducto = new.idProducto 
        ORDER BY fechaIngreso LIMIT 1;
        SELECT STOCKALAVENTA(new.idProducto) INTO stockDisponible;
    END WHILE;

    IF stockDisponible IS NULL THEN
        SET new.cantidad = new.cantidad - stockARestar;
        INSERT INTO registros (fechaRegistro, mensaje) VALUES
        (NOW(), CONCAT("No habian suficientes productos con id ",new.idProducto," para la venta ",new.idVenta));
    ELSE 
        UPDATE inventarios SET cantidad = cantidad - stockARestar 
        WHERE estado = "venta" AND idProducto = new.idProducto;
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

DELIMITER ;

