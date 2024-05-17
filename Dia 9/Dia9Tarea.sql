create database Office;
use Office;

create table departamento(
	id int unsigned auto_increment primary key,
    nombre varchar(100) not null,
    presupuesto double unsigned not null,
    gastos double unsigned not null
);

create table empleado(
	id int unsigned auto_increment primary key,
    nif varchar(9) not null unique,
    nombre varchar(100) not null,
    apellido1 varchar(100) not null,
    apellido2 varchar(100),
    id_departamento int unsigned,
    foreign key(id_departamento) references departamento(id)
);


INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 
1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 
3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 
5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 
1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 
5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', 
NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 
'Guerrero',
NULL);


-- ######### Consultas ############

-- Consultas sobre una tabla

#1.
select apellido1 from empleado;

#2.
select distinct apellido1 from empleado;

#3.
select * from empleado;

#4.
select nombre, apellido1, apellido2 from empleado;

#5.
select id_departamento from empleado;

#6.
select distinct id_departamento from empleado;

#7.
select concat(nombre, " ", apellido1, " ", if(apellido2 is null, "", 
apellido2)) as FullName from empleado;

#8.
select upper(concat(nombre, " ", apellido1, " ", if(apellido2 is null, "", 
apellido2))) as FullName from empleado;

#9.
select lower(concat(nombre, " ", apellido1, " ", if(apellido2 is null, "", 
apellido2))) as FullName from empleado;

#10.


#11.
select nombre, (presupuesto - gastos) as "Presupuesto Actual"
from departamento;

#12.
select nombre, (presupuesto - gastos) as PresupuestoActual
from departamento
order by PresupuestoActual asc;

#13.
select nombre from departamento order by nombre asc;

#14.
select nombre from departamento order by nombre desc;

#15.
select apellido1, apellido2, nombre
from empleado
order by apellido1 asc, apellido2 asc, nombre asc;

#16.
select nombre, presupuesto
from departamento
order by presupuesto desc
limit 3;

#17.
select nombre, presupuesto
from departamento
order by presupuesto asc, nombre asc
limit 3;

#18.
select nombre, gastos
from departamento
order by gastos desc
limit 2;

#19.
select nombre, gastos
from departamento
order by gastos
limit 2;

#20.
select *
from empleado
limit 2, 5;

#21
select nombre, presupuesto
from departamento
where presupuesto >= 150000;

#22.
select nombre, gastos
from departamento
where gastos < 5000;

#23.
select nombre, presupuesto
from departamento
where presupuesto >= 100000 and presupuesto <= 200000;

#24.
select nombre, presupuesto
from departamento
where presupuesto not in (select presupuesto from departamento where 
presupuesto > 100000 and presupuesto <= 200000);

#25.
select nombre, presupuesto
from departamento
where presupuesto between 100000 and 200000;

#26.
select nombre, presupuesto
from departamento
where presupuesto not between 100000 and 200000;

#27.
select nombre, gastos, presupuesto
from departamento
where gastos > presupuesto;

#28.
select nombre, gastos, presupuesto
from departamento
where gastos < presupuesto;

#29.
select nombre, gastos, presupuesto
from departamento
where gastos = presupuesto;

#30
select *
from empleado
where apellido2 is null;

#31.
select *
from empleado
where apellido2 is not null;

#32.
select *
from empleado
where apellido2 = "López";

#33.
select *
from empleado
where apellido2 = "Díaz" or apellido2 = "Moreno";

#34.
select *
from empleado
where apellido2 in ("Díaz", "Moreno");

#35.
select nombre, apellido1, apellido2, nif
from empleado
where id_departamento = 3;

#36.
select nombre, apellido1, apellido2, nif
from empleado
where id_departamento in (2, 4, 5);

-- Consultas multitabla (Composicion interna)

#1.
select *
from empleado
inner join departamento on empleado.id_departamento = departamento.id;

#2.
select *
from empleado
inner join departamento on empleado.id_departamento = departamento.id
order by departamento.nombre, empleado.apellido1, empleado.apellido2, 
empleado.nombre;

#3.
select distinct d.id, d.nombre
from departamento d
inner join empleado e on d.id = e.id_departamento;

#4.
select distinct d.id, d.nombre, (d.presupuesto - d.gastos) as 
PresupuestoActual
from departamento d
inner join empleado e on d.id = e.id_departamento;

#5.
select d.nombre
from departamento d
inner join empleado e on d.id = e.id_departamento
where e.nif = "38382980M";

#6.
select d.nombre
from departamento d
inner join empleado e on d.id = e.id_departamento
where concat(e.nombre, " ", e.apellido1, " ", e.apellido2) = "Pepe Ruiz 
Santana";

#7.
select *
from empleado e
inner join departamento d on e.id_departamento = d.id
where d.nombre = "I+D"
order by e.nombre;

#8.
select *
from empleado e
inner join departamento d on e.id_departamento = d.id
where d.nombre = "Sistemas" or d.nombre = "Contabilidad" or d.nombre = 
"I+D"
order by e.nombre;

#9.
select *
from empleado e
inner join departamento d on e.id_departamento = d.id
where d.presupuesto not between 100000 and 200000;

#10.
select distinct d.nombre
from departamento d
inner join empleado e on d.id = e.id_departamento
where e.apellido2 is null;

-- Consultas multitabla (Composicion externa)

#1.
select *
from empleado e left join departamento d on e.id_departamento = d.id;

#2.
select *
from empleado e
left join departamento d on e.id_departamento = d.id
where e.id_departamento is null;

#3.
select *
from empleado e
right join departamento d on e.id_departamento = d.id
where e.id_departamento is null;

#4.
select *
from empleado e
cross join departamento d;

#5.
select *
from empleado e
cross join departamento d
where e.id_departamento is null;

-- Consultas Resumen

#1.
select sum(presupuesto)
from departamento;

#2.
select format(avg(presupuesto), 2)
from departamento;

#3.
select min(presupuesto)
from departamento;

#4.
delimiter //
create function minTabla()
returns varchar(100)
reads sql data
deterministic
begin
	declare valor int;
		set valor = (select min(presupuesto) from departamento);
	return valor;
end //
delimiter ;
    
select nombre, presupuesto
from departamento
where presupuesto = (select minTabla());

#5.
select max(presupuesto)
from departamento;

#6.
delimiter //
create procedure maxTabla(out valor int)
begin
	set valor = (select max(presupuesto) from departamento);
end //
delimiter ;
set @max = 0;
call maxTabla(@max);

select nombre, presupuesto
from departamento
where presupuesto = @max;

#7.
select count(*)
from empleado;

#8.
select count(*)
from empleado
where apellido2 is not null;

#9.
select d.nombre, count(e.id_departamento)
from departamento d
inner join empleado e on d.id = e.id_departamento
group by d.nombre;

#10.
select d.nombre, count(e.id_departamento)
from departamento d
inner join empleado e on d.id = e.id_departamento
group by d.nombre
having count(e.id_departamento) > 2;

#11.
select d.nombre, count(e.id_departamento)
from departamento d
left join empleado e on d.id = e.id_departamento
group by d.nombre;

#12.
select d.nombre, count(e.id_departamento)
from departamento d
left join empleado e on d.id = e.id_departamento
where d.presupuesto > 200000
group by d.nombre;

