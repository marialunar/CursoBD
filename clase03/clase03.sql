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

-- 1- Borrar si existe la base de datos Negocio.
drop table if exists Negocio;
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
letra char,
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
insert into Clientes (nombre, apellido, cuit, direccion, comentarios) values
('Maria', 'Lunar''12354789', 'Sarmiento 4123', 'xxxxxxxxxxxxxxxxxxxxxx');
insert into Clientes (nombre, apellido, cuit, direccion, comentarios) values
('Elvis', 'Guaiquire''543215895', 'Sarmiento 4123', 'xxxxxxxxxxxxxxxxxxxxxx');
insert into Clientes (nombre, apellido, cuit, direccion, comentarios) values
('Vanessa', 'Guaiquire''987465213', 'Sarmiento 4123', 'xxxxxxxxxxxxxxxxxxxxxx');
insert into Clientes (nombre, apellido, cuit, direccion, comentarios) values
('Jose', 'Lopez''325897461', 'Sarmiento 4123', 'xxxxxxxxxxxxxxxxxxxxxx');
insert into Clientes (nombre, apellido, cuit, direccion, comentarios) values
('Ana', 'Gomez''756214896', 'Sarmiento 4123', 'xxxxxxxxxxxxxxxxxxxxxx');

insert into Facturas (letra, numero, fecha, monto) values
('A', '4''2025-03-24', '20000');
insert into Facturas (letra, numero, fecha, monto) values
('B', '3''2025-02-18', '30000');
insert into Facturas (letra, numero, fecha, monto) values
('C', '2''2024-12-15', '10000');
insert into Facturas (letra, numero, fecha, monto) values
('D', '1''2024-11-08', '5000');
insert into Facturas (letra, numero, fecha, monto) values
('E', '5''2024-09-21', '50000');

insert into Articulos (nombre, precio, stock) values
('Maria', '5000', '20');
insert into Articulos (nombre, precio, stock) values
('Angel', '2000', '10');
insert into Articulos (nombre, precio, stock) values
('Ana', '3000', '24');
insert into Articulos (nombre, precio, stock) values
('Luis', '24000', '15');
insert into Articulos (nombre, precio, stock) values
('Vanessa', '50000', '5');

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
drop table if exists clientes;


