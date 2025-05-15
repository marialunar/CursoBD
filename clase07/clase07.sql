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
update empleados set seccion='produccion' where nombre='mario' and apellido='lopez' and seccion='administracion';
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
-- 7 Agregar el campo fecha de nacimiento (date) en la tabla empleados despues del campo apellido.
-- 8 Completar una fecha de nacimiento para cada empleado.
-- 9 Listar todos los campos de empleados + una columna que calcule la edad de cada empleado.
