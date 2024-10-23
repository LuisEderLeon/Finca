-- 1
SELECT produccion.id, especies.nombre as especie, productos.nombre as producto, empleados.nombre as empleado, funciones.nombre  as funcion, concat(maquinarias.marca, " ", maquinarias.modelo) as maquinaria FROM produccion 
JOIN animales on animales.id = produccion.idAnimal
JOIN especies on especies.id = animales.idEspecie
JOIN productos on productos.id = produccion.idProducto
JOIN empleados on empleados.id = produccion.idEmpleado
JOIN funciones on funciones.id = empleados.idFuncion
JOIN maquinarias on maquinarias.id = produccion.idMaquinaria;

-- 2

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
    where datediff(now(),(select max(mantenimiento.fechaFin) from mantenimiento where mantenimiento.fechaFin < now() and mantenimiento.iDMaquinaria = Maq.id)) >= 100;

SELECT fechaUltimaReparacionMaquinaria(1);
-- consulta
SELECT compras.*, group_concat(distinct compraAlimentos.subtotal separator "\n") as alimentos, group_concat(distinct compraMaquinaria.subtotal separator "\n") as maquinaria, group_concat(distinct animales.precio separator "\n") as animales FROM compras 
LEFT JOIN compraAlimentos on compras.id = compraAlimentos.idCompra
LEFT JOIN compraMaquinaria on compras.id = compraMaquinaria.idCompra
LEFT JOIN compraAnimales on compras.id = compraAnimales.idCompra
LEFT JOIN animales on compraAnimales.idAnimal = animales.id
group by compras.id;

SELECT * FROM compramaquinaria;
SELECT * FROM alimentos;
SELECT * FROM alertas;

-- no quitar --------------------------------------------------
SELECT NOW(), cOncat('bajo stock de ', productos.nombre) 
    FROM productos
    WHERE productos.id IN (SELECT idProducto FROM inventarios WHERE estado = 'stock' AND cantidad <= 10);
    
SELECT mAx(mantenimiento.fechaFin) FROM mantenimiento WHERE mantenimiento.fechaFin < NOW() AND mantenimiento.idMaquinaria = 1;-- 