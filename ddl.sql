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
    idFuncion int,
    telefono varchar(20),
    foreign key (funcion) references funciones (id)
);

create table especies (
    id int primary key auto_increment,
    nombre varchar(50) unique
)

create table alimentos (
    id int primary key auto_increment,
    nombre varchar(50)
)

create table animales (
    id int primary key auto_increment,
    idEspecie int,
    fechaNacimiento datetime,
    idAlimento int,
    cantidadAlimento int,
    foreign key (idEspecie) references especies (id),
    foreign key (idAlimento) references alimentos (id)
)