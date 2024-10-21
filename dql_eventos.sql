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
    where estado = "uso" and datediff((select max(MAntenimiento.fEchaFin) from Mantenimiento where Mantenimiento.fechaFin < now() and Mantenimiento.iDMaquinaria = Maq.id), fechaCompra) >= 10;
end //

-- 4
create event actualizarEstadoMaquinarias
on schedule every 1 day
starts now() do begin
    update maquinarias set estado = "stock" where id in (select idMaquinaria from mantenimiento where fechaFin <= now())
end //

DELIMITER ;
