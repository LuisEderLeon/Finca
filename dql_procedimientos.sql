DELIMITER //

-- 1
CREATE PROCEDURE matarAnimal (
    IN empleado INT, 
    IN animal INT, 
    IN maquinaria INT, 
    IN cantidadCarne INT, 
    IN cantidadExtra INT
) BEGIN
    DECLARE especie VARCHAR(50);
    SELECT nombreEspecie(animal) INTO especie;

    IF especie = 'Vaca' THEN
        INSERT INTO produccion (idAnimal, idProducto, idEmpleado, idMaquinaria, cantidad) VALUES 
        (animal, 6, empleado, maquinaria, cantidadCarne), -- res
        (animal, 46, empleado, maquinaria, cantidadExtra); -- cuero
    
    ELSEIF especie = 'Oveja' THEN
        INSERT INTO produccion (idAnimal, idProducto, idEmpleado, idMaquinaria, cantidad) VALUES 
        (animal, 36, empleado, maquinaria, cantidadCarne), -- cordero
        (animal, 39, empleado, maquinaria, cantidadExtra); -- lana

    ELSEIF especie = 'Cabra' THEN
        INSERT INTO produccion (idAnimal, idProducto, idEmpleado, idMaquinaria, cantidad) VALUES 
        (animal, 46, empleado, maquinaria, cantidadExtra); -- cuero

    ELSEIF especie = 'Pollo' THEN
        INSERT INTO produccion (idAnimal, idProducto, idEmpleado, idMaquinaria, cantidad) VALUES 
        (animal, 18, empleado, maquinaria, cantidadCarne), -- pollo
        (animal, 43, empleado, maquinaria, cantidadExtra); -- plumas

    ELSEIF especie = 'Cerdo' THEN
        INSERT INTO produccion (idAnimal, idProducto, idEmpleado, idMaquinaria, cantidad) VALUES 
        (animal, 19, empleado, maquinaria, cantidadCarne), -- cerdo
        (animal, 42, empleado, maquinaria, cantidadExtra); -- chorizo

    ELSEIF especie = 'Colmena de abejas' THEN
        INSERT INTO produccion (idAnimal, idProducto, idEmpleado, idMaquinaria, cantidad) VALUES 
        (animal, 27, empleado, maquinaria, cantidadExtra); -- miel

    ELSEIF especie = 'Pato' THEN
        INSERT INTO produccion (idAnimal, idProducto, idEmpleado, idMaquinaria, cantidad) VALUES 
        (animal, 8, empleado, maquinaria, cantidadCarne), -- pato
        (animal, 43, empleado, maquinaria, cantidadExtra); -- plumas

    ELSEIF especie = 'Caballo' THEN
        INSERT INTO produccion (idAnimal, idProducto, idEmpleado, idMaquinaria, cantidad) VALUES 
        (animal, 46, empleado, maquinaria, cantidadExtra); -- cuero
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Este animal no tiene una especie valida';
    END IF;

    UPDATE animales SET estadoSalud = 'muerto' WHERE id = animal;
END //

-- 2
create procedure cultivar (
    in producto int,
    in parcela int,
    in empleado int,
    in maquinaria int,
    in cantidad int
) begin
    declare productoACultivar int;
    SELECT productoEnParcela(parcela) INTO productoACultivar;
    
    IF productoACultivar IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Esta parcela no existe';
        insert into registros (fechaRegistro, mensaje) values (now(), "Se intento acceder a una parcela que no existe");
    ELSEIF productoACultivar <> 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Esta parcela no está vacía';
        insert into registros (fechaRegistro, mensaje) values (now(), "Se intento cultivar una parcela que no esta vacia");
    ELSE
        update parcelas set idProducto =  producto, cantidad = cantidad, fechaCultivo = now() 
        where id = parcela;
        insert into cosecha (idParcela, idEmpleado, idMaquinaria, cantidad) values (parcela, empleado, maquinaria, cantidad);
        insert into registros (fechaRegistro, mensaje) values (now(), concat("El empleado ", empleado, " cultivo el producto ", producto, " usando la maquina ", maquinaria, " en la parcela ",parcela));
    END IF;
end //

