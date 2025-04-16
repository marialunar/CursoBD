-- linea de comentarios
/* bloque de comentarios*/
#linea de comentarios no ANSI SQL

show databases;   -- muestra las bases de datos
drop database if exists Hotel;  -- borra la base de datos Hotel

/*
Identificadores (nombres) de Bases de Datos
MySql sobre windows no es case sensitive en los identificadores
MySql sobre linux o mac es case sensitive en los identificadores
*/
drop database if exists clase02;
create database clase02; -- crea la BD clase01
use clase02; -- activa la BD clase01

show tables; -- muestra las tablas de las BD
/*
Tablas
columnas- campos
filas - registro
*/

drop table if exists clientes;

create table clientes(
codigo int auto_increment primary key,
nombre varchar(25) not null,
apellido varchar(25) not null,
cuit varchar(11),
direccion varchar (50),
comentarios varchar(140)
);

-- describe retorna el metadato de la tabla
describe clientes;

-- listar registros de la tabla
select * from clientes;

-- insercion de registros
insert into clientes (nombre, apellido, direccion) values
('Maria','Lunar','Sarmiento 4123');
insert into clientes (nombre, apellido, direccion) values
('Vanessa','Guaiquire','Sarmiento 4123');
insert into clientes (nombre, apellido, direccion) values
('Elvis','Guaiquire','Sarmiento 4123');
insert into clientes (nombre, apellido, direccion) values
('Troy','Guaiquire','Sarmiento 4123');


-- Ejercicio --

-- 1- Borrar si existe la base de datos Agenda.
drop table if exists Agenda;
-- 2- Crear la base de datos Agenda.
create database Agenda;
-- 3- Ingresar a la base de datos creada.
use Agenda;
-- 4- Crear una tabla llamada "agenda". Debe tener los siguientes campos:

--    nombre (cadena de 20), 
--    domicilio (cadena de 30)
--    telefono (cadena de 11)

create table agenda(
nombre varchar(20),
domicilio varchar(30),
telefono varchar(11)
);

-- 5- Visualizar las tablas existentes en la base de datos para verificar la creación de "agenda".
show tables;
-- 6- Visualizar la estructura de campos de la tabla "agenda". (describe).
describe agenda;
-- 7- Ingresar 10 registros con valores aleatorios.
insert into agenda (nombre, domicilio, telefono) values
('Maria','Sarmiento 4123', '12345678');
insert into agenda (nombre, domicilio, telefono) values
('Vanessa','Palermo', '12345678');
insert into agenda (nombre, domicilio, telefono) values
('Elvis','Recoleta', '12345678');
insert into agenda (nombre, domicilio, telefono) values
('Luis','Villa Crespo', '12345678');
insert into agenda (nombre, domicilio, telefono) values
('Ana','Medrano', '12345678');
insert into agenda (nombre, domicilio, telefono) values
('Jose','Corrientes', '12345678');
insert into agenda (nombre, domicilio, telefono) values
('Valeria','Once', '12345678');
insert into agenda (nombre, domicilio, telefono) values
('Veronica','Bogota', '12345678');
insert into agenda (nombre, domicilio, telefono) values
('Valentina','Caracas', '12345678');
insert into agenda (nombre, domicilio, telefono) values
('Gabriela','Puerto Ordaz', '12345678');
-- 8- Seleccione y muestre todos los registros de la tabla:
select * from agenda;
-- Felicitaciones usted ha armado su agenda personal!!!!





