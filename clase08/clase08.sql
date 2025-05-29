-- Funciones de agrupamiento
-- Funcion sum(parametro)
select sum(precio) total from articulos;
select round(sum(stock*precio),2) valor_total,
	   round(sum(stock*precio*1.21),2) total_con_iva from articulos;

-- Funcion min (parametros)
select min(monto) factura_minima from facturas;
select min(fecha) primer_factura from facturas;
select min(nombre) primer_nombre from clientes;

-- Funcion max (parametros)
select max(monto) factura_maxima from facturas;
select max(fecha) ultima_factura from facturas;
select max(nombre) ultimo_nombre from clientes;

-- Funcion avg (parametro) promedio
select avg(monto) monto_promedio from facturas;

-- funcion count(*)
select count(*) cantidad_clientes from clientes;
select count(*) cantidad_facturas_A from facturas where letra='A';

-- 1- Crear la tabla 'autos' en una nueva base de datos (Vehiculos) con el siguiente detalle:
create database vehiculos;
use vehiculos;

-- 	codigo	INTEGER y PK
-- 	marca	VARCHAR(25)
-- 	modelo	VARCHAR(25)
-- 	color	VARCHAR(25)
-- 	anio	INTEGER
-- 	precio	DOUBLE

--  nota: (anio - año) seguramente tu computadora tiene soporte para la letra ñ,
--        pero muchas instalaciones (ej: web host alquilados) pueden que no tenga soporte para esa letra.
-- 		  en programación se acostumbra a usar los caracteres menores a 128 en la tabla ASCII.

create table autos(
codigo int primary key,
marca varchar(25),
modelo varchar(25),
color varchar(25),
año int,
precio double
);

show tables;
select * from autos;

-- 2- Agregar el campo patente despues del campo modelo.
alter table autos add patente varchar(20) after modelo;

describe autos;

-- 3- Cargar la tabla con 15 autos (hacerlo con MySQL WorkBench o el INSERT INTO).
INSERT INTO autos (codigo, marca, modelo, patente, color, año, precio) VALUES
(1, 'Toyota', 'Corolla', 'ABC123', 'Rojo', 2020, 25000),
(2, 'Ford', 'Fiesta', 'DEF456', 'Azul', 2018, 18000),
(3, 'Chevrolet', 'Cruze', 'GHI789', 'Negro', 2019, 22000),
(4, 'Volkswagen', 'Golf', 'JKL012', 'Blanco', 2021, 28000),
(5, 'Renault', 'Kangoo', 'MNO345', 'Gris', 2017, 16000),
(6, 'Peugeot', '208', 'PQR678', 'Verde', 2019, 20000),
(7, 'Honda', 'Civic', 'STU901', 'Rojo', 2020, 27000),
(8, 'Hyundai', 'Tucson', 'VWX234', 'Azul', 2021, 32000),
(9, 'Nissan', 'Sentra', 'YZA567', 'Negro', 2018, 21000),
(10, 'Mercedes-Benz', 'Clase A', 'BCD890', 'Gris', 2022, 40000),
(11, 'BMW', 'Serie 3', 'EFG123', 'Blanco', 2020, 45000),
(12, 'Audi', 'A4', 'HIJ456', 'Negro', 2019, 43000),
(13, 'Kia', 'Rio', 'KLM789', 'Rojo', 2017, 17000),
(14, 'Mazda', 'CX-5', 'NOP012', 'Azul', 2021, 29000),
(15, 'Fiat', 'Cronos', 'QRS345', 'Gris', 2022, 19000);

