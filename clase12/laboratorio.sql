-- Usando la base de datos hr

show tables;
-- Ingresar 5 nuevos paises (countries).
select * from countries;

INSERT INTO COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) VALUES ('VE','Venezuela',2);
INSERT INTO COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) VALUES ('CO','Colombia',2);
INSERT INTO COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) VALUES ('CL','Chile',2);
INSERT INTO COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) VALUES ('UY','Uruguay',2);
INSERT INTO COUNTRIES (COUNTRY_ID,COUNTRY_NAME,REGION_ID) VALUES ('ES','España',1);

-- Ingresar 5 nuevas ciudades (locations).
select * FROM LOCATIONS;
SHOW tables;
INSERT INTO LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) VALUES ('3300','Residencias Karuai Torre B1','8050','Bolivar','Puerto Ordaz','VE');
INSERT INTO LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) VALUES ('3400','Carrera 50 No. 45-67, Barrio El Prado','080002','Barranquilla','El Prado','CO');
INSERT INTO LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) VALUES ('3500','Calle Ignacio Carrera Pinto 1480','8340518','Santiago','Ñuñoa','CL');
INSERT INTO LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) VALUES ('3600','Calle Canelones 1234','11200','Montevideo','Cordón','UY');
INSERT INTO LOCATIONS (LOCATION_ID,STREET_ADDRESS,POSTAL_CODE,CITY,STATE_PROVINCE,COUNTRY_ID) VALUES ('3700','Calle de Alcalá 123','28009','Salamanca','Madrid','ES');
-- Ingresar 5 nuevos departamentos (departments)
select * FROM DEPARTMENTS;
INSERT INTO DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) VALUES (280,'Merchandising',NULL,1700);
INSERT INTO DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) VALUES (290,'Supply Chain',NULL,1700);
INSERT INTO DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) VALUES (300,'Data Analytics',NULL,1700);
INSERT INTO DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) VALUES (310,'Innovation',NULL,1700);
INSERT INTO DEPARTMENTS (DEPARTMENT_ID,DEPARTMENT_NAME,MANAGER_ID,LOCATION_ID) VALUES (320,'Corporate Social Responsibility',NULL,1700);
-- Ingresar 5 nuevos empleados (employees).
select * FROM employees;
INSERT INTO EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,DEPARTMENT_ID) 
VALUES (207,'Emily','Carter','SCARTER','202.555.0147','2020-03-15T00:00:00','IT_PROG',58000,60);
INSERT INTO EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,DEPARTMENT_ID) 
VALUES (208,'James','Thornton','JTHORNTON','791.123.4567','2018-07-08T00:00:00','IT_PROG',42500,60);
INSERT INTO EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,DEPARTMENT_ID) 
VALUES (209,'Liam','Nguyen','LNGUYEN','412.345.678','2019-01-10T00:00:00','IT_PROG',74000,60);
INSERT INTO EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,DEPARTMENT_ID) 
VALUES (210,'Sofia','Delgado','SDELGADO','612.345.678','2021-11-10T00:00:00','IT_PROG',36000,60);
INSERT INTO EMPLOYEES (EMPLOYEE_ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,HIRE_DATE,JOB_ID,SALARY,DEPARTMENT_ID) 
VALUES (211,'Isabella','Rossi','IROSSI','347.123.4567','2022-05-27T00:00:00','IT_PROG',40000,60);

-- Listar todos los empleados mostrando los datos del departamento de trabajo (departments)
select * FROM departments;

select e.employee_id, e.first_name, e.last_name
from employees e
join department d on d.department_id=e.department_id;

select e.EMPLOYEE_ID, concat(e.LAST_NAME,' ',e.FIRST_NAME) nombre, e.EMAIL,
e.PHONE_NUMBER, e.HIRE_DATE, e.JOB_ID, e.SALARY, e.DEPARTMENT_ID, e.DEPARTMENT_NAME
from EMPLOYEES e join DEPARTMENTS d on e.DEPARTMENT_ID=d.DEPARTMENT_ID;



-- Listar todos los empleados ordenados por fecha de contratación (hire_date)
-- Listar todos los empleador mostrando antiguedad en años.
-- Mostrar cantidad de empleados por departamento.
-- Listar todos los departamentos mostrando direccion completa (locations,countries,regions).
-- Listar todos los empleados y el nombre del jefe (usar jod_id).
-- Listar todos los empleados que trabajan en departamentos de argentina.
-- Listar todos los departamentos agrupados por ciudad.


