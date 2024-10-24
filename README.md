# Proyecto de Base de Datos - Finca lejana lejana pradera

## Descripción del Proyecto 🎃

El proyecto **Finca lejana lejana pradera** es una base de datos diseñada para gestionar las operaciones agrícolas de una finca. Está optimizada para manejar la producción de productos agrícolas (aguacates, maíz, café, miel, leche, etc.), la gestión de empleados, maquinaria, ventas, inventarios, proveedores, clientes, y el manejo de animales como abejas y otros tipos de ganado y lo que estos producen.

<img src="https://cdn.akamai.steamstatic.com/steam/apps/1657630/ss_5742b171daecef4062d51afe12abde32e886780b.1920x1080.jpg?t=1663866007" alt="Descripción de la imagen" width="800">

### Objetivos 🚀
- Facilitar el control de inventarios de productos.
- Automatizar la gestión de compras, ventas y cosechas.
- Optimizar el seguimiento de la producción agrícola.
- Gestionar de manera eficiente el manejo de los empleados y la maquinaria.
- Realizar un seguimiento preciso de los clientes y proveedores.


## Requisitos 📜

- **MySQL** versión 8.0 o superior.
- Un entorno de desarrollo compatible con bases de datos relacionales (por ejemplo, MySQL Workbench o Visual studio code con extensiones).

## Instalación ⬇️

1. Clonar este repositorio:
    ```bash
    git clone https://github.com/LuisEderLeon/Finca.git
    ```
2. Acceder al directorio del proyecto:
    ```bash
    cd mifinca
    ```
3. Importar el archivo SQL de creación de la base de datos en MySQL:
    ```bash
    mysql -u usuario -p < mifinca.sql
    ```

## Orden de uso 🪧💻

1. **Creación de la base de datos**:
   Ejecuta el archivo SQL que contiene todas las tablas y las relaciones necesarias para comenzar a gestionar las operaciones agrícolas. **ddl.sql**
   
2. **Funciones**:
   Ejecutar el archivo **dql_funciones.sql** que contiene las funciones ya que estas se usan en los siguientes archivos

3. **Triggers**: 
   Los triggers automatizan la actualización de inventarios, la gestión de compras, ventas, producción y manejo de animales.
   
4. **procedimientos**:
   Ejecutar procedimientos para realizar acciones de forma más sencillas

5. **Inserciones**
   Ejecutar archivo **dml.sql** para ingresar datos a las tablas ya creadas

6. **Eventos Periódicos**: 
   La base de datos incluye eventos automatizados, como notificaciones de bajo stock, mantenimiento de maquinaria y registro de compras mensuales.

7. **Consultas**:
   - Ejecuta las consultas para acceder a distintos datos clave de la finca, donde puedes tomar decisiones basado en el contenido de las consultas

## Contenido
### Funciones

### 1. `nombreEspecie`
Obtiene el nombre de la especie a la que pertenece un animal. Realiza una consulta a la tabla especies, uniendo con la tabla animales para obtener el nombre de la especie según el id del animal proporcionado.

### 2. `productoEnParcela`
Obtiene el ID del producto que está cultivado en una parcela específica. Realiza una consulta en la tabla parcelas utilizando el id de la parcela.

### 3. `existenProductosAVender`
Verifica si existen productos disponibles para la venta en el inventario. Retorna el conteo de productos en estado `venta` para un producto dado.

### 4. `stockALaVenta`
Devuelve la cantidad de stock disponible para la venta de un producto específico. Consulta la tabla inventarios para obtener la cantidad de productos en estado `venta`.

### 5. `totalEnInventario`
Calcula el total de unidades de un producto en inventario, sumando las cantidades de todas las entradas del producto en la tabla inventarios.

### 6. `fechaUltimaReparacionMaquinaria`
Obtiene la fecha de la última reparación completada para una maquinaria específica. Realiza una consulta en la tabla mantenimiento, obteniendo la fecha más reciente antes de la fecha actual.

### 7. `productoEnTipo`
Obtiene el número de productos asociados a un tipo de producto específico. Realiza un conteo en la tabla tiposProducto basado en el id del tipo de producto.

### 8. `precioProducto`
Obtiene el precio de un producto específico basado en su ID. Realiza una consulta en la tabla productos para obtener el valor del campo precio.

