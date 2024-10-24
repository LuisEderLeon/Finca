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

-- 2 --------------------------------------------------------------------------------------------------------------------------------------------------------------------
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
        insert into cultivo (idParcela, idEmpleado, idProducto, idMaquinaria, cantidad) values 
        (parcela, empleado, producto, maquinaria, cantidad);
        insert into registros (fechaRegistro, mensaje) values 
        (now(), concat("El empleado ", empleado, " cultivo el producto ", producto, " usando la maquina ", maquinaria, " en la parcela ",parcela));
    END IF;
end //

-- 3
create procedure cosechar (
    in parcela int,
    in empleado int,
    in maquinaria int
) begin
    declare productoACosechar int;
    declare cantidadACosechar int;
    SELECT productoEnParcela(parcela) INTO productoACosechar;
    select cantidad into cantidadACosechar from parcelas where id = parcela;

    IF productoACosechar IS NULL THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Este parcela no existe';
        insert into registros (fechaRegistro, mensaje) values (now(), "Se intento acceder a una parcela que no existe");
    ELSEIF productoACosechar = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Este parcela está vacía';
        insert into registros (fechaRegistro, mensaje) values (now(), "Se intento cosechar una parcela que esta vacia");
    ELSE
        insert into cosecha (idParcela, idEmpleado, idMaquinaria, cantidad) values (parcela, empleado, maquinaria, cantidadACosechar);
        insert into registros (fechaRegistro, mensaje) values (now(), concat("El empleado ", empleado, " cosecho el producto ", productoACosechar, " usando la maquina ", maquinaria, " en la parcela ",parcela));
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
    and exists (select 1 from maquinarias where id = maquinaria) then
        case
            when unidades = "segundos" then insert into mantenimiento (idEmpleado, idMaquinaria,fechaInicio, fechaFin) values
                (empleado, maquinaria, now(),date_add(now(), interval duracion second));
            when unidades = "minutos" then insert into mantenimiento (idEmpleado, idMaquinaria,fechaInicio, fechaFin) values
                (empleado, maquinaria, now(),date_add(now(), interval duracion minute));
            when unidades = "horas" then insert into mantenimiento (idEmpleado, idMaquinaria,fechaInicio, fechaFin) values
                (empleado, maquinaria, now(),date_add(now(), interval duracion hour));
            when unidades = "dias" then insert into mantenimiento (idEmpleado, idMaquinaria,fechaInicio, fechaFin) values
                (empleado, maquinaria, now(),date_add(now(), interval duracion day));
        end case;
    else
        insert into registros (fechaRegistro, mensaje) values
        (now(),concat("Se intento hacer un mantenimiento con una maquinaria/empleado inexistente"));
    end if;
end //

-- 9
create procedure actualizarPrecioProductos (
    in producto int,
    in nuevoPrecio double
) begin
    if exists (select 1 from productos where id = producto) then
        update productos set precio = nuevoPrecio where id = producto;
    else
        insert into registros (fechaRegistro, mensaje) values
        (now(),concat("Se intento actualizar el precio de un producto inexistente"));
    end if;
end //

-- 10 Agregar Producto: Inserta un nuevo producto en la tabla productos.
create procedure insertarProducto (
    in prodNombre varchar(50),
    in prodPrecio double,
    in prodIdTipo int,
    in prodUnidades enum("kilogramos","litros","unidades")
) begin
    if productoEnTipo(prodIdTipo) = 0 then
        insert into registros (fechaRegistro, mensaje) values
        (now(),concat("Se intento insertar un producto con tipo inexistente"));
    else
        INSERT INTO productos (nombre, precio, idTipo, unidades) 
        VALUES (prodNombre, prodPrecio, prodIdTipo, prodUnidades);
    end if;
end //

-- 11 Eliminar Producto: Elimina un producto de la base de datos, asegurando que no haya referencias en otras tablas.

CREATE PROCEDURE eliminarProducto (
    in idProductoEliminar int
)
begin
    declare contadour int;

    SELECT COUNT(*) INTO contadour
    FROM detallesVenta
    WHERE idProducto = idProductoEliminar;

    IF contadour > 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'El producto no se puede eliminar porque está en uso en la tabla detallesVenta';
    ELSE
        SELECT COUNT(*) INTO contadour
        FROM produccion
        WHERE idProducto = idProductoEliminar;

        IF contadour > 0 THEN
            SIGNAL SQLSTATE '45000' 
            SET MESSAGE_TEXT = 'El producto no se puede eliminar porque está en uso en la tabla produccion';
        ELSE
            SELECT COUNT(*) INTO contadour
            FROM cultivo
            WHERE idProducto = idProductoEliminar;
            -- es para ver siquiere eliminar un prodducto, que no esté en las otras tablas y ahi si lo elimine
            IF contadour > 0 THEN
                SIGNAL SQLSTATE '45000' 
                SET MESSAGE_TEXT = 'El producto no se puede eliminar porque está en uso en la tabla cultivo';
            ELSE
                SELECT COUNT(*) INTO contadour
                FROM parcelas
                WHERE idProducto = idProductoEliminar;

                IF contadour > 0 THEN
                    SIGNAL SQLSTATE '45000' 
                    SET MESSAGE_TEXT = 'El producto no se puede eliminar porque está en uso en la tabla parcelas';
                ELSE
                    -- si no hay eliminarlo
                    DELETE FROM productos 
                    WHERE id = idProductoEliminar;
                END IF;
            END IF;
        END IF;
    END IF;
