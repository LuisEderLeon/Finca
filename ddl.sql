create table tipoProducto (
    id int primary key auto_increment,
    nombre varchar(50) unique
)

create table productos (
    id int primary key auto_increment,
    nombre varchar(50) unique,
    precio double,
    tipo int,
    foreign key (tipo) references tipoProducto (id)
)