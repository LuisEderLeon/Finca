-- SQLBook: Code
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

-- 7 producto en tipo
CREATE FUNCTION productoEnTipo (prodIdtipo INT)
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN (SELECT count(*) FROM tiposProducto WHERE id = prodIdtipo);
END //

-- 8 Obtener el precio de un producto por ID.
create function precioProducto (producto int)
returns double DETERMINISTIC begin
    return (select precio from productos where id = producto);
end //

-- 9 Obtener la edad de un empleado.
create function consultarEdad (idEdad int, tipo enum("empleados","clientes"))
returns int DETERMINISTIC
begin
    declare edad int;
    case
        when tipo = "empleados" then select TIMESTAMPDIFF(YEAR, empleados.fechaNacimiento, curdate()) into edad from empleados where id = idEdad;
        when tipo = "clientes" then select TIMESTAMPDIFF(YEAR, clientes.fechaNacimiento, curdate()) into edad from clientes where id = idEdad;
    return edad;
end //

-- 10

CREATE FUNCTION totalDiasDesdeContratacion(employeeId INT)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE totalDias INT;
    SELECT DATEDIFF(CURDATE(), fechaContratacion) INTO totalDias FROM empleados WHERE id = employeeId;
    RETURN totalDias;
END;


-- 11 Obtener el total de ventas de un cliente.
CREATE FUNCTION totalVentaCliente (fIdCliente int) 
returns double DETERMINISTIC
deterministic
begin
    return(select sum(ventas.total) from ventas where ventas.idCliente = fIdCliente);
end //

-- 12 obtener promedio de los productos

CREATE FUNCTION promedioProductos() RETURNS DOUBLE DETERMINISTIC
BEGIN 
    DECLARE avgPrecio DOUBLE;
    SELECT AVG(precio) INTO avgPrecio FROM productos;
    RETURN avgPrecio;
END;


-- 13 total de animales comprados

CREATE FUNCTION totalAnimalesComprados() RETURNS INT DETERMINISTIC
BEGIN
    DECLARE totalComprados INT;
    SELECT COUNT(*) INTO totalComprados FROM compraAnimales;
    RETURN totalComprados;
END;

-- 14 Obtener el conteo de maquinaria activa.

create function conteoMaquinariasActivas ()
returns int deterministic begin
    return (select count(*) from maquinarias where estado = "uso");
end //

-- 15 Obtener el conteo de empleados en una función específica.


create function conteoEmpleadosFuncion (funcion int)
returns int deterministic 
begin
    return (select count(*) from empleados where idFuncion = funcion);
end //

-- 16 Obtener la fecha de la última venta registrada.

create function fechaUltimaVentaRegistrada ()
returns date deterministic 
begin
    return(select max(fecha) from ventas);
end//

-- 17 Calcular el ingreso total de las ventas.

create function ingresoTotalVentas ()
returns double deterministic 
begin
    return(select sum(ventas.total) from ventas);
end//

-- 18 Obtener el total de animales comprados de un proveedor.

CREATE FUNCTION totalAnimalesProveedor(fIdProveedor INT)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE total INT;

    SELECT COUNT(animales.id) INTO total 
    FROM compraAnimales 
    JOIN compras ON compras.id = compraAnimales.idCompra 
    WHERE compras.idProveedor = fIdProveedor;

    RETURN total;
END // 

-- 19 Obtener el total de parcelas cultivadas por un empleado.

CREATE FUNCTION totalParcelasCultivadasEmpleado(fIdEmpleado INT)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE total INT;

    SELECT COUNT(cultivo.idParcela) INTO total 
    FROM cultivo 
    WHERE idEmpleado = fIdEmpleado;

    RETURN total;
END // 

-- 20 Obtener el conteo de mantenimientos de una maquinaria.

CREATE FUNCTION conteoMantenimientoMaquinaria(fIdMaquinaria INT)
RETURNS INT DETERMINISTIC
BEGIN
    DECLARE total INT;

    SELECT COUNT(mantenimiento.idMaquinaria) INTO total 
    FROM mantenimiento 
    WHERE idMaquinaria = fIdMaquinaria;

    RETURN total;
END // 

DELIMITER ;
