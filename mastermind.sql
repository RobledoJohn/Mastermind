DROP DATABASE IF exists MASTERMIND;

CREATE DATABASE Mastermind;

USE Mastermind;

CREATE TABLE EMPRESAS (
id_empresa INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(30),
nit INT, 
email VARCHAR(100),
clave VARCHAR(16), 
avatar BLOB,
direccion VARCHAR(100),
f_creacion TIMESTAMP,
f_actualizacion TIMESTAMP
)ENGINE=INNODB;

CREATE TABLE CLIENTES (
id_cliente INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(20),
identificacion INT(10),
email VARCHAR(100),
clave VARCHAR(30),
telefono INT(10),
avatar BLOB,
direccion VARCHAR(60),
f_creacion TIMESTAMP,
f_actualizacion TIMESTAMP,

enum_tipo_documento ENUM('CC','CE','Pasaporte') NOT NULL,

id_empresa INT,
id_ciudad INT
)ENGINE=INNODB;

CREATE TABLE TECNICOS (
id_tecnico INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(20),
email VARCHAR(100),
clave VARCHAR(20),
telefono INT(10),
avatar BLOB,
f_creacion TIMESTAMP,
f_actualizacion TIMESTAMP,
  
id_empresa INT
)ENGINE=INNODB;

CREATE TABLE INGRESOS(
id_ingreso INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
enlace_seguimiento VARCHAR(255),
f_creacion TIMESTAMP,
f_actualizacion TIMESTAMP,

enum_estado_reparacion ENUM('Recepcion', 'Diagnostico', 'Reparacion', 'Esperando Piezas', 'Pruebas', 'Listo para la entrega', 'Finalizado') NOT NULL,

id_tecnico INT,
id_equipo INT
)ENGINE=INNODB;

CREATE TABLE VENTAS (
id_venta INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
f_creacion TIMESTAMP,
  
enum_medio_pago ENUM('Efectivo', 'PSE', 'Trasferencia', 'Tarjeta de crédito', 'Tarjeta dédito') NOT NULL,

id_cliente INT,
id_detalle_venta INT,
id_empresa INT
)ENGINE=INNODB;

CREATE TABLE DETALLE_VENTAS (
id_detalle_venta INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
cantidad_usada INT(5),
monto INT(7),
descripcion TEXT,

id_tipo_detalle INT
)ENGINE=INNODB;

CREATE TABLE TIPOS_DETALLES(
id_tipo_detalle INT AUTO_INCREMENT NOT NULL PRIMARY KEY,

enum_tipos_detalle ENUM('Ingreso','Producto'),

id_ingreso INT,
id_producto INT
)ENGINE=INNODB;

CREATE TABLE PRODUCTOS(
id_producto INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
sku VARCHAR(10),
nombre VARCHAR(20),
descripcion TEXT,
cantidad INT(5),
precio INT(7),
f_creacion TIMESTAMP,
f_actualizacion TIMESTAMP,

id_empresa INT,
id_categoria INT
)ENGINE=INNODB;

CREATE TABLE CATEGORIAS (
id_categoria INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(20)
)ENGINE=INNODB;

CREATE TABLE EQUIPOS (
id_equipo INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
f_creacion TIMESTAMP,

id_cliente INT,
id_modelo INT
)ENGINE=INNODB;

CREATE TABLE MARCAS (
id_marca INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(20)
)ENGINE=INNODB;

CREATE TABLE MODELOS (
id_modelo INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(20),

enum_tipo_equipo ENUM('Celular', 'Tablet', 'AIO', 'Portatil', 'Escritorio'),

id_marca INT
)ENGINE=INNODB;

CREATE TABLE CIUDADES (
id_ciudad INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
nombre VARCHAR(20)
)ENGINE=INNODB;

/*--------------------------------------------------------------------------------*/
/*---LLAVES FORANEAS--------------------------------------------------------------*/
/*--------------------------------------------------------------------------------*/

ALTER TABLE CLIENTES
ADD CONSTRAINT fk_clientes_empresa
FOREIGN KEY(id_empresa) REFERENCES EMPRESAS(id_empresa);

ALTER TABLE CLIENTES
ADD CONSTRAINT fk_clientes_ciudad
FOREIGN KEY(id_ciudad) REFERENCES CIUDADES(id_ciudad);

ALTER TABLE TECNICOS
ADD CONSTRAINT fk_tecnicos_empresas
FOREIGN KEY(id_empresa) REFERENCES EMPRESAS(id_empresa);

ALTER TABLE INGRESOS
ADD CONSTRAINT fk_ingresos_equipos
FOREIGN KEY(id_equipo) REFERENCES EQUIPOS(id_equipo);

ALTER TABLE INGRESOS
ADD CONSTRAINT fk_ingresos_tecnicos
FOREIGN KEY(id_tecnico) REFERENCES TECNICOS(id_tecnico);

ALTER TABLE VENTAS
ADD CONSTRAINT fk_ventas_clientes
FOREIGN KEY(id_cliente) REFERENCES CLIENTES(id_cliente);

ALTER TABLE VENTAS
ADD CONSTRAINT fk_ventas_detalle_ventas
FOREIGN KEY(id_detalle_venta) REFERENCES DETALLE_VENTAS(id_detalle_venta);