### 9. `consultarEdad`
Calcula la edad de un empleado o cliente, según el tipo indicado, restando la fecha de nacimiento de la fecha actual. Consulta las tablas empleados o clientes dependiendo del tipo recibido.

### 10. `totalDiasDesdeContratacion`
Calcula el número total de días desde la contratación de un empleado específico. Usa la diferencia entre la fecha actual y la fecha de contratación del empleado.

### 11. `totalVentaCliente`
Obtiene el total de ventas realizadas por un cliente específico, sumando los montos de las ventas registradas en la tabla ventas.

### 12. `promedioProductos`
Calcula el precio promedio de todos los productos. Realiza una consulta en la tabla productos para obtener el valor promedio del campo precio.

### 13. `totalAnimalesComprados`
Calcula el total de animales comprados. Realiza un conteo en la tabla compraAnimales para obtener el número total de animales adquiridos.

### 14. `conteoMaquinariasActivas`
Obtiene el número de maquinarias que están actualmente en uso. Realiza un conteo en la tabla maquinarias de todas aquellas cuyo estado es `uso`.

### 15. `conteoEmpleadosFuncion`
Obtiene el número de empleados que tienen una función específica. Realiza un conteo en la tabla empleados basado en el idFuncion recibido como parámetro.

### 16. `fechaUltimaVentaRegistrada`
Obtiene la fecha de la última venta registrada en el sistema. Consulta la tabla ventas y retorna la fecha más reciente.

### 17. `ingresoTotalVentas`
Calcula el ingreso total generado por las ventas. Suma el valor del campo total de la tabla ventas.

### 18. `totalAnimalesProveedor`
Obtiene el número total de animales comprados a un proveedor específico. Realiza un conteo de los animales en la tabla compraAnimales, filtrando por el ID del proveedor.

### 19. `totalParcelasCultivadasEmpleado`
Obtiene el número total de parcelas cultivadas por un empleado específico. Realiza un conteo de las parcelas en la tabla cultivo para el ID del empleado recibido.

### 20. conteoMantenimientoMaquinaria
Obtiene el número de mantenimientos realizados en una maquinaria específica. Realiza un conteo en la tabla mantenimiento basado en el ID de la maquinaria.



### Procedimientos

### 1. `procesarAnimalSacrificio`
Registra el sacrificio de un animal y sus productos derivados en la base de datos. Identifica la especie del animal y añade los productos relacionados, como carne y cuero, a la tabla de producción.

### 2. `realizarCultivo`
Inserta un nuevo cultivo en la parcela indicada. Verifica que la parcela esté vacía antes de proceder y registra la acción en la tabla de registros.

### 3. `recolectarCosecha`
Permite recolectar la cosecha de una parcela. Verifica que la parcela tenga un producto sembrado y registra la cantidad cosechada en la base de datos.

### 4. `añadirProductoVenta`
Asocia un producto existente a una venta, asegurando que la cantidad y el producto sean válidos. Registra la acción en los registros del sistema.

### 5. `generarVentaNueva`
Crea una nueva venta en el sistema con los detalles del cliente y el empleado responsables. Si los datos son válidos, se inserta la venta y se registra el evento.

### 6. `suprimirVenta`
Elimina una venta y sus detalles relacionados si la venta existe en la base de datos. También guarda un registro de la operación.

### 7. `removerCliente`
Elimina un cliente si no tiene ventas asociadas. En caso contrario, se registra el intento fallido en la tabla de registros.

### 8. `programarMantenimientoMaquinaria`
Planifica un mantenimiento para una maquinaria específica durante una cantidad de tiempo determinada. Verifica que el empleado y la maquinaria existan antes de registrar el mantenimiento.

### 9. `actualizarPrecioProducto`
Modifica el precio de un producto existente. Si el producto no se encuentra en la base de datos, se registra un intento fallido.

### 10. `insertarNuevoProducto`
Agrega un nuevo producto a la base de datos, asegurando que pertenezca a un tipo de producto existente antes de realizar la inserción.

### 11. `eliminarProductoExistente`
Borra un producto de la base de datos siempre y cuando no esté referenciado en otras tablas como detalles de venta, producción o cultivo.

### 12. `retirarProductoDeVenta`
Elimina un producto de una venta específica, asegurándose de que la combinación producto-venta exista antes de proceder.

### 13. `finalizarVenta`
Completa el proceso de venta, actualizando el inventario y eliminando los productos relacionados con la venta. Registra cada transacción en el sistema.

