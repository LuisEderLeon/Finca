use mifinca;

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
SELECT cultivo.id, productos.nombre, cultivo.cantidad, empleados.nombre, maquinarias.marca, maquinarias.modelo 
FROM cultivo
JOIN parcelas ON cultivo.idParcela = parcelas.id
JOIN productos ON cultivo.idProducto = productos.id
JOIN empleados ON cultivo.idEmpleado = empleados.id
JOIN maquinarias ON cultivo.idMaquinaria = maquinarias.id
WHERE cultivo.idParcela = 1;

-- 11. Obtener el total de compras realizadas hace menos de un mes.
select compras.fecha, compras.total, proveedores.nombre from compras
join proveedores on compras.idProveedor = proveedores.id
where compras.fecha > date_sub(CURDATE(), INTERVAL 1 month);

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
select ventas.fecha, empleados.nombre as empleado, clientes.nombre as cliente, GROUP_CONCAT(productos.nombre, ': ', detallesVenta.cantidad separator '\n'), ventas.total 
from ventas
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

SELECT clientes.nombre, count(ventas.id) as cantidadCompras
FROM ventas
join clientes on clientes.id = ventas.`idCliente`
GROUP BY clientes.id
HAVING cantidadCompras >= 1;

-- 27. Obtener el total de alimentos comprados en un periodo.

select count( DISTINCT compraAlimentos.`idCompra`) from compras
JOIN compraalimentos ON compraalimentos.`idCompra` = compras.id
where compras.fecha BETWEEN "2023-01-1" and CURDATE();

-- 28. Listar todas las parcelas y sus áreas.

select parcelas.id as idParcela, productos.nombre, parcelas.area from parcelas
JOIN productos ON productos.id = parcelas.`idProducto`;

-- 29. Obtener la cantidad de productos vendidos en un mes.

SELECT SUM(detallesventa.cantidad) AS cantidadTotal
FROM ventas
JOIN detallesventa ON ventas.id = detallesVenta.idVenta
WHERE MONTH(ventas.fecha) = 10 AND YEAR(ventas.fecha) = 2024;

-- 30. Listar todos los proveedores y sus contactos.

select proveedores.nombre, proveedores.telefono from proveedores;

-- 31. Obtener el total de maquinaria en stock.

select COUNT(maquinarias.id) from maquinarias
where maquinarias.estado = "stock";

-- 32. Listar los registros de actualizaciones

select * from registros where registros.mensaje like "%actualiz%";

-- 33. Obtener el precio promedio de un tipo de alimento en una especie especifica.

SELECT AVG(alimentos.precio) AS precioPromedio
FROM alimentos
JOIN especieAlimento ON alimentos.id = especieAlimento.idAlimento
JOIN especies ON especieAlimento.idEspecie = especies.id
WHERE especies.id = 2;

-- 34 obtener la especie con el mayor promedio de alimento

SELECT especies.nombre ,AVG(alimentos.precio) AS precioPromedio
FROM alimentos
JOIN especieAlimento ON alimentos.id = especieAlimento.idAlimento
JOIN especies ON especieAlimento.idEspecie = especies.id
GROUP BY especies.id
ORDER BY precioPromedio desc
limit 1;

-- 35. Listar los empleados contratados en los ultimos cinco años.

SELECT nombre, fechaContratacion
FROM empleados
WHERE fechaContratacion >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR);

-- 36. Obtener el total de compras agrupadas por proveedor.

select proveedores.nombre, COUNT(compras.id)
from proveedores
join compras on compras.`idProveedor` = proveedores.id
GROUP BY proveedores.id;

-- 37. Listar todos los animales por especie.

select especies.nombre, GROUP_CONCAT(animales.id SEPARATOR " - ") as idAnimales
from especies
JOIN animales ON animales.`idEspecie` = especies.id
GROUP BY especies.id;

-- 38 5 especies con más animales.

select especies.nombre, count(animales.id) as cantidadAnimales
from especies
JOIN animales ON animales.`idEspecie` = especies.id
GROUP BY especies.id
ORDER BY cantidadAnimales desc
limit 5;

-- 38. Obtener el total de producción por empleado.

SELECT empleados.nombre, SUM(produccion.cantidad) AS totalProduccion
FROM produccion
JOIN empleados ON produccion.idEmpleado = empleados.id
GROUP BY produccion.idEmpleado;

-- 39. Listar las ventas realizadas en un rango de fechas.

select ventas.* 
from ventas 
where ventas.fecha BETWEEN "2024-10-1" and "2024-10-31";

-- 40. Obtener el estado de salud promedio de los animales. ------------------------------ subconsulta -----------------
-- mostrando solo el estado de salud

SELECT estadoSalud
FROM (
    SELECT animales.`estadoSalud` , COUNT(*) AS cantidad
    FROM animales
    GROUP BY `estadoSalud`
    ORDER BY cantidad DESC
    limit 1
) AS cantidadAnimalesEstado;

-- 41. Listar los tipos de alimentos y su costo.

SELECT alimentos.nombre AS tipo_alimento, alimentos.precio AS costo
FROM alimentos;


-- 42. Obtener las máquinas utilizadas en una producción específica.

SELECT CONCAT(maquinarias.marca," - ",maquinarias.modelo) from maquinarias
JOIN produccion ON produccion.`idMaquinaria` = maquinarias.id
where produccion.id = 1
;

-- 43. Listar los registros de mantenimiento por empleado ordenados por fecha

