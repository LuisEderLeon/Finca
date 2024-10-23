-- 1. Listar todos los productos.
select productos.nombre, precio, tiposProducto.nombre as tipo from productos
join tiposProducto on productos.idTipo = tiposProducto.id order by productos.id;

-- 2. Obtener productos de tipo agricola.
call productosPorTipo(1);

-- 3. Calcular el total de compras por cliente.
select clientes.nombre, sum(ventas.total) as totalDeuda from clientes
join ventas on clientes.id = idCliente order by clientes.id;

-- 4. Obtener el stock de un producto específico.
select productos.nombre, sum(inventarios.cantidad) from inventarios 
join productos on productos.id = inventarios.idProducto
where inventarios.idProducto = 5 and inventarios.estado = "stock";

-- 5. Listar todos los empleados.
select empleados.nombre, empleados.telefono, empleados.fechaContratacion, funciones.nombre as Funcion from empleados
join funciones on funciones.id = empleados.idFuncion;

-- 6. Obtener el historial de compras del proveedor 1.
select fecha, total from compras where idProveedor = 1;

-- 7. Calcular el total de producción por animal.
select GROUP_CONCAT(distinct productos.nombre, ": ",produccion.cantidad separator " \n") as produccion from animales
left join produccion on produccion.idAnimal = animales.id
left join productos on produccion.idProducto = productos.id
group by animales.id order by animales.id;

-- 8. Listar todas las maquinarias en mantenimiento.
select concat(maquinarias.marca," ",maquinarias.modelo) as Nombre  from maquinarias join mantenimiento on mantenimiento.idMaquinaria = maquinarias.id
where mantenimiento.fechaFin > now();

-- 9. Obtener los animales en estado "saludable".
select animales.id, especies.nombre ,animales.estadoSalud, TIMESTAMPDIFF(YEAR, animales.fechaNacimiento, CURDATE()) as edadAños
from animales
join especies on especies.id = animales.idEspecie
where animales.estadoSalud = "saludable";

-- 10. Listar los cultivos realizados en una parcela.
SELECT cultivo.id, productos.nombre, cultivo.cantidad, empleados.nombre, maquinarias.marca, maquinarias.modelo FROM cultivo
JOIN parcelas ON cultivo.idParcela = parcelas.id
JOIN productos ON cultivo.idProducto = productos.id
JOIN empleados ON cultivo.idEmpleado = empleados.id
JOIN maquinarias ON cultivo.idMaquinaria = maquinarias.id
WHERE cultivos.idParcela = 1;

-- 11. Obtener el total de compras realizadas hace menos de un mes.
select fechaCompra, total, proveedores.nombre from compras
join proveedores on compras.idProveedor = proveedores.id
where fechaCompra > date_sub(fechaCompra INTERVAL 1 month);

-- 12. Listar todas las alertas.
select fecha, mensaje from alertas;

-- 13. Obtener el total de ingresos de las ventas.
select sum(total) as total from ventas;

-- 14. Listar los alimentos y su stock.
select nombre, precio, stock from alimentos;

-- 15. Obtener las edades de los clientes.
select nombre, telefono, consultarEdad(id, "clientes") as edad from clientes;

-- 16. Listar las funciones con su cantidad de empleados.
select funciones.nombre, count(empleados.id) from funciones
left join empleados on empleados.idFuncion = funciones.id
group by funciones.id order by funciones.id;

-- 17. Obtener los detalles de las ventas.
select ventas.fecha, empleados.nombre as empleado, clientes.nombre as cliente, GROUP_CONCAT(productos.nombre, ': ', detallesVenta.cantidad separator '\n'), ventas.total from ventas
left join detallesVenta on ventas.id = detallesVenta.idVenta
left join empleados on empleados.id = ventas.idEmpleado
left join clientes on clientes.id = ventas.idCliente
left join productos on productos.id = detallesVenta.idProducto
group by ventas.id order by ventas.id;

-- 18. Listar todos los tipos de productos.
select nombre from tiposProducto;

