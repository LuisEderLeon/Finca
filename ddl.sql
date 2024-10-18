create table tiposProducto (
    id int primary key auto_increment,
    nombre varchar(50) unique
);

create table productos (
    id int primary key auto_increment,
    nombre varchar(50) unique,
    precio double,
    tipo int,
    unidades enum("kilogramos","litros","unidades")
    foreign key (tipo) references tipoProducto (id)
);

create table inventarios (
    id int primary key auto_increment,
    idProducto int,
    estado enum("stock","venta"),
    fechaIngreso datetime,
    cantidad double,
    foreign key (idProducto) references productos (id)
);

create table maquinarias (
    id int primary key auto_increment,
    marca varchar(50),
    modelo varchar(50),
    estado ("stock","uso"),
    fechaCompra datetime
);

create table funciones (
    id int primary key auto_increment,
    nombre varchar(50)unique
);

create table empleados (
    id int primary key auto_increment,
    nombre varchar (50),
    fechaNacimiento datetime,
    funcion int,

)