-- 4- Realizar las siguientes consultas:
-- 	a. obtener el precio máximo.
select max(precio) precio_maximo from autos;
-- 	b. obtener el precio mínimo.
select min(precio) precio_minimo from autos;
-- 	c. obtener el precio mínimo entre los años 2010 y 2018.
select min(precio) precio_minimo from autos where año between '2010' and '2018';
-- 	d. obtener el precio promedio.
select round(avg(precio),2) precio_promedio from autos;
-- 	e. obtener el precio promedio del año 2016.
select round(avg(precio),2) precio_promedio_2019 from autos where año='2019';
-- 	f. obtener la cantidad de autos.
select count(*) as cantidad_autos from autos;
-- 	g. obtener la cantidad de autos que tienen un precio entre $235.000 y $240.000.
select count(*) cantidad_autos from autos where precio between '235000' and '240000';
-- 	h. obtener la cantidad de autos que hay en cada año.
select año, count(*) as cantidad_autos from autos group by año;
-- 	i. obtener la cantidad de autos y el precio promedio en cada año.
select año, count(*) cantidad_autos, round(avg(precio),2) precio_promedio from autos group by año;
select año, count(*) as cantidad, round(avg(precio),2) precio_promedio from autos group by año;
-- 	j. obtener la suma de precios y el promedio de precios según marca.
select marca, sum(precio) as suma_precio, round(avg(precio),2) as precio_promedio from autos group by marca order by marca;
select marca, sum(precio) suma_precio, round(avg(precio),2) as precio_promedio from autos group by marca;
--  k. informar los autos con el menor precio.
select * from autos where precio like(select min(precio) from autos);
--  l. informar los autos con el menor precio entre los años 2016 y 2018.
select * from autos where precio like (select min(precio) from autos where año between 2016 and 2018) and año between 2016 and 2018;
select * from autos where año between 2016 and 2018 and precio like (select min(precio) from autos where año between 2016 and 2018);
--  m. listar los autos ordenados ascendentemente por marca,modelo,año.
select * from autos order by marca, modelo, año asc;
--  n. contar cuantos autos hay de cada marca.
select marca, count(*) as cantidad_autos from autos group by marca order by marca;
--  o. borrar los autos del siglo pasado.
set sql_safe_updates=0;              -- 0 desactiva     1 activa
set sql_safe_updates=1;
delete from autos where año < '2000';


-- Crear la base de datos Laboratorio 06, si ya existe borrarla.
create database Laboratorio06;
use Laboratorio06;
-- Crear la siguiente tabla.
create table cursos(
	codigo int,
	nombre varchar(20),
	dias varchar(10),
	inscriptos int,
	primary key(codigo)
);

insert into cursos values
	(1,'PHP','lunes',10),
	(2,'Java','lunes',5),
	(3,'Corel Draw','martes',2),
	(4,'Java','martes',5),
	(5,'MySQL','martes',5),
	(6,'Oracle','miercoles',6),
	(7,'C#.net','jueves',5),
	(8,'C#.net','viernes',4),
	(9,'PHP','lunes',10),
	(10,'C#.net','lunes',5),
	(11,'Corel Draw','martes',2),
	(12,'Oracle','martes',5),
	(13,'PHP','martes',5),
	(14,'Oracle','miercoles',6),
	(15,'C#.net','jueves',5),
	(16,'Java','viernes',4);

use Laboratorio06;
show tables;
select * from cursos;

-- Según la tabla cursos
-- 1 - Sumar en uno la cantidad de alumnos inscriptos del curso Java de los días Lunes
set sql_safe_updates=0;              -- 0 desactiva     1 activa
set sql_safe_updates=1;
update cursos set inscriptos=inscriptos+1 where nombre='Java' and dias='Lunes';
-- 2 - Poner en 0 la cantidad de alumnos inscriptos de los cursos de los días Martes
update cursos set inscriptos=0 where dias='Martes';
-- 3 - Borrar los cursos de Java en día Martes
delete from cursos where nombre= 'Java' and dias='Martes';
-- 4 - Sumar 5 inscriptos en los cursos que tengan menos de 5 alumnos inscriptos.
update cursos set inscriptos=inscriptos+5 where inscriptos<5;
-- 5 - Cambiar el nombre de los cursos Java por Java 2 SE.
update cursos set nombre='Java 2 SE' where nombre='Java';

-- Ejercicio 2-- Crear la siguiente tabla.

create table empleados(
	codigo int auto_increment,
	nombre varchar(20) not null,
	apellido varchar(20) not null,
	seccion varchar(20),
	sueldo float,
	primary key (codigo)
);

insert into empleados (nombre,apellido,seccion,sueldo) values
	('juan','perez','administracion',72000),
	('diego','torres','ventas',35200),
	('laura','gomez','ventas',46000),
	('mario','lopez','produccion',45000),
	('dario','sanchez','administracion',86000),
	('juan','boneli','administracion',72000),
	('diego','martinez','ventas',35200),
	('laura','moretti','ventas',46000),
	('sandra','lazante','produccion',45000),
	('susana','mendez','administracion',86000);