-- 19. Mostrar los productos con un stock menor a 10.
SELECT NOW(), CONCAT('bajo stock de ', productos.nombre) as alerta
FROM productos
WHERE totalEnInventario(productos.id) <= 10;

-- 20. Listar las máquinas disponibles para uso.
select marca, modelo, cantidad from maquinarias where estado = "uso";

-- 21. Mostrar todos los mantenimientos realizados.
select empleados.nombre, as empleado maquinarias.marca, maquinarias.modelo, fechaInicio, fechaFin from mantenimiento
join empleados on empleados.id = mantenimiento.idEmpleado
join maquinarias on maquinarias.id = mantenimiento.idMaquinaria;

-- 22. Listar los animales comprados en una compra específica.
select idAnimal from compraAnimales where idCompra = 1;

-- 23. Obtener el total de unidades vendidas por producto.
select productos.nombre, sum(detallesVenta.cantidad) from productos
left join detallesVenta on productos.id = detallesVenta.idProducto
group by productos.id;

-- 24. Listar los cultivos de un empleado específico.
select idParcela, productos.nombre as producto, maquinarias.marca, maquinarias.modelo from cultivo
join productos on cultivo.idProducto = productos.id
join maquinarias on cultivo.idMaquinaria = maquinarias.id
where idEmpleado = 1;

-- 25. Obtener las fechas de cosecha de parcelas.
select id, fechaCultivo from parcelas where idProducto = 0;

-- 26. Listar los clientes que han realizado más de 5 compras.

-- 27. Obtener el total de alimentos comprados en un periodo.

-- 28. Listar todas las parcelas y sus áreas.

-- 29. Obtener la cantidad de productos vendidos en un mes.

-- 30. Listar todos los proveedores y sus contactos.

-- 31. Obtener el total de maquinaria en stock.

-- 32. Listar los registros de actividad.

-- 33. Obtener el precio promedio de un tipo de alimento.

-- 34. Listar los empleados contratados en el último año.

-- 35. Obtener el total de compras agrupadas por proveedor.

-- 36. Listar todos los animales por especie.

-- 37. Obtener el total de producción por empleado.

-- 38. Listar las ventas realizadas en un rango de fechas.

-- 39. Obtener el estado de salud promedio de los animales.

-- 40. Listar los tipos de alimentos y su costo.

-- 41. Obtener las máquinas utilizadas en una producción específica.

-- 42. Listar los registros de mantenimiento por empleado.

-- 43. Obtener el total de ganancias por producto.

-- 44. Listar las especies y sus respectivos alimentos.

-- 45. Obtener los empleados asignados a cada función.

-- 46. Listar los detalles de una compra específica.

-- 47. Obtener el total de unidades de cada tipo de producto.

-- 48. Listar las parcelas por área.

-- 49. Obtener la cantidad de animales en cada estado de salud.

-- 50. Listar los clientes que no han realizado compras en el último año.

-- 51. Obtener el costo total de los animales en stock.

-- 52. Listar todos los cultivos realizados en el último año.

-- 53. Obtener el total de ventas por empleado.

-- 54. Listar los proveedores con los que se ha trabajado más.

-- 55. Obtener el total de maquinaria comprada en un periodo.

-- 56. Listar los alimentos consumidos por animales específicos.

-- 57. Obtener el total de ingresos por tipo de producto.

-- 58. Listar las ventas con descuentos aplicados.

-- 59. Obtener el precio de un producto por nombre.

-- 60. Listar los empleados que trabajan en el área de ventas.

-- 61. Obtener la producción total de una parcela.

-- 62. Listar los animales nacidos en un año específico.

-- 63. Obtener el total de alimentos en stock.

-- 64. Listar las maquinarias por estado.

-- 65. Obtener el costo total de los cultivos.

-- 66. Listar las especies con mayor cantidad de alimentos.

-- 67. Obtener el rendimiento promedio de un cultivo.

-- 68. Listar todos los empleados y sus teléfonos.

-- 69. Obtener la fecha de la última compra de un alimento.

-- 70. Listar las ventas realizadas por cada cliente.

-- 71. Obtener el total de animales vendidos en un mes.

