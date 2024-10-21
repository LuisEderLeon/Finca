DELIMITER //

-- 1
create function nombreEspecie (idAnimal int)
begin 
    declare nombre varchar(50);
    select especie.nombre into nombre from animales
    join especies on animales.idEspecie = especies.id;
    return nombre;
end //

-- 2
create function productoEnParcela (idParcela int)
begin
    return (select idProducto from parcelas where id = idParcela);
end //

-- 3
create function existenProductosAVender (producto int)
begin
    return (select count(*) from inventarios 
    where idProducto = producto and estado = "venta")
end //

-- 4
create function stockALaVenta (producto int)
begin
    return (SELECT cantidad FROM inventarios 
    WHERE idProducto = producto and estado = "venta";)
end //