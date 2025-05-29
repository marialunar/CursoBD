drop database if exists negocio;
create database negocio;
use negocio;


create table clientes (
codigo integer auto_increment,
nombre varchar(20) not null,
apellido varchar(20) not null,
cuit char(13),
direccion varchar(50),
comentarios varchar(140),
primary key (codigo)
);


create table facturas(
letra char(1),
numero integer,
fecha date,
monto double,
primary key (letra,numero)
);


create table articulos(
codigo integer auto_increment,
nombre varchar(50),
precio double,
stock integer,
primary key (codigo)
);

-- Campo clave Foranea -Foreign key   (FK) 
alter table facturas add codigo_cliente integer;

-- Restricción de clave foranea
alter table facturas add constraint FK_codigo_cliente
foreign key (codigo_cliente)
references clientes(codigo);

describe facturas;
select * from clientes;
select * from facturas;
insert into facturas values('A',100,curdate(),222,1);
insert into clientes values (null,'Juan','Peres','11111','viel 433','');
truncate facturas;





insert into clientes (nombre,apellido,cuit,direccion) values ('juan','perez','xxxxx','peru 323');
insert into clientes (nombre,apellido,cuit,direccion) values ('diego','torres','xxxxx','chile 320');
insert into clientes (nombre,apellido,cuit,direccion) values ('laura','gomez','xxxxx','san juan 420');
insert into clientes (nombre,apellido,cuit,direccion) values ('mario','lopez','xxxxx','lavalle 770');
insert into clientes (nombre,apellido,cuit,direccion) values ('dario','sanchez','xxxxx','mexico 150');


insert into articulos values (1,'destornillador',25,50);
insert into articulos values (2,'pinza',35,22);
insert into articulos values (3,'martillo',15,28);
insert into articulos values (4,'maza',35,18);
insert into articulos values (5,'valde',55,13);


insert into facturas values ('a',0001,'2011/10/18',500,1);
insert into facturas values ('a',0002,'2011/10/18',2500,2);
insert into facturas values ('b',0003,'2011/10/18',320,2);
insert into facturas values ('b',0004,'2011/10/18',120,3);
insert into facturas values ('b',0005,'2011/10/18',560,5);
-- inserto un registro con la fecha actual
insert into facturas values ('c',0006,curdate(),300,2);

-- consulta del producto cartesiano
select *from clientes, facturas;
select count(*) cantidad from clientes;  -- 6
select count(*) cantidad from facturas; -- 7
select count(*) cantidad from clientes,facturas; -- 42
-- consulta del producto relacionado
select * from clientes, facturas where clientes.codigo=facturas.codigo_cliente;
select * from clientes c ,facturas f where c.codigo=f.codigo_cliente; -- consultas con alias

-- Uso del Join 
select * from clientes c join facturas f on c.codigo=f.codigo_cliente;

-- left join 
select * from clientes c left join facturas f on c.codigo=f.codigo_cliente;
-- rigth join 
select * from clientes c right join facturas f on c.codigo=f.codigo_cliente;

-- cross join
select * from clientes c cross join facturas f;

