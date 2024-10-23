-- SQLBook: Code
-- 1. Listar todos los productos.
select productos.nombre, precio, tiposProducto.nombre as tipo from productos
join tiposProducto on productos.idTipo = tiposProducto.id;

-- 1
SELECT produccion.id, especies.nombre as especie, productos.nombre as producto, empleados.nombre as empleado, funciones.nombre  as funcion, concat(maquinarias.marca, " ", maquinarias.modelo) as maquinaria FROM produccion 
JOIN animales on animales.id = produccion.idAnimal
JOIN especies on especies.id = animales.idEspecie
JOIN productos on productos.id = produccion.idProducto
JOIN empleados on empleados.id = produccion.idEmpleado
JOIN funciones on funciones.id = empleados.idFuncion
JOIN maquinarias on maquinarias.id = produccion.idMaquinaria;

-- 2
select cosechas.id, especies

-- 3
SELECT * FROM alimentos;

-- 4
SELECT * FROM empleados
JOIN funciones on funciones.id = empleados.idFuncion
WHERE funciones.nombre = "Gestión de animales";

SELECT * FROM empleados
JOIN funciones on funciones.id = empleados.idFuncion
WHERE funciones.nombre = "Gestión de cultivos";

-- 5
SELECT * FROM cosecha;

insert into ventas(fecha,idCliente,idEmpleado,total) values
(curdate(),1,0);

call crearVentaNueva(1,1);

call añadirProductosVenta(1,3,50);

insert into detallesVenta (idVenta,idProducto,cantidad,subtotal) vAlues
(1,3,50,50);
SELECT * FROM inventarios;



SELECT * FROM registros;
SELECT * FROM compras;
SELECT * FROM alertas;
SELECT * FROM ventas;
SELECT * FROM detallesVenta;

insert into alertas (fecha, mensaje)
    select now(), concat("Recordatorio: realizar mantenimiento de ", Maq.marca, " ", Maq.modelo," id: ",Maq.id) 
    from maquinarias Maq
    where datediff(now(),(select MAX(mantenimiento.fechaFin) from mantenimiento where mantenimiento.fechaFin < now() and mantenimiento.iDMaquinaria = Maq.id)) >= 100;

SELECT fechaUltimaReparacionMaquinaria(1);
-- consulta
SELECT compras.*, GROUP_CONCA(distinct compraAlimentos.subtotal separator "\n") as alimentos, GROUP_CONCA(distinct compraMaquinaria.subtotal separator "\n") as maquinaria, GROUP_CONCA(distinct animales.precio separator "\n") as animales FROM compras 
LEFT JOIN compraAlimentos on compras.id = compraAlimentos.idCompra
LEFT JOIN compraMaquinaria on compras.id = compraMaquinaria.idCompra
LEFT JOIN compraAnimales on compras.id = compraAnimales.idCompra
LEFT JOIN animales on compraAnimales.idAnimal = animales.id
group by compras.id;

SELECT * FROM compramaquinaria;
SELECT * FROM alimentos;
SELECT * FROM alertas;

-- no quitar --------------------------------------------------
SELECT NOW(), CONCAT('bajo stock de ', productos.nombre) 
    FROM productos
    WHERE productos.id IN (SELECT idProducto FROM inventarios WHERE estado = 'stock' AND cantidad <= 10);
    
SELECT MAX(mantenimiento.fechaFin) FROM mantenimiento WHERE mantenimiento.fechaFin < NOW() AND mantenimiento.idMaquinaria = 1;

