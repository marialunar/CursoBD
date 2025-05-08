-- 1 - Ingrese a la base de datos negocio.
use Negocio;
-- 2 - Ingrese 5 registros aleatorios en cada tabla.
show tables;
INSERT INTO Articulos (nombre, precio, stock) VALUES
('Laptop HP', 125000.00, 5),
('Mouse Logitech', 3500.99, 20),
('Monitor Samsung', 78000.75, 10),
('Teclado mecánico', 23000.50, 15),
('Auriculares Sony', 45000.99, 8);

describe Clientes;
INSERT INTO Clientes (nombre, apellido, cuit, direccion, comentarios) VALUES
('Juan', 'Pérez', '20-12345678-9', 'Av. Corrientes 1234', 'Cliente frecuente'),
('María', 'González', '27-98765432-1', 'Calle Mitre 567', 'Compra mayorista'),
('Carlos', 'López', '23-45678901-2', 'Boulevard San Martín 890', 'Preferencia en pagos'),
('Ana', 'Martínez', '21-34567890-3', 'Pasaje Colón 432', 'Reclamos recientes'),
('Lucas', 'Fernández', '29-23456789-4', 'Ruta 8 Km 15', 'Visita mensual');

select * from Facturas;
INSERT INTO Facturas (letra, numero, fecha, monto) VALUES
('A', 0001, '2025-04-10', 2500.50),
('B', 0002, '2025-04-11', 1350.75),
('C', 0003, '2025-04-12', 780.40),
('D', 0004, '2025-04-13', 3120.99),
('E', 0005, '2025-04-14', 1589.60);

-- 3 - Basándose en la tabla artículos obtener los siguientes listados.

-- a-	artículos con precio mayor a 100
select * from articulos where precio>100;
-- b-	artículos con precio entre 20 y 40 (usar < y >)
select * from articulos where precio>=20 and precio<=40;
-- c-	artículos con precio entre 40 y 60 (usar BETWEEN)
select * from articulos where precio between 40 and 60;
-- d-	artículos con precio = 20 y stock mayor a 30
select * from articulos where precio=20 and stock>30;
-- e-	artículos con precio (12,20,30) no usar IN
select * from articulos
 where precio=12
 or precio=20
 or precio=30;
-- f-	artículos con precio (12,20,30) usar el IN
select * from articulos where precio in(12,20,30);
-- g-	artículos que su precio no sea (12,20,30)
select * from articulos where precio not in(12,20,30);
-- h-   artículos que su precio mas iva(21 %) sea mayor a 100
select * from articulos where round(precio*1.21,2)>100;
-- i-   listar nombre y descripción de los artículos que no cuesten $100
select nombre from articulos where precio!=100; 
-- j- 	artículos con nombre que contengan la cadena 'lampara' (usar like)
select * from articulos where nombre like 'Laptop HP';
-- k-   artículos que su precio sea menor que 200 y en su nombre no contenga la letra 'a'
select * from articulos where precio<20000 and nombre not like '%a%';
-- 	2- Listar los artículos ordenados por precio de mayor a menor, y si hubiera precio iguales deben quedar ordenados por nombre.
select * from articulos order by precio desc, nombre;
-- 	3- Listar todos los artículos incluyendo una columna denominada precio con IVA, la cual deberá tener el monto con el iva del producto.
select codigo, nombre, precio, stock, round(precio*1.21,2) precio_iva from articulos;
-- 	4- Listar todos los artículos incluyendo una columna denominada 'cantidad de cuotas' y otra 'valor de cuota', la cantidad es fija 
-- y es 3, el valor de cuota corresponde a 1/3 del monto con un 5% de interés.
select codigo, nombre, precio, 3 cantidad_cuotas, round(precio*1.21*1.05/3,2) valor_cuota from articulos;

-- Comando DML delete
select * from clientes;
delete from clientes where codigo=10;

-- Delete Masivo
delete from clientes where nombre='Juan';

-- desactivar la proteccion safe updates en workbench
set sql_safe_updates=0;              -- 0 desactiva     1 activa
set sql_safe_updates=1;

delete from clientes;

-- Comando DML update
select * from clientes;
update clientes set nombre='Gabriela' where codigo=5;
-- Update Masivo
update clientes set nombre='Maria' where nombre='Mario';
update clientes set nombre='Jacinta';

update clientes set nombre='Miriam', apellido='Salas', comentarios='Debe Plata'  where codigo=6;

-- Comando DML insert

-- insert normal con listas de campos
insert into clientes(nombre, apellido,cuit, direccion) values ('Diego','Lopez','93939636','Larrea 234');

-- insert abreviado
insert into clientes values
(null,'Javier','Ledesma','40404040', 'Viel 433','');

select * from clientes;
-- Usando la base de datos negocio.

-- Basándose en la tabla clientes realizar los siguientes puntos.