select * from empleados;
-- 1 Cambiar al empleado Mario Lopes de la sección administración a producción.
update empleados set seccion='administracion' where nombre='mario' and apellido='lopez';
-- 2 Aplicar un aumento de sueldo básico del 15% a los empleados de ventas.
update empleados set sueldo=sueldo*1.15 where seccion='ventas';
-- 3 Aplicar un aumento del 8% a todos los empleados de producción que tengan un
-- 		sueldo básico menor a 6000 pesos.
update empleados set sueldo=sueldo*1.08 where seccion='produccion' and sueldo<'6000';
-- 4 Dar de baja al empleado Susana Méndez.
delete from empleados where nombre= 'susana' and apellido='mendez';
-- 5 Aplicar un aumento de sueldo del 4% a todos los empleados que tengan un 
-- 		básico mayor o igual a 5000 pesos.
update empleados set sueldo=sueldo*1.04 where sueldo>='5000';
-- 6 Aplicar un aumento de sueldo del 8% a todos los empleados que tengan un 
-- 		básico menor a 5000 pesos.
update empleados set sueldo=sueldo*1.08 where sueldo<'5000';
-- 7 Agregar el campo fecha de nacimiento (date) en la tabla empleados despues del campo apellido.
alter table empleados add fecha_nacimiento date after apellido;
-- 8 Completar una fecha de nacimiento para cada empleado.
update empleados set fecha_nacimiento = '1988-02-18' where codigo=1;
update empleados set fecha_nacimiento = '1988-06-25' where codigo=2;
update empleados set fecha_nacimiento = '1995-12-10' where codigo=3;
update empleados set fecha_nacimiento = '2001-04-05' where codigo=4;
update empleados set fecha_nacimiento = '1983-08-19' where codigo=5;
update empleados set fecha_nacimiento = '1997-02-28' where codigo=6;
update empleados set fecha_nacimiento = '1990-10-15' where codigo=7;
update empleados set fecha_nacimiento = '1985-09-22' where codigo=8;
update empleados set fecha_nacimiento = '2003-07-08' where codigo=9;
-- 9 Listar todos los campos de empleados + una columna que calcule la edad de cada empleado.
select codigo,nombre,apellido,fecha_nacimiento,seccion,sueldo, timestampdiff(year,fecha_nacimiento,curdate())edad from empleados;

-- Usando la base de datos negocio tabla facturas.
use Negocio;
show tables;
INSERT INTO Facturas (letra, numero, fecha, monto)
VALUES ('F', 6, '2025-04-14', 1999.99);
INSERT INTO Facturas (letra, numero, fecha, monto)
VALUES ('G', 7, '2025-05-14', 5000);
select * from Facturas;
-- 1- 	Informar total facturado (suma de monto) en cada día.
select fecha, sum(monto) suma_monto_dia from facturas group by fecha;
-- 2-	Informar total facturado (suma de monto) en cada mes.
select date_format(fecha,'%Y-%m') mes, sum(monto) total_facturado from facturas group by mes;
select concat(month(fecha),'/', YEAR(fecha)) mes, sum(monto) total_facturado from facturas group by concat (MONTH(fecha), '/', YEAR(fecha));
-- 3-	Informar total facturado (suma de monto) y cuantas facturas (count(*)) se realizaron en cada año.
select year(fecha)año, sum(monto)total_facturado, count(*) cantidad_facturas from facturas group by año;

