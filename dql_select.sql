select produccion.id, especies.nombre, productos.nombre, empleados.nombre, funciones.nombre, maquinarias.marca from produccion 
join animales on animales.id = produccion.idAnimal
join especies on especies.id = animales.idEspecie
join productos on productos.id = produccion.idProducto
join empleados on empleados.id = produccion.idEmpleado
join funciones on funciones.id = empleados.idFuncion
join maquinarias on maquinarias.id = produccion.idMaquinaria;

select * FROM empleados
join funciones on funciones.id = empleados.idFuncion
where funciones.nombre = "Gestión de animales";