end //

-- 12
create procedure eliminarProductoVenta (
    in producto int,
    in venta int
) begin
    if exists (select 1 from detallesVenta where idVenta = venta and idProducto = producto) then
        delete from detallesVenta where idProducto = producto and idVenta = venta;
    else
        insert into registros (fechaRegistro, mensaje) values
        (now(),concat("Se intento eliminar un registro inexistente en detallesVenta"));
    end if;
end //


-- 13 
CREATE PROCEDURE completarVenta (
    in venta int
)
begin
    DECLARE stockDisponible INT;
    DECLARE stockARestar INT;
    DECLARE productoAVender INT;
    
    while exists (select 1 from detallesVenta where idVenta = venta) do
        SELECT cantidad, idProducto INTO stockARestar, productoAVender FROM detallesVenta WHERE idVenta = venta LIMIT 1;
        
        SELECT stockALaVenta(productoAVender) INTO stockDisponible;
        
        WHILE stockDisponible <= stockARestar DO
            SET stockARestar = stockARestar - stockDisponible;
            
            DELETE FROM inventarios WHERE estado = "venta" AND idProducto = productoAVender;

            UPDATE inventarios SET estado = "venta" WHERE idProducto = productoAVender
            ORDER BY fechaIngreso LIMIT 1;

            SELECT stockALaVenta(productoAVender) INTO stockDisponible;
        END WHILE;
        
        DELETE FROM detallesVenta WHERE idVenta = venta AND idProducto = productoAVender;
    end while;
    delete from ventas where id = venta;
end//

-- 14 Consultar Animales por Especie: Devuelve todos los animales de una especie específica. 
CREATE PROCEDURE consultarAnimalesPorEspecie (
    in pIdEspecie int
)
begin
    select especie.nombre, animales.* from animales join especie on especie.id = animales.idEspecie
    WHERE animales.idEspecie = pIdEspecie;
end //

-- 15 Calcular Total Ventas: Suma el total de todas las ventas en un periodo determinado.
CREATE PROCEDURE totalVentasTiempoEspecifico (
    in pfechaInicial date,
    in medicionTiempo enum("dias","semanas","meses"),
    in cantidadTiempo int,
    out pTotalVentas double
)
begin
    declare pFechaFinal date;
    IF medicionTiempo = "dias" THEN
        SET pFechaFinal = DATE_ADD(p_fechaInicial, INTERVAL cantidadTiempo DAY);
    ELSEIF medicionTiempo = "semanas" THEN
        SET pFechaFinal = DATE_ADD(p_fechaInicial, INTERVAL cantidadTiempo WEEK);
    ELSEIF medicionTiempo = "meses" THEN
        SET pFechaFinal = DATE_ADD(p_fechaInicial, INTERVAL cantidadTiempo MONTH);
    ELSE
        SET pTotalVentas = 0; 
    END IF;

    if pTotalVentas<>0 then
        select sum(ventas.total) into pTotalVentas from ventas where ventas.fecha >= pfechaInicial and ventas.fecha <= pFechaFinal;
    end if;

end //

-- 16 Actualizar Estado de Salud de Animal: Cambia el estado de salud de un animal específico.
CREATE PROCEDURE cambiarEstadoSaludAnimal (
    in pIdAnimal int,
    in pEstadoSalud enum("saludable","enfermo","muerto")
)
begin
    UPDATE animales set `estadoSalud` = pEstadoSalud where id = pIdAnimal;
end //

-- 17 Registrar Alimento Consumido por Animal: Inserta un registro de alimento consumido para un animal.
CREATE PROCEDURE alimentosCantidadConsumidaAnimal (
    in pIdAniaml int
)
begin
    declare idEspecie INT;
    SELECT especies.nombre, animales.cantidadAlimento
    from animales
    JOIN especies ON especies.idAnimal = animales.id
    join especieAlimento on especieAlimento.idEspecie = especies.id
    join alimentos on alimentos.id = especieAlimento.idAlimento;
end //

-- 18 Generar Reporte de Inventario: Devuelve un reporte del inventario de productos y maquinarias.
create procedure reporteInventario () begin
    INSERT INTO registros (fechaRegistro, mensaje)
    select now(), concat('El producto ',productos.nombre,' cuenta con un total de ',totalEnInventario(id),' ',productos.unidades,' en el inventario') from productos;
end //

-- 19 Actualizar Datos del Proveedor: Modifica la información de un proveedor existente.
create procedure modificarProveedor (
    in proveedor int,
    in nombreNuevo varchar(50),
    in telefonoNuevo varchar(15)
) begin
    update proveedores set nombre = nombreNuevo, telefono = telefonoNuevo where id = proveedor;
end //

-- 20 Consultar Productos por Tipo: Devuelve todos los productos de un tipo específico.
create procedure productosPorTipo (in tipo int) begin
    select * from productos where idTipo = tipo;
end //

delimiter ;