-- 1- 	Insertar 5 clientes en la tabla clientes utilizando el insert into sin utilizar campos como parte de la sentencias, es decir de la forma simplificada.
insert into clientes values
(null,'Jose','Fermin','12345678', 'Caracas 433','java');
insert into clientes values
(null,'John','Martin','91011121', 'Bolivar 123','nada');
insert into clientes values
(null,'Luis','Trejo','131415161', 'Canada 456','ingles');
insert into clientes values
(null,'Maria','Nuñez','17181920', 'Barinas 789','bailar');
insert into clientes values
(null,'Ana','Rodriguez','21222324', 'Viamonte 589','tv');
-- 2-	Insertar 5 clientes en la tabla clientes utilizando los campos como parte de la sentencias, es decir de la forma extendida. Completar solo los campos nombre, apellido y CUIT.
insert into clientes(nombre, apellido,cuit) values ('Ana','Lopez','12345678');
insert into clientes(nombre, apellido,cuit) values ('Jose','Martinez','93939636');
insert into clientes(nombre, apellido,cuit) values ('Maria','Mendez','78965234');
insert into clientes(nombre, apellido,cuit) values ('Laura','Canelon','25698741');
insert into clientes(nombre, apellido,cuit) values ('Lucas','Sosa','32569874');
-- 3-	Actualizar el nombre del cliente 1 a Jose.
update clientes set nombre='Jose' where codigo=1;
-- 4-	Actualizar el nombre apellido y cuit del cliente 3 a Pablo Fuentes 20-21053119-0.
update clientes set nombre='Pablo', apellido='Fuentes', cuit='20-21053119-0'  where codigo=3;
-- 5-	Actualizar todos los comentarios NULL  a ''.
update clientes set comentarios = '' where comentarios is NULL;
-- 6-	Eliminar los clientes con apellido Perez.
delete from clientes where apellido='Perez';
-- 7-	Eliminar los clientes con CUIT Terminan en 0.
delete from clientes where cuit like'%0';
-- Basandose en la tabla artículos, realizar los siguientes puntos.
select * from articulos;
-- 	8- Aumentar un 20% los precios de los artículos con precio menor igual a 50.
update articulos set precio = precio * 1.2 where precio <= 5000;
update articulos set precio =round(precio * 1.2,2) where precio <= 5000;
-- 	9- Aumentar un 15% los precios de los artículos con precio mayor a 50.
update articulos set precio = precio * 1.15 where precio > 5000;
-- 	10- Bajar un 5% los precios de los artículos con precio mayor a 200.
update articulos set precio = precio * 0.95 where precio > 200;
-- 	11- Eliminar los artículos con stock menor a 0.
delete from articulos where stock < 0;
-- 	12- Agregar a la tabla articulos, los campos stockMinimo y stockMaximo. (usar alter table add)
alter table articulos add stockMinimo int, add stockMaximo int;
--  13- Completar en los registros los valores de los campos stockMinimo y stockMaximo (usar update)
--      teniendo en cuenta que el stock mínimo debe ser menor que el stock máximo.
update articulos set stockMinimo = 10,  stockMaximo = 50 where stockMinimo is NULL or stockMaximo is NULL;
update articulos set stockMinimo = 10;  
update articulos set stockMaximo = 50;
--  14- Lista los articulos que se deben reponer y que cantidad se debe reponer de cada articulos.
--      Tener en cuenta que se debe reponer cuando el stock es menor al stockMinimo y la cantidad de articulos a 
--      reponer es stockMaximo - stock.
select nombre, stock, stockMinimo, stockMaximo, (stockMaximo - stock) as cantidadAReponer
from articulos where stock < stockMinimo;

select *, (stockMaximo - stock) as cantidadAReponer
from articulos where stock < stockMinimo;

SELECT nombre, stock, stockMinimo
FROM articulos
WHERE stock <= stockMinimo;

--  15- Calcular el valor de venta de toda la mercaderia que hay en stock.
select SUM(stock * precio) AS valorTotalVenta from articulos;
select round(sum(stock*precio),2) valortotal from articulos;
select *, round(stock*precio,2) valortotal from articulos;

--  16- Calcular el valor de venta + iva de toda la mercaderia que hay en stock.
select  SUM(stock * precio * 1.21) AS valorTotalVentaConIVA from articulos;
select round (sum(stock*precio),2) valortotal, stock*precio*1.21 from articulos;
select *, round(stock*precio,2) valortotal, stock*precio*1.21 from articulos;

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

-- 	c. obtener el precio mínimo entre los años 2010 y 2018.
-- 	d. obtener el precio promedio.
-- 	e. obtener el precio promedio del año 2016.
-- 	f. obtener la cantidad de autos.
-- 	g. obtener la cantidad de autos que tienen un precio entre $235.000 y $240.000.
-- 	h. obtener la cantidad de autos que hay en cada año.
-- 	i. obtener la cantidad de autos y el precio promedio en cada año.
-- 	j. obtener la suma de precios y el promedio de precios según marca.
--  k. informar los autos con el menor precio.
--  l. informar los autos con el menor precio entre los años 2016 y 2018.
--  m. listar los autos ordenados ascendentemente por marca,modelo,año.
--  n. contar cuantos autos hay de cada marca.
--  o. borrar los autos del siglo pasado.