### 14. `consultarAnimalesSegunEspecie`
Devuelve una lista de animales que pertenecen a una especie específica, uniendo la información de la tabla de animales y especies.

### 15. `calcularVentasPorPeriodo`
Suma el total de ventas realizadas dentro de un periodo de tiempo específico, calculando la fecha final en función del tipo de intervalo (días, semanas o meses).

### 16. `modificarEstadoSaludAnimal`
Actualiza el estado de salud de un animal específico en la base de datos, permitiendo cambiar entre los estados “saludable”, “enfermo” o “muerto”.

### 17. `registrarConsumoAlimentoAnimal`
Inserta un registro sobre el consumo de alimento de un animal, vinculando la especie del animal con su alimento correspondiente.

### 18. `generarInformeInventario`
Produce un informe sobre el estado del inventario, mostrando la cantidad total disponible de cada producto en el sistema.

### 19. `actualizarDatosProveedor`
Modifica la información de un proveedor existente, incluyendo su nombre y número de teléfono, en la tabla de proveedores.

### 20. `consultarProductosPorCategoria`
Devuelve todos los productos que pertenecen a un tipo específico, mostrando su información desde la tabla de productos.

### Triggers

#### 1. `subtotalCompraAlimentos`
Calcula el subtotal de una compra de alimentos antes de insertarla en la tabla `compraAlimentos`. Multiplica el precio del alimento por la cantidad comprada y asigna el resultado al campo `subtotal`.

#### 2. `totalComprasAlimentos`
Actualiza el total de la compra en la tabla `compras` después de insertar una nueva entrada en `compraAlimentos`. Suma el subtotal de la nueva compra al total existente.

#### 3. `subtotalCompraMaquinaria`
Similar al primer trigger, pero para compras de maquinaria. Calcula el subtotal multiplicando el precio de la maquinaria por la cantidad comprada.

#### 4. `totalComprasMaquinaria`
Actualiza el total de la compra en `compras` después de insertar en `compraMaquinaria`, sumando el subtotal de la nueva compra al total existente.

#### 5. `totalComprasAnimales`
Actualiza el total de la compra en `compras` al insertar una nueva compra de animales, sumando el precio del animal al total de la compra.

#### 6. `updateInventarioCosecha`
Después de insertar una cosecha, actualiza el inventario con el estado del producto cultivado, basado en si hay productos disponibles para la venta.

#### 7. `updateInventarioProduccion`
Similar al anterior, pero se ejecuta después de insertar en `produccion`, actualizando el inventario según el estado del producto producido.

#### 8. `ajustarStockAlimentos`
Actualiza el stock de alimentos después de insertar en `compraAlimentos`, aumentando la cantidad disponible del alimento comprado.

#### 9. `ajustarStockMaquinaria`
Actualiza el stock de maquinaria después de insertar en `compraMaquinaria`, incrementando la cantidad de la maquinaria comprada.

#### 10. `comprobarStockVenta`
Antes de insertar en `detallesVenta`, verifica si hay suficiente stock del producto. Si no hay suficiente, ajusta la cantidad a la disponible y registra un mensaje.

#### 11. `actualizarSubtotalVentas`
Antes de insertar en `detallesVenta`, calcula el subtotal multiplicando la cantidad por el precio del producto y lo asigna al campo `subtotal`.

#### 12. `actualizarTotalVenta`
Después de insertar en `detallesVenta`, actualiza el total en `ventas`, sumando el subtotal del nuevo detalle de venta.

#### 13. `aumentarComidaAnimalesEnfermos`
Después de actualizar un registro de `animales`, ajusta la cantidad de alimento dependiendo del estado de salud del animal.

#### 14. `registrarCambioPrecio`
Después de actualizar el precio de un producto, registra el cambio en la tabla de `registros`, documentando el precio anterior y el nuevo.

#### 15. `actualizarEstadoMaquinarias`
Después de insertar en `mantenimiento`, actualiza el estado de la maquinaria y registra el evento en `registros`.

#### 16. `verificarVentasPrducto`
Antes de eliminar un producto de `productos`, verifica si hay detalles de venta asociados. Si hay, genera un error para evitar la eliminación.

#### 17. `cambioEstadoAnimal`
Después de actualizar el estado de salud de un animal, registra el cambio en la tabla de `registros`.

#### 18. `actualizarParcelasCultivadas`
Después de insertar en `cultivo`, actualiza la parcela asociada con el nuevo producto y la cantidad cultivada.