select mantenimiento.id, empleados.nombre, mantenimiento.`fechaInicio`, mantenimiento.`fechaFin`
from mantenimiento
join empleados on empleados.id = mantenimiento.`idEmpleado`
ORDER BY mantenimiento.`fechaInicio`;

-- 44. Obtener el total de ganancias por producto.

select productos.nombre, sum(detallesventa.subtotal) as TotalVendidoProducto from detallesventa
join productos on productos.id = detallesventa.`idProducto`
GROUP BY productos.id;

-- 45. Listar las especies y sus respectivos alimentos.

select especies.nombre, GROUP_CONCAT(alimentos.nombre SEPARATOR " - ")
from especies
join especiealimento on especiealimento.`idEspecie` = especies.id
JOIN alimentos ON alimentos.id = especiealimento.`idAlimento`
GROUP BY especies.id;

-- 46. Obtener los empleados asignados a cada función.

SELECT funciones.nombre, GROUP_CONCAT(empleados.nombre SEPARATOR" - ")
from funciones
join empleados on empleados.`idFuncion` = funciones.id
GROUP BY funciones.id;

-- 47. Listar cantidad de cada compra en una compra especifica ---------------------------- subconsultas--------------- 

SELECT compras.id,
    (SELECT COUNT(*) FROM compraAlimentos ca WHERE ca.idCompra = compras.id) AS cantidad_alimentos,
    (SELECT COUNT(*) FROM compraAnimales can WHERE can.idCompra = compras.id) AS cantidad_animales,
    (SELECT COUNT(*) FROM compraMaquinaria cm WHERE cm.idCompra = compras.id) AS cantidad_maquinaria
FROM compras;

-- 48. Unir registros de produccion para producir mejores detalles

SELECT produccion.id, especies.nombre as especie, productos.nombre as producto, empleados.nombre as empleado, funciones.nombre  as funcion, concat(maquinarias.marca, " ", maquinarias.modelo) as maquinaria FROM produccion 
JOIN animales on animales.id = produccion.idAnimal
JOIN especies on especies.id = animales.idEspecie
JOIN productos on productos.id = produccion.idProducto
JOIN empleados on empleados.id = produccion.idEmpleado
JOIN funciones on funciones.id = empleados.idFuncion
JOIN maquinarias on maquinarias.id = produccion.idMaquinaria;

-- 49. Listar las parcelas por área.

select parcelas.* from parcelas
ORDER BY parcelas.area desc;

-- 50. Obtener la cantidad de animales en cada estado de salud.

SELECT animales.`estadoSalud` , COUNT(*) AS cantidad
FROM animales
GROUP BY `estadoSalud`
ORDER BY cantidad DESC;

-- 51. Listar los clientes que no han realizado compras en el último año.

-- 52. Obtener el costo total de los animales en stock.

-- 53. Listar todos los cultivos realizados en el último año.

-- 54. Obtener el total de ventas por empleado.

-- 55. Listar los proveedores con los que se ha trabajado más.

-- 56. Obtener el total de maquinaria comprada en un periodo.

-- 57. Listar los alimentos consumidos por animales específicos.

-- 58. Obtener el total de ingresos por tipo de producto.

-- 59. Listar las ventas con descuentos aplicados.

-- 60. Obtener el precio de un producto por nombre.

-- 61. Listar los empleados que trabajan en el área de ventas.

-- 62. Obtener la producción total de una parcela.

-- 63. Listar los animales nacidos en un año específico.

-- 64. Obtener el total de alimentos en stock.

-- 65. Listar las maquinarias por estado.

-- 66. Obtener el costo total de los cultivos.

-- 67. Listar las especies con mayor cantidad de alimentos.

-- 68. Obtener el rendimiento promedio de un cultivo.

-- 69. Listar todos los empleados y sus teléfonos.

-- 70. Obtener la fecha de la última compra de un alimento.

-- 71. Listar las ventas realizadas por cada cliente.

-- 72. Obtener el total de animales vendidos en un mes.

-- 73. Listar los registros de alertas por fecha.

-- 74. Obtener el costo total de mantenimiento de maquinarias.

-- 75. Listar todos los animales y sus precios.

-- 76. Obtener el total de cultivos realizados por empleado.

-- 77. Listar las compras agrupadas por fecha.

-- 78. Obtener el total de ingresos por cliente.

-- 79. Listar los productos con menor stock.

-- 80. Obtener la cantidad de ventas por tipo de producto.

-- 81. Listar las maquinarias utilizadas en las cosechas.

-- 82. Obtener el total de animales comprados por especie.

-- 83. Listar los cultivos realizados por tipo de producto.

-- 84. Obtener el total de ventas en un rango de fechas.

-- 85. Listar los clientes con mayor gasto.

-- 86. Obtener la cantidad de maquinaria en uso.

-- 87. Listar los productos que no han sido vendidos.

-- 88. Obtener el total de costos por empleado.

-- 89. Listar todas las alertas activas.

-- 90. Obtener la producción promedio de un animal.

-- 91. Listar todos los empleados por fecha de contratación.

-- 92. Obtener el costo total de alimentos por especie.

-- 93. Listar las funciones con el número de empleados.

-- 94. Obtener la cantidad de cultivos por parcela.

-- 95. Listar las compras por tipo de maquinaria.

-- 96. Obtener el total de ingresos por mes.

-- 97. Listar todos los animales y su estado de salud.

-- 98. Obtener el total de ventas agrupadas por producto.

-- 99. Listar los alimentos con más de un proveedor.

-- 100. Obtener el costo total de producción por empleado.

-- 101. Listar todas las parcelas y su estado.

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

