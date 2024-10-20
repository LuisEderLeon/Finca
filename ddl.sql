DROP DATABASE IF EXISTS mifinca;

CREATE DATABASE mifinca;
use mifinca;

create table tiposProducto (
    id int primary key auto_increment,
    nombre varchar(50) unique
);

create table productos (
    id int primary key auto_increment,
    nombre varchar(50) unique,
    precio double,
    idTipo int,
    unidades enum("kilogramos","litros","unidades"),
    foreign key (idTipo) references tiposProducto (id)
);

create table cultivos (
    id int primary key auto_increment,
    idProducto int,
    area double,
    foreign key (idProducto) references productos (id)
);

create table inventarios (
    idProducto int,
    estado enum("stock","venta"),
    fechaIngreso datetime,
    cantidad double,
    PRIMARY KEY(idProducto,estado),
    foreign key (idProducto) references productos (id)
);

create table maquinarias (
    id int primary key auto_increment,
    marca varchar(50),
    modelo varchar(50),
    estado enum("stock","uso"),
    fechaCompra datetime
);

create table funciones (
    id int primary key auto_increment,
    nombre varchar(50)unique
);

create table empleados (
    id int primary key auto_increment,
    nombre varchar (50),
    fechaNacimiento date,
    idFuncion int,
    telefono varchar(20),
    fechaContratacion date,
    foreign key (idFuncion) references funciones (id)
);

create table especies (
    id int primary key auto_increment,
    nombre varchar(30) unique
);

CREATE TABLE alimentos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    precio double,
    stock INT
);  

create table animales (
    id int primary key auto_increment,
    idEspecie int,
    fechaNacimiento datetime,
    idAlimento int,
    precio double,
    cantidadAlimento int,
    estadoSalud enum("saludable","enfermo","muerto"),
    foreign key (idEspecie) references especies (id),
    foreign key (idAlimento) references alimentos (id)
);

-----------------------------------------------------------------------------------

CREATE TABLE proveedores (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,  
    telefono VARCHAR(15)       
);

CREATE TABLE compras (
    id INT AUTO_INCREMENT PRIMARY KEY,  
    fecha DATE NOT NULL,                
    idProveedor INT NOT NULL,
    total DOUBLE,      
    FOREIGN KEY (idProveedor) REFERENCES proveedores(id) 
);

CREATE TABLE compraAnimales (
    idCompra INT NOT NULL,
    idAnimal INT NOT NULL,
    PRIMARY KEY (idCompra, idAnimal),
    FOREIGN KEY (idCompra) REFERENCES compras(id),
    FOREIGN KEY (idAnimal) REFERENCES animales(id)
);  

CREATE TABLE compraAlimentos (
    idCompra INT,
    idAlimento INT,
    cantidad INT,
    subtotal DOUBLE,
    PRIMARY KEY (idCompra, idAlimento),
    FOREIGN KEY (idCompra) REFERENCES compras(id),
    FOREIGN KEY (idAlimento) REFERENCES alimentos(id)
);  

CREATE TABLE compraMaquinaria (
    idCompra INT,
    idMaquinaria INT,
    PRIMARY KEY (idCompra, idMaquinaria),
    FOREIGN KEY (idCompra) REFERENCES compras(id),
    FOREIGN KEY (idMaquinaria) REFERENCES maquinarias(id)
);

-----------------------------------------------------------------------------------

CREATE TABLE produccion (
    id INT AUTO_INCREMENT PRIMARY KEY,  
    idAnimal INT,
    idProducto INT,
    idEmpleado int,
    idMaquinaria int,
    cantidad INT,
    FOREIGN KEY (idProducto) REFERENCES productos(id), 
    FOREIGN KEY (idEmpleado) REFERENCES empleados(id),
    FOREIGN KEY (idAnimal) REFERENCES animales(id),
    FOREIGN KEY (idMaquinaria) REFERENCES maquinarias(id)
);

CREATE TABLE cosecha (
    id INT AUTO_INCREMENT PRIMARY KEY,  
    idCultivo INT,
    idEmpleado int,
    idMaquinaria int,
    cantidad INT,
    FOREIGN KEY (idCultivo) REFERENCES cultivos(id), 
    FOREIGN KEY (idEmpleado) REFERENCES empleados(id),
    FOREIGN KEY (idMaquinaria) REFERENCES maquinarias(id)
);

-----------------------------------------------------------------------------------

CREATE TABLE clientes(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(100) NOT NULL,
    telefono char(10) NOT NULL,
    fechaNacimiento date not null   
);

CREATE TABLE ventas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    idCliente INT NOT NULL,
    total DOUBLE,
    FOREIGN KEY (idCliente) REFERENCES clientes(id)
);

CREATE TABLE detallesVenta (
    idVenta INT,
    idProducto INT,
    cantidad INT,
    subtotal DOUBLE,
    PRIMARY KEY (idVenta, idProducto),
    FOREIGN KEY (idVenta) REFERENCES ventas(id),
    FOREIGN KEY (idProducto) REFERENCES productos(id)
);
