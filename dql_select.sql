SELECT produccion.id, especies.nombre, productos.nombre, empleados.nombre, funciones.nombre, maquinarias.marca FROM produccion 
JOIN animales ON animales.id = produccion.idAnimal
JOIN especies ON especies.id = animales.idEspecie
JOIN productos ON productos.id = produccion.idProducto
JOIN empleados ON empleados.id = produccion.idEmpleado
JOIN funciones ON funciones.id = empleados.idFuncion
JOIN maquinarias ON maquinarias.id = produccion.idMaquinaria;

select alimentos.id, alimentos.nombre, especies.nombre from alimentos
LEFT JOIN animales on animales.idAlimento = alimentos.id
LEFT JOIN especies on especies.id = animales.idEspecie;

SELECT * from inventarios;

SELECT * FROM empleados
JOIN funciones ON funciones.id = empleados.idFuncion
WHERE funciones.nombre = "Gestión de animales";