-------------------------
2. Obtener productos por tipo.
3. Calcular el total de ventas por cliente.
4. Obtener el stock de un producto específico.
5. Listar todos los empleados.
6. Obtener el historial de compras de un proveedor.
7. Calcular el total de producción por animal.
8. Listar todas las maquinarias en mantenimiento.
9. Obtener los animales en estado "saludable".
10. Listar los cultivos realizados en una parcela.
11. Obtener el total de compras realizadas en un mes.
12. Listar las alertas recientes.
13. Obtener el total de ingresos por ventas.
14. Listar los alimentos y su stock.
15. Obtener la edad de un cliente.
16. Listar las funciones de los empleados.
17. Obtener los detalles de una venta específica.
18. Listar todos los tipos de productos.
19. Obtener el costo total de un proyecto agrícola.
20. Listar las máquinas disponibles para uso.
21. Calcular el total de gastos en mantenimiento.
22. Listar los animales comprados en una compra específica.
23. Obtener el total de unidades vendidas por producto.
24. Listar los cultivos de un empleado específico.
25. Obtener las fechas de cosecha de parcelas.
26. Listar los clientes que han realizado más de 5 compras.
27. Obtener el total de alimentos comprados en un periodo.
28. Listar todas las parcelas y sus áreas.
29. Obtener la cantidad de productos vendidos en un mes.
30. Listar todos los proveedores y sus contactos.
31. Obtener el total de maquinaria en stock.
32. Listar los registros de actividad.
33. Obtener el precio promedio de un tipo de alimento.
34. Listar los empleados contratados en el último año.
35. Obtener el total de compras agrupadas por proveedor.
36. Listar todos los animales por especie.
37. Obtener el total de producción por empleado.
38. Listar las ventas realizadas en un rango de fechas.
39. Obtener el estado de salud promedio de los animales.
40. Listar los tipos de alimentos y su costo.
41. Obtener las máquinas utilizadas en una producción específica.
42. Listar los registros de mantenimiento por empleado.
43. Obtener el total de ganancias por producto.
44. Listar las especies y sus respectivos alimentos.
45. Obtener los empleados asignados a cada función.
46. Listar los detalles de una compra específica.
47. Obtener el total de unidades de cada tipo de producto.
48. Listar las parcelas por área.
49. Obtener la cantidad de animales en cada estado de salud.
50. Listar los clientes que no han realizado compras en el último año.
51. Obtener el costo total de los animales en stock.
52. Listar todos los cultivos realizados en el último año.
53. Obtener el total de ventas por empleado.
54. Listar los proveedores con los que se ha trabajado más.
55. Obtener el total de maquinaria comprada en un periodo.
56. Listar los alimentos consumidos por animales específicos.
57. Obtener el total de ingresos por tipo de producto.
58. Listar las ventas con descuentos aplicados.
59. Obtener el precio de un producto por nombre.
60. Listar los empleados que trabajan en el área de ventas.
61. Obtener la producción total de una parcela.
62. Listar los animales nacidos en un año específico.
63. Obtener el total de alimentos en stock.
64. Listar las maquinarias por estado.
65. Obtener el costo total de los cultivos.
66. Listar las especies con mayor cantidad de alimentos.
67. Obtener el rendimiento promedio de un cultivo.
68. Listar todos los empleados y sus teléfonos.
69. Obtener la fecha de la última compra de un alimento.
70. Listar las ventas realizadas por cada cliente.
71. Obtener el total de animales vendidos en un mes.
72. Listar los registros de alertas por fecha.
73. Obtener el costo total de mantenimiento de maquinarias.
74. Listar todos los animales y sus precios.
75. Obtener el total de cultivos realizados por empleado.
76. Listar las compras agrupadas por fecha.
77. Obtener el total de ingresos por cliente.
78. Listar los productos con menor stock.
79. Obtener la cantidad de ventas por tipo de producto.
80. Listar las maquinarias utilizadas en las cosechas.
81. Obtener el total de animales comprados por especie.
82. Listar los cultivos realizados por tipo de producto.
83. Obtener el total de ventas en un rango de fechas.
84. Listar los clientes con mayor gasto.
85. Obtener la cantidad de maquinaria en uso.
86. Listar los productos que no han sido vendidos.
87. Obtener el total de costos por empleado.
88. Listar todas las alertas activas.
89. Obtener la producción promedio de un animal.
90. Listar todos los empleados por fecha de contratación.
91. Obtener el costo total de alimentos por especie.
92. Listar las funciones con el número de empleados.
93. Obtener la cantidad de cultivos por parcela.
94. Listar las compras por tipo de maquinaria.
95. Obtener el total de ingresos por mes.
96. Listar todos los animales y su estado de salud.
97. Obtener el total de ventas agrupadas por producto.
98. Listar los alimentos con más de un proveedor.
99. Obtener el costo total de producción por empleado.
100. Listar todas las parcelas y su estado.