#### 19. `actualizarParcelasCosechadas`
Después de insertar en `cosecha`, actualiza la parcela para reflejar que ha sido cosechada (cero productos y cantidad).

#### 20. `verificarCantidadProduccion`
Antes de insertar en `produccion`, verifica que la cantidad a producir no sea negativa. Si lo es, genera un error.



### Eventos

### 1. `notificarBajoStock`
Este evento se ejecuta diariamente y verifica si hay alimentos con un stock menor o igual a 10. Si los encuentra, inserta un mensaje en la tabla de `alertas`.

### 2. `notificarBajoStockProductos`
Similar al anterior, este evento se ejecuta diariamente y revisa los productos en general. Si el total en inventario de un producto es menor o igual a 10, inserta un mensaje en `alertas`.

### 3. `recordarMantenimientoMaquinarias`
Este evento se ejecuta cada 30 días. Verifica si han pasado 10 días desde el último mantenimiento de cada maquinaria. Si es así, inserta un recordatorio en `alertas`.

### 4. `actualizarEstadoMaquinarias`
Se ejecuta diariamente y cambia el estado de las maquinarias a "stock" si la fecha de fin del mantenimiento es menor o igual a la fecha actual.

### 5. `notificarMantenimientoParcelas`
Este evento se ejecuta cada 60 días y revisa si alguna parcela ha estado cultivada durante más de 180 días. Si es así, inserta un mensaje en `alertas`.

### 6. `notificarEnfermedadesAnimales`
Se ejecuta semanalmente y verifica si hay animales con estado de salud "enfermo". Si los encuentra, inserta un mensaje en `alertas` indicando que se necesita una revisión.

### 7. `notificarProximasCosechas`
Este evento se ejecuta cada dos semanas y verifica si hay cosechas programadas dentro de los próximos 7 días. Si las hay, inserta un mensaje en `alertas`.

### 8. `actualizarPrecioProductosInflacion`
Se ejecuta anualmente y aumenta el precio de todos los productos en un 8% para ajustarlo a la inflación.

### 9. `notificarCumpleañosEmpleado`
Este evento se ejecuta diariamente y verifica si algún empleado tiene su cumpleaños ese día. Si lo hay, inserta un mensaje en `alertas`.

### 10. `borrarAlertasViejas`
Se ejecuta mensualmente y elimina las alertas que tienen más de 6 meses.

### 11. `registrarTotalComprasMensual`
Este evento se ejecuta mensualmente y registra el total gastado en compras del mes actual en la tabla de `registros`.

### 12. `registrarMantenimientosMensuales`
Se ejecuta mensualmente y cuenta el número de mantenimientos realizados en el mes actual, registrando el resultado en `registros`.

### 13. `notificarProductosEnVenta`
Se ejecuta mensualmente y verifica si hay productos en venta que han estado en inventario por más de 6 meses. Si los encuentra, inserta un mensaje en `alertas`.

### 14. `notificarBajaProductividadParcelas`
Este evento se ejecuta mensualmente y verifica si alguna parcela tiene una producción menor a 100 y ha sido cultivada durante más de un año. Si lo encuentra, inserta un mensaje en `alertas`.

### 15. `calcularPromedioVentasSemanales`
Se ejecuta semanalmente y calcula el promedio de ventas de la semana actual, registrando el resultado en la tabla de `registros`.

### 16. `notificarNuevasMaquinarias`
Este evento se ejecuta diariamente y verifica si se ha añadido nueva maquinaria en las últimas 24 horas. Si es así, inserta un mensaje en `alertas`.

### 17. `actualizarParcelasAbandonadas`
Se ejecuta anualmente y establece la cantidad de parcelas cultivadas que han estado sin actividad durante más de 3 años a cero.

### 18. `generarReporteDeProveedores`
Este evento se ejecuta mensualmente y genera un reporte del total de compras realizadas a cada proveedor en el mes actual, insertando la información en `registros`.

### 19. `verificarStockMaquinarias`
Se ejecuta cada 6 meses y verifica si hay maquinarias con un stock menor a 2. Si es así, inserta un mensaje en `alertas`.

### 20. `cantidadReparacionesMaquinarias`
Se ejecuta cada 6 meses y cuenta cuántas reparaciones se han realizado en maquinarias en los últimos 6 meses, registrando el número en `registros`.