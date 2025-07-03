-- Crear la base de datos del diagrama Reservas.png
DROP DATABASE IF EXISTS reservas;
CREATE DATABASE hotel;
CREATE DATABASE reservas;
show databases;
use hotel;
use reservas;
show tables;
drop table reservas;
drop table habitaciones;

-- Ingresar registros de prueba.
CREATE TABLE  habitaciones
   (
      habitacion_numero int PRIMARY KEY,
      precio_por_noche DECIMAL NOT NULL,
      piso int,
      max_personas tinyint,
      tiene_cama_bebe tinyint,
      tiene_ducha tinyint,
      tiene_bano tinyint,
      tiene_balcon tinyint
   );
   
   CREATE TABLE  reservas
   (
      reservas_id int,
      inicio_fecha datetime,
      fin_fecha datetime,
      habitacion int,
      huesped int,
      constraint reservas_id_pk primary key (reservas_id),
      constraint reserv_habit_fk foreign key (habitacion) references habitaciones (habitacion_numero),
      constraint huesp_habit_fk foreign key (huesped) references huespedes (huesped_id)
   );
   
   CREATE TABLE  huespedes
   (
      huesped_id int PRIMARY KEY,
      nombres varchar(45),
      apellidos varchar(45),
      telefono double,
      correo varchar(45),
      direccion varchar(45),
      ciudad varchar(45),
      pais varchar(45)
   );
   
INSERT INTO habitaciones VALUES
(101, 75.00, 1, 2, 0, 1, 1, 0),
(102, 80.00, 1, 3, 1, 1, 1, 0),
(201, 90.00, 2, 2, 0, 1, 1, 1),
(202, 95.00, 2, 4, 1, 1, 1, 1),
(301, 120.00, 3, 2, 0, 1, 1, 1),
(302, 110.00, 3, 3, 0, 1, 1, 0),
(401, 150.00, 4, 2, 0, 1, 1, 1),
(402, 140.00, 4, 5, 1, 1, 1, 1);

INSERT INTO huespedes VALUES
(1, 'Juan', 'Pérez', 1123456789, 'juan.perez@example.com', 'Calle Falsa 123', 'Buenos Aires', 'Argentina'),
(2, 'Maria', 'García', 34600112233, 'maria.garcia@example.com', 'Avenida Siempre Viva 45', 'Madrid', 'España'),
(3, 'Pedro', 'Rodríguez', 525512345678, 'pedro.rodriguez@example.com', 'Paseo de la Reforma 789', 'Ciudad de México', 'México'),
(4, 'Ana', 'Martínez', 121234567890, 'ana.martinez@example.com', 'Main Street 10', 'New York', 'USA'),
(5, 'Luisa', 'Fernández', 56987654321, 'luisa.fernandez@example.com', 'Diagonal 56', 'Santiago', 'Chile');

INSERT INTO reservas VALUES
(1, '2025-08-10 15:00:00', '2025-08-15 11:00:00', 101, 1),
(2, '2025-09-01 15:00:00', '2025-09-05 11:00:00', 201, 2),
(3, '2025-08-20 15:00:00', '2025-08-22 11:00:00', 102, 3),
(4, '2025-10-01 15:00:00', '2025-10-07 11:00:00', 301, 4),
(5, '2025-09-15 15:00:00', '2025-09-18 11:00:00', 202, 1),
(6, '2025-11-01 15:00:00', '2025-11-03 11:00:00', 401, 5);
   
-- Realizar consultas de prueba.
select * from reservas; -- consulta de la tabla reserva

select * from habitaciones; -- consulta de la tabla habitaciones

select * from huespedes; -- consulta de la tabla huespedes

-- consulta disponibilidad de habitacion
select habitacion_numero, precio_por_noche from habitaciones;

-- consulta los huespedes por ciudad
select nombres, apellidos, correo from huespedes where ciudad like 'Santiago';

-- consulta de habitaciones con precio entre 75 y 90
select habitacion_numero, precio_por_noche from habitaciones where precio_por_noche between 75 and 90;

-- calcular el precio total de una reserva
select r.reservas_id, h.precio_por_noche * datediff(r.fin_fecha, r.inicio_fecha) as precio_total_estimado
from reservas r
join habitaciones h on r.habitacion = h.habitacion_numero
where r.reservas_id = 1;

-- Listar las reservas hechas por la huésped 'Ana Martinez'):
select
    r.reservas_id,
    r.inicio_fecha,
    r.fin_fecha,
    hab.habitacion_numero,
    hab.precio_por_noche
from reservas as r
join huespedes as hues on r.huesped = hues.huesped_id
join habitaciones as hab on r.habitacion = hab.habitacion_numero
where hues.nombres = 'Ana' and hues.apellidos = 'Martinez';

-- Obtener el promedio de precio por noche de todas las habitaciones:
select avg(precio_por_noche) as precio_promedio_noche from habitaciones;

-- reservas por habitacion
select habitacion, count(reservas_id) as total_reservas
from reservas
group by habitacion
order by total_reservas desc;

-- habitaciones disponibles por fecha 
select h.habitacion_numero, h.precio_por_noche
from habitaciones h
where h.habitacion_numero not in (
    select r.habitacion
    from reservas r
    where (r.inicio_fecha <= '2025-08-30' and r.fin_fecha >= '2025-08-25')
);

-- Mostrar las reservas con número de habitación y su precio por noche
SELECT
    r.reservas_id,
    r.inicio_fecha,
    r.fin_fecha,
    hab.habitacion_numero,
    hab.precio_por_noche
FROM reservas AS r
JOIN habitaciones AS hab ON r.habitacion = hab.habitacion_numero;