CREATE USER 'vendedor'@'localhost' IDENTIFIED BY 'v3nder&V3nder';
grant execute on procedure crearVentaNueva, añadirProductosVenta, eliminarVenta, completarVenta to 'vendedor'@'localhost';

create user 'admin'@'localhost' IDENTIFIED BY 'N0Conf10€nN4di3';
grant all privileges on mifinca.* to 'admin'@'localhost';

CREATE USER 'ganadero'@'localhost' IDENTIFIED BY 'pr0duzc4n,Mat3n';
grant execute on procedure matarAnimal, cambiarEstadoSaludAnimal, consultarAnimalesPorEspecie to 'ganadero'@'localhost';
grant insert on mifinca.produccion to 'ganadero'@'localhost';

CREATE USER 'agricola'@'localhost' IDENTIFIED BY 'h0l4SoyV3gan0';
grant execute on procedure cosechar, cultivar, actualizarPrecioProductos, eliminarProducto, insertarProducto to 'agricola'@'localhost';

CREATE USER 'comprador'@'localhost' IDENTIFIED BY 'yoTambienManejoMaquinariasXd';
grant execute on procedure mantenimientoMaquinaria to 'comprador'@'localhost';
grant insert, update, delete on mifinca.compras, mifinca.compraAlimentos, mifinca.compraAnimales, mifinca.compraMaquinaria to 'comprador'@'localhost';

FLUSH PRIVILEGES;