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


-- Usando la base de datos negocio.

-- Basándose en la tabla clientes realizar los siguientes puntos.

-- 1- 	Insertar 5 clientes en la tabla clientes utilizando el insert into sin utilizar campos como parte de la sentencias, es decir de la forma simplificada.
-- 2-	Insertar 5 clientes en la tabla clientes utilizando los campos como parte de la sentencias, es decir de la forma extendida. Completar solo los campos nombre, apellido y CUIT.
-- 3-	Actualizar el nombre del cliente 1 a Jose.
-- 4-	Actualizar el nombre apellido y cuit del cliente 3 a Pablo Fuentes 20-21053119-0.
-- 5-	Actualizar todos los comentarios NULL  a ''.
-- 6-	Eliminar los clientes con apellido Perez.
-- 7-	Eliminar los clientes con CUIT Terminan en 0.

-- Basando se en la tabla artículos, realizar los siguientes puntos.
-- 	8- Aumentar un 20% los precios de los artículos con precio menor igual a 50.
-- 	9- Aumentar un 15% los precios de los artículos con precio mayor a 50.
-- 	10- Bajar un 5% los precios de los artículos con precio mayor a 200.
-- 	11- Eliminar los artículos con stock menor a 0.

-- 	12- Agregar a la tabla articulos, los campos stockMinimo y stockMaximo. (usar alter table add)
--  13- Completar en los registros los valores de los campos stockMinimo y stockMaximo (usar update)
--      teniendo en cuenta que el stock mínimo debe ser menor que el stock máximo.
--  14- Lista los articulos que se deben reponer y que cantidad se debe reponer de cada articulos.
--      Tener en cuenta que se debe reponer cuando el stock es menor al stockMinimo y la cantidad de articulos a 
--      reponer es stockMaximo - stock.
--  15- Calcular el valor de venta de toda la mercaderia que hay en stock.
--  16- Calcular el valor de venta + iva de toda la mercaderia que hay en stock.