ALTER TABLE VENTAS
ADD CONSTRAINT fk_ventas_empresas
FOREIGN KEY(id_empresa) REFERENCES EMPRESAS(id_empresa);

ALTER TABLE DETALLE_VENTAS
ADD CONSTRAINT fk_tipos_detalles_detalle_ventas
FOREIGN KEY(id_tipo_detalle) REFERENCES TIPOS_DETALLES(id_tipo_detalle);

ALTER TABLE TIPOS_DETALLES
ADD CONSTRAINT fk_tipos_detalles_ingresos
FOREIGN KEY(id_ingreso) REFERENCES INGRESOS(id_ingreso);

ALTER TABLE TIPOS_DETALLES
ADD CONSTRAINT fk_tipos_detalles_productros
FOREIGN KEY(id_producto) REFERENCES PRODUCTOS(id_producto);

ALTER TABLE PRODUCTOS
ADD CONSTRAINT fk_productos_empresas
FOREIGN KEY(id_empresa) REFERENCES EMPRESAS(id_empresa);

ALTER TABLE PRODUCTOS
ADD CONSTRAINT fk_productos_categorias
FOREIGN KEY(id_categoria) REFERENCES CATEGORIAS(id_categoria);

ALTER TABLE EQUIPOS
ADD CONSTRAINT fk_equipos_clientes
FOREIGN KEY(id_cliente) REFERENCES CLIENTES(id_cliente);

ALTER TABLE EQUIPOS
ADD CONSTRAINT fk_equipos_modelos
FOREIGN KEY(id_modelo) REFERENCES MODELOS(id_modelo);

ALTER TABLE MODELOS
ADD CONSTRAINT fk_modelos_marcas
FOREIGN KEY(id_marca) REFERENCES MARCAS(id_marca);

/*--------------------------------------------------------------------------------*/
/*---------QUERYS-----------------------------------------------------------------*/
/*--------------------------------------------------------------------------------*/

/*CREAR EMPRESAS*/
INSERT INTO EMPRESAS (nombre, nit, email, clave, direccion, f_creacion, f_actualizacion)
VALUES('master', 12345, 'info@mastermind.com', '12345', 'calle 5', current_timestamp(), current_timestamp());

SELECT * FROM EMPRESAS;

/*CREAR TECNICOS*/
INSERT INTO TECNICOS (nombre, email, clave, telefono, f_creacion, f_actualizacion, id_empresa)
VALUES('john', 'tec1@mastermind.com', '12345', '123412', current_timestamp(), current_timestamp(), 1);

SELECT * FROM TECNICOS;

/*CREAR CIUDADES*/
INSERT INTO CIUDADES (nombre)
VALUE('BOGOTA');

SELECT * FROM CIUDADES;

/*CREAR CLIENTES*/
INSERT INTO CLIENTES (nombre, identificacion, email, clave, telefono, direccion, f_creacion, f_actualizacion, enum_tipo_documento, id_empresa, id_ciudad)
VALUES('john', 12345, 'tec1@mastermind.com', '12345', '123412', 'CALLE 1', current_timestamp(), current_timestamp(), 1, 1, 1);

SELECT * FROM CLIENTES;

/*CREAR CATEGORIAS*/
INSERT INTO CATEGORIAS (nombre)
VALUE('PANTALLAS');

SELECT * FROM CATEGORIAS;

/*CREAR MARCAS*/
INSERT INTO MARCAS (nombre)
VALUE('IPHONE');

SELECT * FROM MARCAS;

/*CREAR MODELOS*/
INSERT INTO MODELOS (nombre, enum_tipo_equipo, id_marca)
VALUE('IPHONE', 1, 1);

SELECT * FROM MODELOS;

/*CREAR EQUIPOS*/
INSERT INTO EQUIPOS (f_creacion, id_cliente, id_modelo)
VALUE(current_timestamp(), 1, 1);

SELECT * FROM EQUIPOS;

/*CREAR PRODUCTOS*/
INSERT INTO PRODUCTOS (sku, nombre, descripcion, cantidad, precio, f_creacion, f_actualizacion, id_empresa, id_categoria)
VALUE(1001, 'vidrio templado', 'vidrios 5d', 24, 50000, current_timestamp(), current_timestamp(), 1, 1);

SELECT * FROM PRODUCTOS;

/*CREAR TIPOS_DETALLES*/
INSERT INTO TIPOS_DETALLES (id_ingreso, id_producto, enum_tipos_detalle)
VALUE(null, 1, 2);

SELECT * FROM TIPOS_DETALLES;

/*CREAR DETALLE_VENTAS*/
INSERT INTO DETALLE_VENTAS (cantidad_usada, monto, descripcion, id_tipo_detalle)
VALUE(1, 5000, 'terreneitorrr', 1);

SELECT * FROM DETALLE_VENTAS;

/*CREAR VENTAS*/
INSERT INTO VENTAS (f_creacion, enum_medio_pago, id_cliente, id_detalle_venta, id_empresa)
VALUE(current_timestamp(), 1, 1, 1, 1);

SELECT * FROM VENTAS;