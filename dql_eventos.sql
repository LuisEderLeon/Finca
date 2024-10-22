DELIMITER //

-- 1 notificarStock bajo en alimentos
create event notificarBajoStock
on schedule every 1 day 
starts now() do begin 
    insert into alertas (fecha, mensaje)
    select now(), concat('Bajo stock de ', alimentos.nombre) 
    from alimentos
    where stock <= 10;
end //

-- 2 notificarBajoStockProductos
create event notificarBajoStockProductos
on schedule every 1 day 
starts now() do begin 
    insert into alertas (fecha, mensaje)
    select now(), concat('Bajo stock de ', productos.nombre) 
    from productos
    where totaleninventario(productos.id) <= 10;
end //

-- 3 recordarMantenimientoMaquinarias
create event recordarMantenimientoMaquinarias
on schedule every 30 day 
starts now() do begin 
    insert into alertas (fecha, mensaje)
    select now(), concat('Recordatorio: realizar mantenimiento de ', maquinarias.marca, ' ', maquinarias.modelo) 
    from maquinarias Maq
    where datediff((select max(MAntenimiento.fEchaFin) from Mantenimiento where Mantenimiento.fechaFin < now() and Mantenimiento.iDMaquinaria = Maq.id), fechaCompra) >= 10;
end //

-- 4 actualizarEstadoMaquinarias
create event actualizarEstadoMaquinariasDiario
on schedule every 1 day
starts now() do begin
    update maquinarias set estado = "stock" where id in (select idMaquinaria from mantenimiento where fechaFin <= now());
end //

-- 5 notificarMantenimientoParcelas
CREATE EVENT notificarMantenimientoParcelas
ON SCHEDULE EVERY 60 DAY 
DO
BEGIN 
    INSERT INTO alertas (fecha, mensaje)
    SELECT NOW(), CONCAT("Revisar mantenimiento de la parcela" , id) 
    FROM parcelas 
    WHERE DATEDIFF(NOW(), fechaCultivo) >= 180;
END //
-- 6 notificarEnfermedadesAnimales
CREATE EVENT notificarEnfermedadesAnimales
ON SCHEDULE EVERY 1 WEEK 
DO
BEGIN 
    INSERT INTO alertas (fecha, mensaje)
    SELECT NOW(), CONCAT("Revisión necesaria para animales enfermos") 
    FROM animales 
    WHERE estadoSalud = "enfermo";
END //
-- 7 notificarProximasCosechas
CREATE EVENT notificarProximasCosechas
ON SCHEDULE EVERY 2 WEEK
DO
BEGIN 
    INSERT INTO alertas (fecha, mensaje)
    SELECT NOW(), CONCAT('fecha de cosecha proxima ', id) 
    FROM cosecha 
    WHERE DATEDIFF(NOW(), fecha) <= 7;
END //
-- 8 actualizarPrecioProductosInflacion
CREATE EVENT actualizarPrecioProductos
ON SCHEDULE EVERY 1 YEAR 
DO
BEGIN 
    UPDATE productos SET precio = precio * 1.08;
END //

-- 9 notificarCumpleañosEmpleado
CREATE EVENT notificarCumpleañosEmpleado
ON SCHEDULE EVERY 1 DAY
STARTS NOW() DO BEGIN
    INSERT INTO alertas (fecha, mensaje)
    SELECT NOW(), CONCAT('Hoy es el cumpleaños de: ', empleados.nombre)
    FROM empleados
    WHERE MONTH(empleados.fechaNacimiento) = MONTH(NOW()) AND DAY(fechaNacimiento) = DAY(NOW());
END //

-- 10 borrarAlertasViejas
CREATE EVENT borrarAlertasViejas
ON SCHEDULE EVERY 1 MONTH
STARTS NOW() 
DO 
BEGIN
    DELETE FROM alertas
    WHERE fecha < DATE_SUB(NOW(), INTERVAL 6 MONTH);
END //

-- 11 registrarTotalComprasMensual
CREATE EVENT registrarTotalComprasMensual
ON SCHEDULE EVERY 1 MONTH
STARTS NOW() 
DO 
BEGIN
    INSERT INTO registros (fechaRegistro, mensaje)
    SELECT NOW(), CONCAT('Total gastado en compras: ', SUM(total))
    FROM compras
    WHERE MONTH(NOW()) = MONTH(compras.fecha);
END //

