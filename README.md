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
