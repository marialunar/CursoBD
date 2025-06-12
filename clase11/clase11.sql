-- Uso de JOIN


-- Usando la base de datos negocio (usando todas las tablas).


-- 1- Informar quienes (nombre,apellido) compraron 'lamparas'.
select distinct c.codigo, c.nombre, c.apellido 
from clientes c 
join facturas f on c.codigo=f.codigo_cliente
join detalles d on f.letra=d.letra and f.numero=d.numero
join articulos a on d.codigo=a.codigo 
where a.nombre like "%lampara%";

-- 2- Informar que articulos compro 'Juan Perez'.

select distinct a.codigo, a.nombre, a.precio, a.stock
from clientes c 
join facturas f on c.codigo=f.codigo_cliente
join detalles d on f.letra=d.letra and f.numero=d.numero
join articulos a on d.codigo=a.codigo
 where c.nombre="Juan" and c.apellido="perez";
 
 -- lean
 select 
  a.nombre articulo,
  d.cantidad,
  f.letra, 
  f.numero, 
  f.fecha
from facturas f
join clientes c on f.codigo_cliente = c.codigo
join detalles d on f.letra = d.letra and f.numero = d.numero
join articulos a on d.codigo = a.codigo
where c.nombre = 'Juan' and c.apellido = 'Perez';
 
-- 3- Informar cuantas lamparas se vendieron.
select sum(d.cantidad) cantidad_de_lamparas_vendidas
from detalles d join articulos a on d.codigo=a.codigo
where a.nombre like "%lampara%";
-- lean
select
a.nombre,
d.cantidad
from facturas f
join detalles d on f.letra = d.letra and f.numero = d.numero
join articulos a on d.codigo = a.codigo
where a.nombre like '%lampara%';

-- 4- Informar cuantas unidades se vendieron en total en cada articulo.
select a.codigo, a.nombre, sum(d.cantidad) cantidad_vendidas
from detalles d join articulos a on d.codigo=a.codigo
group by a.codigo;
-- lean
select
a.nombre,
sum(d.cantidad) total_vendido
from facturas f
join detalles d on f.letra = d.letra and f.numero = d.numero
join articulos a on d.codigo = a.codigo
group by nombre;

-- 5- Informar la lista de artículos vendidos el día de hoy.
select distinct a.codigo, a.nombre, a.precio, a.stock
from facturas f
join detalles d on f.letra=d.letra and f.numero=d.numero
join articulos a on d.codigo= a.codigo
where f.fecha=curdate();

-- lean 
select a.nombre
from facturas f
join detalles d on f.letra = d.letra and f.numero = d.numero
join articulos a on d.codigo = a.codigo
where f.fecha = CURDATE();

-- 6- Informar la lista de artículos vendidos en este mes.
select distinct a.codigo, a.nombre, a.precio, a.stock
from facturas f
join detalles d on f.letra=d.letra and f.numero=d.numero
join articulos a on d.codigo= a.codigo
where month(f.fecha)= month(curdate());
-- lean
select distinct
a.nombre
from facturas f
join detalles d on f.letra = d.letra and f.numero = d.numero
join articulos a on d.codigo = a.codigo
where month(f.fecha) = month(CURDATE());

-- 7- Informar la lista de artículos vendidos en este año y la cantidad vendida.
select distinct a.codigo, a.nombre, a.precio, a.stock,
sum(d.cantidad)
from facturas f
join detalles d on f.letra=d.letra and f.numero=d.numero
join articulos a on d.codigo= a.codigo
where year(f.fecha)= year(curdate())
group by a.codigo;

-- lean
select
a.nombre,
d.cantidad
from facturas f
join detalles d on f.letra = d.letra and f.numero = d.numero
join articulos a on d.codigo = a.codigo
where year(f.fecha) = year(CURDATE());

-- 8- Informar la cantidad de artículos vendidos a cada cliente
select c.codigo, c.nombre, c.apellido,
sum(d.cantidad)
from clientes c
join facturas f on c.codigo=f.codigo_cliente
join articulos a on d.codigo= a.codigo
group by c.codigo;

-- lean
select c.codigo, c.nombre, c.apellido, a.codigo, a.nombre,
sum(d.cantidad)
from facturas f
join detalles d on f.letra = d.letra and f.numero = d.numero
join articulos a on d.codigo = a.codigo
join clientes c on f.codigo_cliente = c.codigo
group by c.codigo;


use negocio;
show tables;
select * from articulos;
select * from facturas;
select * from clientes;
select * from detalles;

insert into articulos values (6,'lamparas',45,10);
insert into articulos values (7, 'lampara bajo consumo', 90, 35);
insert into articulos values (8, 'alicate', 30, 25);
insert into articulos values (9, 'llave inglesa', 45, 20);
insert into articulos values (10, 'sierra manual', 60, 15);
insert into articulos values (11, 'cinta métrica', 20, 50);
insert into articulos values (12, 'nivel de burbuja', 55, 18);
insert into articulos values (13, 'tenaza', 28, 22);
insert into articulos values (14, 'pico de loro', 65, 10);
insert into articulos values (15, 'lampara halógena', 150, 30);

insert into detalles values ("b",3,6,10);
insert into detalles values ('a',2,6,5);   -- lampara led 12w
insert into detalles values ('a',2,2,1);   -- pinza
insert into detalles values ('a',2,7,4);   -- lampara bajo consumo
insert into detalles values ('b',4,10,1);  -- sierra manual
insert into detalles values ('b',4,15,2);
insert into detalles values ('b',5,1,2);   -- destornillador
insert into detalles values ('b',5,6,3);   -- lampara led 12w
insert into detalles values ('b',5,12,1);  -- nivel de burbuja
insert into detalles values ('A',100,12,1);

insert into facturas values ('a',6,'2011-10-19',750,4);  -- Mario Lopez
insert into facturas values ('a',7,'2011-10-20',1290,2); -- Diego Torres
insert into facturas values ('a',8,'2011-10-21',430,3);  -- Laura Gomez
insert into facturas values ('b',9,'2011-10-22',960,1);  -- Juan Perez
insert into facturas values ('b',10,'2011-10-23',1110,5);-- Dario Sanchez
insert into facturas values ('b',11,'2011-10-23',590,2); -- Diego Torres
insert into facturas values ('c',12,'2011-10-24',1330,4);-- Mario Lopez
insert into facturas values ('c',13,'2011-10-25',240,3); -- Laura Gomez
insert into facturas values ('c',14,'2011-10-26',380,1); -- Juan Perez
insert into facturas values ('c',15,'2011-10-27',870,5); -- Dario Sanchez
insert into facturas values ('a',14,'2025-05-26',380,1); -- Juan Perez
insert into facturas values ('b',15,'2025-05-27',870,5); -- Dario Sanchez