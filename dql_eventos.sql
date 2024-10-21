DELIMITER //

 -- 1
create event notificarBajoStock
on schedule every 1 day 
starts now() do begin 
    insert into alertas (fecha, mensaje)
    select now(), concat('Bajo stock de ', alimentos.nombre) 
    from alimentos
    where stock <= 10;
end //

-- 2
create event notificarBajoStockProductos
on schedule every 1 day 
starts now() do begin 
    insert into alertas (fecha, mensaje)
    select now(), concat('Bajo stock de ', productos.nombre) 
    from productos
    where totaleninventario(productos.id) <= 10;
end //

-- 3
create event recordarMantenimientoMaquinarias
on schedule every 30 day 
starts now() do begin 
    insert into alertas (fecha, mensaje)
    select now(), concat('Recordatorio: realizar mantenimiento de ', maquinarias.marca, ' ', maquinarias.modelo) 
    from maquinarias Maq
    where datediff((select max(MAntenimiento.fEchaFin) from Mantenimiento where Mantenimiento.fechaFin < now() and Mantenimiento.iDMaquinaria = Maq.id), fechaCompra) >= 10;
end //

-- 4
create event actualizarEstadoMaquinarias
on schedule every 1 day
starts now() do begin
    update maquinarias set estado = "stock" where id in (select idMaquinaria from mantenimiento where fechaFin <= now());
end //

-- 5
CREATE EVENT notificarMantenimientoParcelas
ON SCHEDULE EVERY 60 DAY 
DO
BEGIN 
    INSERT INTO alertas (fecha, mensaje)
    SELECT NOW(), CONCAT("Revisar mantenimiento de la parcela" , id) 
    FROM parcelas 
    WHERE DATEDIFF(NOW(), fechaCultivo) >= 180;
END //
-- 6
CREATE EVENT notificarEnfermedadesAnimales
ON SCHEDULE EVERY 1 WEEK 
DO
BEGIN 
    INSERT INTO alertas (fecha, mensaje)
    SELECT NOW(), CONCAT("Revisión necesaria para animales enfermos") 
    FROM animales 
    WHERE estadoSalud = "enfermo";
END //
-- 7
CREATE EVENT notificarProximasCosechas
ON SCHEDULE EVERY 2 WEEK
DO
BEGIN 
    INSERT INTO alertas (fecha, mensaje)
    SELECT NOW(), CONCAT('fecha de cosecha proxima ', id) 
    FROM cosecha 
    WHERE DATEDIFF(NOW(), fecha) <= 7;
END //
-- 8
CREATE EVENT actualizarPrecioProductos
ON SCHEDULE EVERY 1 YEAR 
DO
BEGIN 
    UPDATE productos SET precio = precio * 1.08;
END //

-- 9
DELIMITER ;