-- Usando la base de datos articulos.
set sql_safe_updates=0;              -- 0 desactiva     1 activa
set sql_safe_updates=1;
use articulos;
show tables;
select * from articulos;
-- 1- Informar cantidad de televisores.
select sum(stock)cantidad_televisores from articulos where descripcion like'televisores';
-- 2- Informar cantidad de televisores segun marca.
select marca, sum(stock)cantidad_televisores from articulos group by marca;
-- 3- Informar cual es el televisor más barato.
select nombre, descripcion, min(precio)from articulos where descripcion="televisores";
select * , min(precio)from articulos where descripcion="televisores";
select * from articulos where descripcion like "%televisores%" and precio=(select min(precio) from articulos where descripcion like"%televisores%");
-- 4- Aumentar un 15% los articulos de la marca 'LG'.
update articulos set precio=precio*1.15 where marca='LG';
-- 5- Bajar un 4% los aires acondicionados.
update articulos set precio=precio-(precio*4/100) where descripcion='Aire acondicionado';
-- 6- Listar los articulos ordenaros por marca,descripción,nombre,precio.
select * from articulos order by marca, descripcion, nombre, precio;
-- 7- Cantidad de articulos según marca y descripción.
select marca, descripcion, sum(stock)cantidad_articulos from articulos group by marca;
-- 8- Mostrar el producto mas caro de la marca 'LG'
select * from articulos where marca = "LG" and precio=(select max(precio)from articulos where marca="LG");
select * from articulos group by marca, precio;