-- 72. Listar los registros de alertas por fecha.

-- 73. Obtener el costo total de mantenimiento de maquinarias.

-- 74. Listar todos los animales y sus precios.

-- 75. Obtener el total de cultivos realizados por empleado.

-- 76. Listar las compras agrupadas por fecha.

-- 77. Obtener el total de ingresos por cliente.

-- 78. Listar los productos con menor stock.

-- 79. Obtener la cantidad de ventas por tipo de producto.

-- 80. Listar las maquinarias utilizadas en las cosechas.

-- 81. Obtener el total de animales comprados por especie.

-- 82. Listar los cultivos realizados por tipo de producto.

-- 83. Obtener el total de ventas en un rango de fechas.

-- 84. Listar los clientes con mayor gasto.

-- 85. Obtener la cantidad de maquinaria en uso.

-- 86. Listar los productos que no han sido vendidos.

-- 87. Obtener el total de costos por empleado.

-- 88. Listar todas las alertas activas.

-- 89. Obtener la producción promedio de un animal.

-- 90. Listar todos los empleados por fecha de contratación.

-- 91. Obtener el costo total de alimentos por especie.

-- 92. Listar las funciones con el número de empleados.

-- 93. Obtener la cantidad de cultivos por parcela.

-- 94. Listar las compras por tipo de maquinaria.

-- 95. Obtener el total de ingresos por mes.

-- 96. Listar todos los animales y su estado de salud.

-- 97. Obtener el total de ventas agrupadas por producto.

-- 98. Listar los alimentos con más de un proveedor.

-- 99. Obtener el costo total de producción por empleado.

-- 100. Listar todas las parcelas y su estado.

-- 1
SELECT produccion.id, especies.nombre as especie, productos.nombre as producto, empleados.nombre as empleado, funciones.nombre  as funcion, concat(maquinarias.marca, " ", maquinarias.modelo) as maquinaria FROM produccion 
JOIN animales on animales.id = produccion.idAnimal
JOIN especies on especies.id = animales.idEspecie
JOIN productos on productos.id = produccion.idProducto
JOIN empleados on empleados.id = produccion.idEmpleado
JOIN funciones on funciones.id = empleados.idFuncion
JOIN maquinarias on maquinarias.id = produccion.idMaquinaria;

-- 4
SELECT * FROM empleados
JOIN funciones on funciones.id = empleados.idFuncion
WHERE funciones.nombre = "Gestión de animales";

SELECT * FROM empleados
JOIN funciones on funciones.id = empleados.idFuncion
WHERE funciones.nombre = "Gestión de cultivos";

-- 5

insert into alertas (fecha, mensaje)
    select now(), concat("Recordatorio: realizar mantenimiento de ", Maq.marca, " ", Maq.modelo," id: ",Maq.id) 
    from maquinarias Maq
    where datediff(now(),(select MAX(mantenimiento.fechaFin) from mantenimiento where mantenimiento.fechaFin < now() and mantenimiento.iDMaquinaria = Maq.id)) >= 100;

SELECT fechaUltimaReparacionMaquinaria(1);
-- consulta
SELECT compras.*, GROUP_CONCAT(distinct compraAlimentos.subtotal separator "\n") as alimentos, GROUP_CONCAT(distinct compraMaquinaria.subtotal separator "\n") as maquinaria, GROUP_CONCAT(distinct animales.precio separator "\n") as animales FROM compras 
LEFT JOIN compraAlimentos on compras.id = compraAlimentos.idCompra
LEFT JOIN compraMaquinaria on compras.id = compraMaquinaria.idCompra
LEFT JOIN compraAnimales on compras.id = compraAnimales.idCompra
LEFT JOIN animales on compraAnimales.idAnimal = animales.id
group by compras.id;

SELECT * FROM compramaquinaria;
SELECT * FROM alimentos;
SELECT * FROM alertas;
    
SELECT MAX(mantenimiento.fechaFin) FROM mantenimiento WHERE mantenimiento.fechaFin < NOW() AND mantenimiento.idMaquinaria = 1;
-------------------------

