-- Pasos principales parar la nromalizacion
-- Primera Forma Normal (1NF) "Reducir"
-- Segundo Forma Normal (2NF) "Redundencia"
-- Tercera Forma Normal (3MF) "Independencia"

-- #################### Primera Forma Normal (1NF) "Reducir" ########################
-- En la 1NF se busca eliminar los repeticiones de datos y segurar con ello que cada columna
-- contenga un solo valor atomico o 'individuales'

-- Ej: nombreCompleto= PEDRO FELIPE GOMEZ BONILLA --> Es atomico?
-- RTA: No, por que se puede dividir en nombres y apellidos

-- Ej2: nonbre= Pedro Felipe,apellido= Gomez Bonilla --> Es atomico?
-- RTA: Depende del diseñador de base de datos, pues es un cireterio muy subjetivo

-- EX1: El siguiente query esta normalizado de acuerdo al 1NF?
create database dia6;
use dia6;
create table Estudiante(
	ID int,
	Nombre varchar(100),
	Telefono varchar(15)
);

-- RTA: No, por que ele usuario esta ingresando el nombre completo. Aun asi, si el diseñador
-- ve pertinente por los requisitos empresariales, lo pueede dejar asi.

-- Como podemos normalizarla, ya habiendo creado la tabla anteriormente?
alter table Estudiante
	add apellido varchar(100);
	
-- Prueba de agregacion de datos
show tables;
select * from Estudiante;
-- Revisar columnas creados
show columns from Estudiante;
insert into Estudiante(id, Nombre, apellido, Telefono) values (1, 'Pedro', 'Gomez', '32023049')

-- Alterar la tabla existente
alter table Estudiante add edad int not null;
drop table Estudiante;



-- Ejercicio Clase
create table curso(
	ID_Curso int primary key,
	Nombre_Curso varchar(50),
	Estudiante_Inscritos varchar(50)
);

insert into curso values (101, 'Matematicas', 'Ana, Juan, Maria')

drop table curso;
drop table Estudiante;
truncate curso;

alter table curso
rename column Estudiantes_Iscritos to Estudiante;


#################### Segundo Forma Normal (2NF) "Redundencia" ########################

create table Estudiante(
	id_estudiante int primary key,
	nombre_estudiante varchar(50),
);
create table curso(
	nombre_curso varchar(50),
	id_curso int primary key,
	nombre_persona
);
create table estudiante_curso(
	id_estudiante int,
	id_curso int
);


