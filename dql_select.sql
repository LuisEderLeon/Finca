-- 1
SELECT produccion.id, especies.nombre as especie, productos.nombre as producto, empleados.nombre as empleado, funciones.nombre  as funcion, concat(maquinarias.marca, " ", maquinarias.modelo) as maquinaria FROM produccion 
JOIN animales ON animales.id = produccion.idAnimal
JOIN especies ON especies.id = animales.idEspecie
JOIN productos ON productos.id = produccion.idProducto
JOIN empleados ON empleados.id = produccion.idEmpleado
JOIN funciones ON funciones.id = empleados.idFuncion
JOIN maquinarias ON maquinarias.id = produccion.idMaquinaria;

-- 2
select alimentos.id, alimentos.nombre, especies.nombre from alimentos
LEFT JOIN animales on animales.idAlimento = alimentos.id
LEFT JOIN especies on especies.id = animales.idEspecie;

-- 3
SELECT * from alimentos;

-- 4
SELECT * FROM empleados
JOIN funciones ON funciones.id = empleados.idFuncion
WHERE funciones.nombre = "Gestión de animales";

-- 5
select * from cosecha;

insert into ventas(fecha,idCliente,total) values
(curdate(),1,0);

insert into detallesventa (idVenta,idProducto,cantidad,subtotal) VALUES
(1,1,500,50);
select * from cosecha;
SELECT * FROM compraalimentos;
select * from alimentos;
select * from productos;
select * from detallesventa;

select * from compras;
select * from compramaquinaria;