drop database if exists articulos;
create database articulos;
use articulos;
show tables; 
select * from articulos;
CREATE TABLE `articulos` (
  `codigo` int(10) unsigned NOT NULL DEFAULT '0',
  `descripcion` varchar(50) NOT NULL DEFAULT '',
  `nombre` varchar(45) NOT NULL DEFAULT '',
  `precio` float NOT NULL DEFAULT '0',
  `stock` int(10) unsigned NOT NULL DEFAULT '0',
  `marca` varchar(45) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
﻿
INSERT INTO `articulos` VALUES
(1,'Televisores','TV LCD 19\" MODELO PFL3403',2199,40,'PHILIPS'),
(2,'Televisores','TV LCD22\" MODELO LN22A450',2399,30,'SAMSUNG'),
(3,'Televisores','TV LCD 32\" MODELO LC813H ',2999,25,'NOBLEX'),
(4,'Televisores','TV LCD 26\" MODELO 26LG30R',2999,25,'LG'),
(5,'Televisores','TV LCD 26\" MODELO CDH-L26S02',3099,20,'HITACHI'),
(6,'Televisores','TV LCD 32\" MODELO PL3219 ',3399,20,'PHILCO'),
(7,'Computadoras','CPU LE1250DVD2GB160VS',2199,15,'ADMIRAL'),
(8,'Computadoras','CPU A64X246DV2G160VBOF ',2499,8,'ADMIRAL'),
(9,'Computadoras','CPU E5200DVDR2GB320VB ',2699,5,'ADMIRAL'),
(10,'Computadoras','CPU SG3308LA ',3099,5,'COMPAQ PRESARIO'),
(11,'Impresoras','IMPRESORA T23 ',219,18,'EPSON'),
(12,'Impresoras','IMPRESORA DJ-6940 ',349,20,'HEWLETT PACKARD'),
(13,'Impresoras','IMPRESORA T33',399,12,'EPSON'),
(14,'Impresoras','IMPRESORA K5400  ',499,8,'HEWLETT PACKARD'),
(15,'Home Theater','HOME CINEMA SPH70 ',319,0,'PHILCO'),
(16,'Home Theater','HOME CINEMA AMX115 ',419,0,'NOBLEX'),
(17,'Home Theater','HOME CINEMA HT E 860 ',599,0,'X-VIEW'),
(18,'Home Theater','HOME CINEMA DC-T990 ',759,5,'SANYO'),
(19,'Home Theater','HOME CINEMA HT-1105U',829,18,'NOBLEX'),
(20,'Home Theater','HOME CINEMA HT304SL-A2 ',949,6,'LG'),
(21,'Home Theater','HOME CINEMA HT-Z110 ',999,22,'SAMSUNG'),
(22,'Home Theater','HOME CINEMA HTS3011/55',1099,18,'PHILIPS'),
(23,'Home Theater','HOME CINEMA HT503SH',1299,15,'LG'),
(24,'Home Theater','HOME CINEMA HT503SH-AM',1299,12,'LG'),
(25,'Home Theater','HOME CINEMA HT-IS10',1499,7,'SONY'),
(26,'Home Theater','HOME CINEMA HTS3365/55',1599,5,'PHILIPS'),
(27,'Radio','RADIO PORT RP 299  ',49,5,'NOBLEX'),
(28,'Radio','RADIO DX-365',79,15,'KEN BROWN'),
(29,'Radio','RADIO ICF-S10MK2/SCE',79,15,'SONY'),
(30,'Radio','RADIO ICF-18  ',99,15,'SONY'),
(31,'Radio','RADIO ICF-303/304 AM-FM ',129,8,'SONY'),
(32,'Radio','RADIO SRF-59/SC E ',129,10,'SONY'),
(33,'Notebooks','NOTEBOOK C2D2VB250WC14',3699,12,'ADMIRAL'),
(34,'Notebooks','NOTEBOOK CQ40-300',2999,9,'COMPAQ PRESARIO'),
(35,'Notebooks','NOTEBOOK DV2-1010',3999,7,'HEWLETT PACKARD'),
(36,'Notebooks','NOTEBOOK DV4-1212',4199,9,'HEWLETT PACKARD'),
(37,'Notebooks','NOTEBOOK DV4-1212',4199,10,'HEWLETT PACKARD'),
(38,'Telefonos','TELEFONO DECT1221S INALAMBRICO',169,15,'PHILIPS'),
(39,'Telefonos','TELEFONO CD1401B INALAMBRICO',169,8,'PHILIPS'),
(40,'Telefonos','TELEFONO CD2401S INALAMBRICO',239,8,'PHILIPS'),
(41,'Telefonos','TELEFONO CD1302S INALAMBRICO',249,8,'PHILIPS'),
(42,'Telefonos','TELEFONO SANYO HNS-3300 ',69,10,'SANYO'),
(43,'Lavarropas','LAVARROPA GAFA 7000 DIG PROGR 7KG',1679,7,'GAFA'),
(44,'Lavarropas','LAVARROPA GAFA 7500 T750 7,5K ',1839,4,'GAFA'),
(45,'Lavarropas','LAVARROPA GAFA ACQ7500 GRAFT750 7,5K ',1939,12,'GAFA'),
(46,'Lavarropas','LAVARROPA LG WF-T1202TP 12KG C/S',2449,10,'LG'),
(47,'Lavarropas','LAVARROPA LG WF-T1205TP 12K TITANIUM',2499,10,'LG'),
(48,'Camaras digitales','CAMARA DIGITAL KODAK C813',549,10,'KODAK'),
(49,'Camaras digitales','CAMARA DIGITAL VPCS-870EX ',579,15,'SANYO'),
(50,'Camaras digitales','CAMARA DIGITAL C913',599,15,'KODAK'),
(51,'Camaras digitales','CAMARA DIGITAL 760+KIT',649,15,'SAMSUNG'),
(52,'Camaras digitales','CAMARA DIGITAL ES10',749,20,'SAMSUNG'),
(53,'Camaras digitales','CAMARA DIGITAL ES15 ',799,40,'SAMSUNG'),
(54,'Video camaras','CAMARA VIDEO DCR-DVD650',2749,15,'SONY'),
(55,'Video camaras','CAMARA VIDEO DCR-DVD810 ',2999,10,'SONY'),
(56,'Estufas','CALEFACTOR TB 2400 GN',459,12,'SIGMA'),
(57,'Estufas','CALEFACTOR TB 3000 GN',699,12,'SIGMA'),
(58,'Estufas','CALEFACTOR TB 5000 GN',1999,15,'SIGMA'),
(59,'Aire acondicionado','AIRE ACONDICIONADOR SP TS-C096EMAO 2200FS',1999,15,'LG'),
(60,'Aire acondicionado','AIRE ACONDICIONADOR SP TS-C096EMAO 2200FS ',1999,10,'LG'),
(61,'Aire acondicionado','AIRE ACONDICIONADOR SP TS-C126EMAO 3000FS',2249,10,'LG'),
(62,'Aire acondicionado','AIRE ACONDICIONADOR SP TS-C1865DLO 4500FS',3049,20,'LG'),
(63,'Aire acondicionado','AIRE ACONDICIONADOR SP LS-C1863RMO 4500FS',3349,20,'LG'),
(64,'Aire acondicionado','AIRE ACONDICIONADOR SP WSX09CG5R 2500WFS',1599,15,'WESTINGHOUSE');