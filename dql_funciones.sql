DELIMITER //

-- 1
create function nombreEspecie (idAnimal int)
returns varchar(50)
DETERMINISTIC
begin 
    declare nombre varchar(50);
    select especie.nombre into nombre from animales
    join especies on animales.idEspecie = especies.id;
    return nombre;
end //

-- 2
create function productoEnParcela (idParcela int)
returns int
DETERMINISTIC
begin
    return (select idProducto from parcelas where id = idParcela);
end //

-- 3
create function existenProductosAVender (producto int)
returns int
DETERMINISTIC
begin
    return (select count(*) from inventarios 
    where idProducto = producto and estado = "venta");
end //

-- 4
create function stockALaVenta (producto int)
returns int
DETERMINISTIC
begin
    return (SELECT cantidad FROM inventarios 
    WHERE idProducto = producto and estado = "venta");
end //