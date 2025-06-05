-- Uso de JOIN


-- Usando la base de datos negocio2 (solo tablas clientes y facturas).
use negocio;
show databases;
show tables;
select * from clientes;
select * from facturas;
insert into facturas values ('D',0001,'2025/06/04',500,1);
-- 1-	Informar que clientes (codigo, nombre, apellido) han comprado en el día de hoy.
select distinct c.codigo, c.nombre, c.apellido from clientes c join facturas f on c.codigo=f.codigo_cliente 
where fecha=curdate(); -- yo

select codigo, nombre, apellido from clientes c join facturas f on c.codigo=f.codigo_cliente where fecha=curdate(); -- yo

select clientes.codigo, clientes.nombre, clientes.apellido  from clientes inner join facturas on clientes.codigo=facturas.codigo_cliente 
where facturas.fecha=curdate(); -- ia

-- 2-	Informar la suma de los montos de cada cliente (código,nombre,apellido,total_comprado).
select c.codigo, c.nombre, c.apellido, sum(f.monto) total_comprado from clientes c join facturas f on c.codigo=f.codigo_cliente 
group by c.codigo;

-- 3-	Informar cual es el cliente que más ha comprado (codigo, nombre, apellido).
select c.codigo, c.nombre, c.apellido, sum(f.monto) total_comprado from clientes c join facturas f on c.codigo=f.codigo_cliente 
group by c.codigo order by total_comprado desc limit 1;

-- 4-	Informar la cantidad de facturas de cada cliente (codigo, nombre, apellido,cantidad_facturas).
select c.codigo, c.nombre, c.apellido, count(*) cantidad_facturas from clientes c join facturas f on c.codigo=f.codigo_cliente 
group by c.codigo;
-- 5-	Informar quienes compraron el primer día de ventas (codigo, nombre, apellido).
select distinct c.codigo, c.nombre, c.apellido from clientes c join facturas f on c.codigo=f.codigo_cliente
where f.fecha = (select min(fecha) from facturas);

SELECT clientes.codigo, clientes.nombre, clientes.apellido
FROM clientes
INNER JOIN facturas ON clientes.codigo = facturas.codigo_cliente
WHERE facturas.fecha = (SELECT MIN(fecha) FROM facturas);
-- 6-	Informar que compro el cliente Juan Perez (letra,nro,fecha,monto).
select f.letra, f.numero, f.fecha, f.monto, count(*) cantidad_facturas from clientes c join facturas f on c.codigo=f.codigo_cliente 
where c.nombre="Juan" and c.apellido="perez";

-- Anexamos la tabla detalle de venta
create table detalles(
letra char (1),
numero integer,
codigo integer,
cantidad integer,
primary key (letra, numero, codigo)
);

alter table detalles
add constraint FK_detalles_facturas
foreign key (letra, numero)
references facturas (letra, numero);

alter table detalles
add constraint FK_detalles_articulos
foreign key (codigo)
references articulos (codigo);

insert into detalles values ("a", 1,3,10);
insert into detalles values ("a", 1,1,3);
insert into detalles values ("a", 1,5,3);
insert into detalles values ("a", 2,3,10);
insert into detalles values ("b", 3,3,10);

-- Producto Cartesiano
select * from clientes, facturas, detalles, articulos;
select count(*) cantidad from clientes;   -- 6
select count(*) cantidad from facturas;   -- 8
select count(*) cantidad from detalles;   -- 5
select count(*) cantidad from articulos;  -- 5

select 6*8*5*5;							  -- 1200
select count(*) cantidad from clientes, facturas, detalles, articulos; 

-- consulta del producto relacionado
select * from clientes c join facturas f on c.codigo=f.codigo_cliente 
join detalles d on f.letra=d.letra and f.numero=d.numero
join articulos a on d.codigo=a.codigo;