-- 3
create procedure cosechar (
    in producto int,
    in parcela int,
    in empleado int,
    in maquinaria int,
    in cantidad int
) begin
    declare productoACosechar int;
    SELECT productoEnParcela(parcela) INTO productoACosechar;

    IF productoACosechar IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Este parcela no existe';
        insert into registros (fechaRegistro, mensaje) values (now(), "Se intento acceder a una parcela que no existe");
    ELSEIF productoACosechar <> 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Este parcela no está vacía';
        insert into registros (fechaRegistro, mensaje) values (now(), "Se intento cosechar una parcela que esta vacia");
    ELSE
        update parcelas set idProducto =  0, cantidad = 0 where id = parcela;
        insert into cosecha (idParcela, idEmpleado, idMaquinaria, cantidad) values (parcela, empleado, maquinaria, cantidad);
        insert into registros (fechaRegistro, mensaje) values (now(), concat("El empleado ", empleado, " cosecho el producto ", producto, " usando la maquina ", maquinaria, " en la parcela ",parcela));
    end if;
end //

-- 4
create procedure añadirProductosVenta (
    in venta int,
    in producto int,
    in cantidad int
) begin
    if EXISTS (SELECT 1 FROM productos WHERE id = producto)
    and EXISTS (SELECT 1 FROM ventas WHERE id = venta)
    and cantidad > 0 then
        insert into detallesVenta (idVenta, idProducto, cantidad, subtotal) values
        (venta, producto, cantidad, 0);
        insert into registros (fechaRegistro, mensaje) values
        (now(),concat("Se añadieron productos a una venta"));
    else
        insert into registros (fechaRegistro, mensaje) values
        (now(),concat("Se intento añadir un producto/cantidad no valida a una venta"));
    end if;
end //

-- 5
CREATE PROCEDURE crearVentaNueva (
    in empleado int,
    in cliente int
) BEGIN
    if exists (select 1 from empleados where id = empleado)
    and exists (select 1 from clientes where id = cliente) then
        insert into ventas (fecha, idCliente, idEmpleado, total) values
        (now(),cliente, empleado, 0);
        insert into registros (fechaRegistro, mensaje) values
        (now(),concat("Se creo una nueva venta"));
    else
        insert into registros (fechaRegistro, mensaje) values
        (now(),concat("Se intento crear una venta con un empleado/cliente no valido"));
    end if;
end //

-- 6
create procedure eliminarVenta (
    in venta int
) begin
    if exists (select 1 from ventas where id = venta) then
        delete from detallesVenta where idVenta = venta;
        delete from ventas where id = venta;
        insert into registros (fechaRegistro, mensaje) values
        (now(),concat("Se elimino una venta"));
    else
        insert into registros (fechaRegistro, mensaje) values
        (now(),concat("Se intento eliminar una venta no existente"));
    end if;
end //

-- 7
create procedure eliminarCliente (
    in cliente int
) begin
    if exists (select 1 from clientes where id = cliente) then
        if exists (select count(*) from ventas where idCliente = cliente) then
            insert into registros (fechaRegistro, mensaje) values
            (now(),concat("Se intento eliminar un cliente con ventas"));
        else 
            delete from clientes where id = cliente;
            insert into registros (fechaRegistro, mensaje) values
            (now(),concat("Se elimino un cliente"));
        end if;
    else
        insert into registros (fechaRegistro, mensaje) values
        (now(),concat("Se intento eliminar un cliente no existente"));
    end if;
end //

-- 8
create procedure mantenimientoMaquinaria (
    in empleado int,
    in maquinaria int,
    in duracion int,
    in unidades enum("segundos","minutos","horas","dias")
) begin
    if exists (select 1 from empleados where id = empleado)
    and exists (select 1 from maquinaria where id = maquinaria) then
        insert into mantenimiento (idEmpleado, idMaquinaria,fechaInicio, fechaFin) values
        (empleado, maquinaria, now(),date_add(now(), case
            when unidades = "segundos" then interval duracion second
            when unidades = "minutos" then interval duracion minute
            when unidades = "horas" then interval duracion hour
            when unidades = "dias" then interval duracion day));
        update maquinarias set estado = "mantenimiento" where id = maquinaria;
            insert into registros (fechaRegistro, mensaje) values
            (now(),concat("Se puso la maquinaria ", maquinaria, " en mantenimiento por ", duracion, " ",unidades));
    else
        insert into registros (fechaRegistro, mensaje) values
        (now(),concat("Se intento hacer un mantenimiento con una maquinaria/empleado inexistente"));
    end if;
end //