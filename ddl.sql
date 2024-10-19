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
    fechaContratacion date,
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

create table animal  (
    id int primary key auto_increment,
    idEspecie int,
    fechaNacimiento datetime,
    idAlimento int,
    cantidadAlimento int,
    estadoSalud enum("bueno","regular","malo"),
    foreign key (idEspecie) references especies (id),
    foreign key (idAlimento) references alimentos (id)
)

CREATE TABLE proveedor (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,  
    telefono VARCHAR(20)       
);

CREATE TABLE compra (
    id INT AUTO_INCREMENT PRIMARY KEY,  
    fecha DATE NOT NULL,                
    idProveedor INT NOT NULL,           
    total DECIMAL(10, 2) NOT NULL,      
    FOREIGN KEY (idProveedor) REFERENCES proveedor(id) 
);

CREATE TABLE compraAnimal (
    idCompra INT NOT NULL,
    idAnimal INT NOT NULL,
    cantidad INT NOT NULL,
    subtotal DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (idCompra, idAnimal),
    FOREIGN KEY (idCompra) REFERENCES compra(id),
    FOREIGN KEY (idAnimal) REFERENCES animal(id)
);  

CREATE TABLE alimento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    stock INT,
);  

CREATE TABLE compraAlimento (
    idCompra INT,
    idAlimento INT,
    cantidad INT,
    subtotal DECIMAL(10, 2),
    PRIMARY KEY (idCompra, idAlimento),
    FOREIGN KEY (idCompra) REFERENCES compra(id),
    FOREIGN KEY (idAlimento) REFERENCES alimento(id)
);

CREATE TABLE produccion (
    idAnimal INT,
    idProducto INT,
    cantidad DECIMAL(10, 2),
    unidad enum("kg","litros","unidades"),
    idEmpleado INT,
    PRIMARY KEY (idAnimal, idProducto, idEmpleado),
    FOREIGN KEY (idProducto) REFERENCES productos(id), 
    FOREIGN KEY (idEmpleado) REFERENCES empleado(id),
    FOREIGN KEY (idAnimal) REFERENCES animal(id)
);
-- ---------------------------------------------------------------------------------
CREATE TABLE ventas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    idCliente INT NOT NULL,
    total DECIMAL(10, 2),
    FOREIGN KEY (idCliente) REFERENCES clientes(id)
);

CREATE TABLE detallesVenta (
    idVenta INT,
    idProducto INT,
    cantidad INT,
    subtotal DECIMAL(10, 2),
    PRIMARY KEY (idVenta, idProducto),
    FOREIGN KEY (idVenta) REFERENCES ventas(id),
    FOREIGN KEY (idProducto) REFERENCES productos(id)
);
