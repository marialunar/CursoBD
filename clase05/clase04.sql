-- comando DML select
-- * es el comodin que lista todos los campos de la tabla
select * from clientes;
select nombre, apellido from clientes;
select concat(apellido, ' ', nombre) nombre_completo, curdate() fecha, apellido, 2+2 from clientes;

-- columnas calculadas
select codigo, nombre, precio, precio*.21 valor_iva, precio*1.21 precio_iva from articulos;

insert into clientes (nombre, apellido) values ('Laura','Perez');
insert into clientes (nombre, apellido) values ('Laura','Alonso');
insert into clientes (nombre, apellido) values ('Laura','Medina');
-- filtrado usando where
select * from clientes where nombre='Laura';

-- operadores = != <> <= >=
-- operadores logicos and or

select * from  clientes where nombre != 'Laura';
select * from  clientes where nombre <> 'Laura';

select * from  clientes where codigo >= 5;

select * from clientes where nombre='Laura' and apellido='Perez';
select * from clientes where nombre='Laura' or apellido='Perez';

select * from articulos where precio>=3500 and precio<=10000;
select * from articulos where precio<3500 or precio>10000;

-- clausula between, not between
select * from articulos where precio between 3500 and 10000;
select * from articulos where precio not between 3500 and 10000;

select * from clientes
 where codigo=4
 or codigo=5
 or codigo=7;

-- clausula in not in
select * from clientes where codigo in(4,5,7);
select * from clientes where codigo not in(4,5,7);

-- valores null (desconocido)
insert into clientes (nombre, apellido, direccion) values ('Andrea', 'Moretti', '');
insert into clientes (nombre, apellido, direccion) values ('Ana', 'Sosa', null);

select * from clientes where direccion is null;
select * from clientes where direccion ='';
select * from clientes where direccion is not null;

select * from clientes where direccion = null; -- error!!!!

insert into clientes (nombre, apellido) values('Maria', 'Hernandez');
insert into clientes (nombre, apellido) values('Mariano', 'Hernandez');
insert into clientes (nombre, apellido) values('Mariana', 'Hernandez');
insert into clientes (nombre, apellido) values('Melina', 'Hernandez');
insert into clientes (nombre, apellido) values('Mario', 'Hernandez');
insert into clientes (nombre, apellido) values('Marcela', 'Hernandez');
insert into clientes (nombre, apellido) values('Marisa', 'Hernandez');
insert into clientes (nombre, apellido) values('Mirta', 'Hernandez');
insert into clientes (nombre, apellido) values('Marta', 'Hernandez');
insert into clientes (nombre, apellido) values('Monica', 'Hernandez');
insert into clientes (nombre, apellido) values('Micaela', 'Hernandez');
insert into clientes (nombre, apellido) values('Omar', 'Hernandez');
insert into clientes (nombre, apellido) values('Marcelo', 'Hernandez');
insert into clientes (nombre, apellido) values('Mercedes', 'Hernandez');
insert into clientes (nombre, apellido) values('Mariela', 'Hernandez');

-- Busqueda de expresiones con like
select * from clientes where nombre like 'm%';
select * from clientes where nombre like 'ma%';
select * from clientes where nombre like 'mar%';
select * from clientes where nombre like '%a';
select * from clientes where nombre like '%ar%';
select * from clientes where nombre not like 'm%';
select * from clientes where nombre like 'm%a';
select * from clientes where nombre like 'm_r%';
select * from clientes where nombre like '_m_r%';
select * from clientes where nombre like '___';
select * from clientes where nombre like '____';
select * from clientes where nombre like '_____';

-- Order by
select * from clientes;
select * from clientes order by nombre;
select * from clientes order by nombre asc;
select * from clientes order by nombre desc;
select * from clientes order by apellido, nombre;
select * from clientes order by apellido desc, nombre;

-- Limit 
select * from clientes limit 5;
select * from clientes limit 5, 3;