-- ------------------------
-- Definiciones importantes
-- ------------------------


-- Significado de SQL
-- Structured Query Language

-- ANSI SQL
-- En la actualidad el SQL es el estándar de facto de la inmensa mayoría de los SGBD comerciales.
-- Y, aunque la diversidad de añadidos particulares que incluyen las distintas implementaciones
-- comerciales del lenguaje es amplia, el soporte al estándar SQL-92 es general y muy amplio.


-- DDL (DATA DEFINITION LANGUAGE)
-- Create table
-- Alter table
-- Drop table

-- DML (DATA MANIPULATION LANGUAGE)
-- Select
-- Insert
-- Update
-- Delete

-- -----------------------------------
-- Tipos de datos más comunes en MySQL
-- -----------------------------------


-- Tipo de datos Texto dedatos más comunes

-- Tipo		Bytes de almacenamiento
-- _______________________________________
-- char(x)		x
-- varchar(x)	x+1


-- Tipo de datos Numérico

-- Tipo		Bytes de almacenamiento
-- _______________________________________
-- bool (boolean)	1	(0 es false distinto de 0 es true)
-- tinyint			1	2^8		256
-- smallint			2	2^16		65536
-- mediumint		3	2^24		16777216
-- int (integer)	4	2^32		4294967296
-- bigint			8	2^64		18446744073709551616
-- float			4	 		
-- double			8
-- decimal(t,d)		t+2 


-- Tipo de datos Fecha y Hora

-- Tipo		Bytes de almacenamiento
-- _______________________________________
-- date		3	Año Mes Dia ‘2012-10-25’		
-- datetime	8
-- time		3
-- year		1


select 'Hola Mundo';
select 2+2;
-- uso del aleas
select 2+2 as valor;
select 2+2 valor;
select 2+2 'valor del resultado';
select pi() 'PI';
select round(pi(),2)'PI';
select curdate()'Fecha';
select curtime()'Hora';
select sysdate()'Fecha y Hora';

show databases;
drop database negocio;
-- 1- Borrar si existe la base de datos Negocio.
drop database if exists Negocio;
-- 2- Crear la base de datos Negocio.
create database Negocio;
-- 3- Ingresar a la base de datos creada.
use Negocio;
-- 4- Crear la tabla Clientes dentro de la base de datos con el siguiente detalle:

-- codigo		int auto_increment y PK
-- nombre		varchar(20) not null
-- apellido		varchar(20) not null
-- cuit			char(13)
-- direccion	varchar(50)
-- comentarios 	varchar(140)

-- PK significa Primary Key

create table Clientes(
codigo int auto_increment primary key,
nombre varchar(20) not null,
apellido varchar(20) not null,
cuit char(13),
direccion varchar (50),
comentarios varchar(140)
);

-- 5- Crear la tabla Facturas dentro de la base de datos con el siguiente detalle:

create table Facturas(
letra char, -- letra enum('A','B','C'),
numero int,
fecha date,
monto double,
primary key(letra,numero)
);
-- Letra		char y PK
-- Numero		integer y PK
-- Fecha		date
-- Monto		double

-- observar que se esta declarando una clave primaria compuesta
-- es decir primary key(letra,codigo)
-- cada campo por si solo no es clave, ni tampoco identifica al registro
-- pero la suma de los dos forman la clave


-- 6- Crear la tabla Articulos dentro de la base de datos con el siguiente detalle:

create table Articulos(
codigo int auto_increment primary key,
nombre varchar(50),
precio double,
stock int
);

-- Codigo		integer auto_increment y PK 
-- Nombre 		varchar(50)
-- Precio		double
-- Stock		integer

-- 7- Cargar 5 registros aleatorios en cada tabla.

INSERT INTO Clientes (nombre, apellido, cuit, direccion, comentarios) VALUES
('Juan', 'Pérez', '20-12345678-9', 'Av. Corrientes 1234', 'Cliente frecuente'),
('María', 'González', '27-98765432-1', 'Calle Mitre 567', 'Compra mayorista'),
('Carlos', 'López', '23-45678901-2', 'Boulevard San Martín 890', 'Preferencia en pagos'),
('Ana', 'Martínez', '21-34567890-3', 'Pasaje Colón 432', 'Reclamos recientes'),
('Lucas', 'Fernández', '29-23456789-4', 'Ruta 8 Km 15', 'Visita mensual');

INSERT INTO Facturas (letra, numero, fecha, monto) VALUES
('A', 0001, '2025-04-10', 2500.50), -- curdate()
('B', 0002, '2025-04-11', 1350.75),
('C', 0003, '2025-04-12', 780.40),
('D', 0004, '2025-04-13', 3120.99),
('E', 0005, '2025-04-14', 1589.60);

INSERT INTO Articulos (nombre, precio, stock) VALUES
('Laptop HP', 125000.00, 5),
('Mouse Logitech', 3500.99, 20),
('Monitor Samsung', 78000.75, 10),
('Teclado mecánico', 23000.50, 15),
('Auriculares Sony', 45000.99, 8);

-- 8- Mostrar las tablas que tiene la base de datos negocio.
show tables;
-- 9- Describir (detalle de campos - METADATO) cada una de las tablas de la base de datos.
describe Clientes;
describe Facturas;
describe Articulos;
-- 10- Listar los registros de cada tabla.
select * from Clientes;
select * from Facturas;
select * from Articulos;


