DROP DATABASE IF EXISTS mifinca;

CREATE DATABASE mifinca;
use mifinca;

CREATE TABLE tiposProducto (
    id INT PRIMARY KEY,
    nombre varchar(50) unique
);

CREATE TABLE productos (
    id INT PRIMARY KEY,
    nombre varchar(50) unique,
    precio double,
    idTipo INT,
    unidades enum("kilogramos","litros","unidades"),
    FOREIGN KEY (idTipo) REFERENCES tiposProducto (id)
);

CREATE TABLE parcelas (
    id INT PRIMARY KEY auto_increment,
    idProducto INT not null,
    cantidad INT,
    area double,
    fechaCultivo DATETIME,
    FOREIGN KEY (idProducto) REFERENCES productos (id)
);

CREATE TABLE inventarios (
    id INT PRIMARY KEY auto_increment,
    idProducto INT,
    estado enum("stock","venta"),
    fechaIngreso DATETIME,
    cantidad INT,
    FOREIGN KEY (idProducto) REFERENCES productos (id)
);

CREATE TABLE maquinarias (
    id INT PRIMARY KEY auto_increment,
    marca varchar(50),
    modelo varchar(50),
    estado enum("stock","uso"),
    fechaCompra DATETIME
);

CREATE TABLE funciones (
    id INT PRIMARY KEY auto_increment,
    nombre varchar(50) unique
);

CREATE TABLE empleados (
    id INT PRIMARY KEY auto_increment,
    nombre varchar (50),
    fechaNacimiento DATE,
    idFuncion INT,
    telefono varchar(20),
    fechaContratacion DATE,
    FOREIGN KEY (idFuncion) REFERENCES funciones (id)
);

CREATE TABLE especies (
    id INT PRIMARY KEY auto_increment,
    nombre varchar(30) unique
);

CREATE TABLE alimentos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    precio double,
    stock INT
);  

CREATE TABLE especieAlimento (
    idEspecie INT,
    idAlimento INT,
    FOREIGN KEY (idEspecie) REFERENCES especies (id),
    FOREIGN KEY (idAlimento) REFERENCES alimentos (id)
);

CREATE TABLE animales (
    id INT PRIMARY KEY auto_increment,
    idEspecie INT,
    fechaNacimiento DATETIME,
    precio double,
    cantidadAlimento INT,
    estadoSalud enum("saludable","enfermo","muerto"),
    FOREIGN KEY (idEspecie) REFERENCES especies (id)
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
    idEmpleado INT,
    idMaquinaria INT,
    cantidad INT,
    FOREIGN KEY (idProducto) REFERENCES productos(id), 
    FOREIGN KEY (idEmpleado) REFERENCES empleados(id),
    FOREIGN KEY (idAnimal) REFERENCES animales(id),
    FOREIGN KEY (idMaquinaria) REFERENCES maquinarias(id)
);

CREATE TABLE cultivo (
    id INT auto_increment PRIMARY key,
    idParcela INT,
    idEmpleado INT,
    idMaquinaria INT,
    cantidad INT,
    FOREIGN KEY (idParcela) REFERENCES parcelas(id), 
    FOREIGN KEY (idEmpleado) REFERENCES empleados(id),
    FOREIGN KEY (idMaquinaria) REFERENCES maquinarias(id)
);

CREATE TABLE cosecha (
    id INT AUTO_INCREMENT PRIMARY KEY,  
    idParcela INT,
    idEmpleado INT,
    idMaquinaria INT,
    cantidad INT,
    FOREIGN KEY (idParcela) REFERENCES parcelas(id), 
    FOREIGN KEY (idEmpleado) REFERENCES empleados(id),
    FOREIGN KEY (idMaquinaria) REFERENCES maquinarias(id)
);

-----------------------------------------------------------------------------------

CREATE TABLE clientes(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre varchar(100) NOT NULL,
    telefono char(10) NOT NULL,
    fechaNacimiento DATE not null   
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

CREATE TABLE registros (
    id INT PRIMARY KEY auto_increment,
    fechaRegistro DATETIME,
    mensaje varchar(50)
);