-- 12 registrarMantenimientosMensuales
CREATE EVENT registrarMantenimientosMensuales
ON SCHEDULE EVERY 1 MONTH
STARTS NOW() 
DO 
BEGIN
    INSERT INTO registros (fechaRegistro, mensaje)
    SELECT NOW(), CONCAT('Mantenimientos realizados: ', COUNT(*))
    FROM mantenimiento
    WHERE MONTH(mantenimiento.fechaInicio) = MONTH(NOW()) AND YEAR(fechaInicio) = YEAR(NOW());
END //

-- 13 productos en venta por más de 6 meses
CREATE EVENT notificarProductosEnVenta
ON SCHEDULE EVERY 1 MONTH STARTS NOW() 
DO
begin
    INSERT INTO alertas (fecha, mensaje)
    SELECT NOW(), CONCAT('Producto en venta por más de 6 meses: ', nombre)
    FROM productos
    WHERE productos.id IN (SELECT idProducto FROM inventarios WHERE estado = 'venta' AND fechaIngreso < DATE_SUB(NOW(), INTERVAL 6 MONTH));
end //

-- 14
CREATE EVENT notificarBajaProductividadParcelas
ON SCHEDULE EVERY 1 MONTH STARTS NOW()
DO
begin
    INSERT INTO alertas (fecha, mensaje)
    SELECT NOW(), CONCAT('Baja productividad en parcela: ', id)
    FROM parcelas
    WHERE cantidad < 100 AND fechaCultivo < DATE_SUB(NOW(), INTERVAL 1 YEAR);
end //

-- 15
CREATE EVENT calcularPromedioVentasSemanales
ON SCHEDULE EVERY 1 WEEK STARTS NOW()
DO
begin
    INSERT INTO registros (fechaRegistro, mensaje)
    SELECT NOW(), CONCAT('Promedio de ventas de la semana: ', AVG(total))
    FROM ventas
    WHERE WEEK(fecha) = WEEK(NOW()) AND YEAR(fecha) = YEAR(NOW());
end //

-- 16. alerta llegada nueva maquinaria
CREATE EVENT notificarNuevasMaquinarias
ON SCHEDULE EVERY 1 DAY STARTS NOW()
DO
begin
    INSERT INTO alertas (fecha, mensaje)
    SELECT NOW(), CONCAT('Nueva maquinaria en stock: ', modelo)
    FROM maquinarias
    WHERE fechaCompra >= DATE_SUB(NOW(), INTERVAL 1 DAY);
end //

-- 17 ACTUALIZAR PARCELAS ABANDONADAS
CREATE EVENT actualizarParcelasAbandonadas
ON SCHEDULE EVERY 1 YEAR STARTS NOW()
DO
BEGIN
    UPDATE parcelas
    SET cantidad = 0
    WHERE fechaCultivo < DATE_SUB(NOW(), INTERVAL 3 YEAR);
END //

-- 18 reporte proveedores
CREATE EVENT generarReporteDeProveedores
ON SCHEDULE EVERY 1 MONTH STARTS NOW()
DO
begin
    INSERT INTO registros (fechaRegistro, mensaje)
    SELECT NOW(), CONCAT('Total de compras del proveedor: ', proveedores.nombre, ' - ', SUM(compras.total))
    FROM proveedores JOIN compras ON proveedores.id = compras.idProveedor
    WHERE MONTH(compras.fecha) = MONTH(NOW()) AND YEAR(compras.fecha) = YEAR(NOW())
    GROUP BY nombre;
end //

-- 19 revisar stock en maquinas
CREATE EVENT verificarStockMaquinarias
ON SCHEDULE EVERY 6 MONTH STARTS NOW()
DO
begin
    INSERT INTO alertas (fecha, mensaje)
    SELECT NOW(), CONCAT('Stock de maquinarias bajo: ', modelo)
    FROM maquinarias
    WHERE cantidad < 2;
end //

-- 20 cantidad reparaciones maquinaria en seis meses
CREATE EVENT cantidadReparacionesMaquinarias
ON SCHEDULE EVERY 6 MONTH STARTS NOW()
DO
begin
    INSERT INTO registros (fechaRegistro, mensaje)
    SELECT NOW(), CONCAT('Cantidad de reparaciones de maquinarias en los últimos 6 meses: ', COUNT(mantenimiento.id))
    FROM mantenimiento
    WHERE mantenimiento.fechaInicio > DATE_SUB(NOW(), INTERVAL 6 MONTH);
end //
