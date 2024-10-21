DELIMITER //

-- 1
CREATE FUNCTION nombreEspecie (idAnimal INT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN 
    DECLARE nombre VARCHAR(50);
    SELECT especie.nombre INTO nombre FROM animales
    JOIN especies ON animales.idEspecie = especies.id;
    RETURN nombre;
END //

-- 2
CREATE FUNCTION productoEnParcela (idParcela INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN (SELECT idProducto FROM parcelas WHERE id = idParcela);
END //

-- 3
CREATE FUNCTION existenProductosAVender (producto INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN (SELECT COUNT(*) FROM inventarios 
    WHERE idProducto = producto AND estado = "venta");
END //

-- 4
CREATE FUNCTION stockALaVenta (producto INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN (SELECT cantidad FROM inventarios 
    WHERE idProducto = producto AND estado = "venta");
END //

-- 5
CREATE FUNCTION totalEnInventario (idProductoInventario INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN (SELECT SUM(inventarios.cantidad) FROM inventarios 
    WHERE idProducto = idProductoInventario);
END //

-- 6
CREATE FUNCTION fechaUltimaReparacionMaquinaria (idDeMaquinaria INT)
RETURNS DATETIME
DETERMINISTIC
BEGIN
    RETURN (select max(mantenimiento.fechaFin) from mantenimiento where mantenimiento.fechaFin < now() and mantenimiento.iDMaquinaria = idDeMaquinaria);
END //