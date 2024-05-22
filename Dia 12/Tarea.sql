create database Factory;

use Factory;

create table fabricante(
	codigo int(10) primary key,
    nombre varchar(100)
);

create table producto(
	codigo int(10) primary key,
    nombre varchar(100) not null,
    precio double not null,
    codigo_fabricante int(10) not null,
	foreign key(codigo_fabricante) references fabricante(codigo)
);

insert into fabricante values
(1, 'Asus'),
(2, 'Lenovo'),
(3, 'Hewlett-Packard'),
(4, 'Samsung'),
(5, 'Seagate'),
(6, 'Crucial'),
(7, 'Gigabyte'),
(8, 'Huawei'),
(9, 'Xiaomi');

insert into producto values
(1, 'Disco duro SATA3 1TB', 86.99, 5),
(2, 'Memoria RAM DDR4 8GB', 120, 6),
(3, 'Disco SSD 1 TB', 150.99, 4),
(4, 'GeForce GTX 1050Ti', 185, 7),
(5, 'GeForce GTX 1080 Xtreme', 755, 6),
(6, 'Monitor 24 LED Full HD', 202, 1),
(7, 'Monitor 27 LED Full HD', 245.99, 1),
(8, 'Portatil Yoga 520', 559, 2),
(9, 'Portatil Ideapad 320', 444, 2),
(10, 'Impresora HP Deskjet 3720', 59.99, 3),
(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

alter table fabricante modify column nombre varchar(100) not null;

-- Create fulltext index for fields used as text
create fulltext index idx_prod_nombre on producto (nombre);
create fulltext index idx_fab_nombre on fabricante (nombre);
-- Create BTREE index on fields used as numbers
create index idx_prod_price on producto (precio);
show indexes from fabricante;

############ CONSULTAS #############

#1.
select nombre from producto;

#2.
select nombre, precio from producto;

#3.
select * from producto;

#4.
select nombre, precio as USD, format((precio / 1.083), 2) as EUR
from producto;

#5.
select nombre, format((precio / 1.083), 2) as euros, precio as dolares
from producto;

#6.
select upper(nombre) as nombre
from producto;

#7.
select lower(nombre) as nombre
from prodcucto;

#8.
select nombre, upper(left(nombre, 2))
from fabricante;

#9.
select nombre, round(precio) as precio
from producto;

#10.
select nombre, truncate(precio, 0) as precio
from producto;

#11.
select f.codigo
from fabricante f
inner join producto p on f.codigo = p.codigo_fabricante;

#12.
select distinct f.codigo
from fabricante f
inner join producto p on f.codigo = p.codigo_fabricante;

#13.
select nombre
from fabricante
order by nombre;

#14.
select nombre
from fabricante
order by nombre desc;

#15.
select nombre
from producto
order by nombre, precio desc;

#16.
select *
from fabricante
limit 5;

#17.
select *
from fabricante
limit 3, 2;

#18.
select nombre, precio
from producto
order by precio
limit 1;

#19.
select nombre, precio
from producto
order by precio desc
limit 1;

#20.
select nombre
from producto
where codigo_fabricante = 2;

#21.
select nombre
from producto
where precio <= 120;

#22.
select nombre
from producto
where precio >= 400;

#23.
select nombre, precio
from producto
where precio not in (select precio
from producto
where precio >= 400);

#24.
select *
from producto
where precio >= 80 and precio <= 300;

#25.
select *
from producto
where precio between 60 and 200;

#26.
select *
from producto
where codigo_fabricante = 6 and precio > 200;

#27.
select *
from producto
where codigo_fabricante = 1 or codigo_fabricante = 3 or codigo_fabricante 
= 5;

#28.
select *
from producto
where codigo_fabricante in (1, 3, 5);

#29.
select nombre, (precio * 100) as centimos
from producto;

#30.
select nombre
from fabricante
where left(nombre, 1) = "S";

#31.
select nombre
from fabricante
where right(nombre, 1) = "e";

#32.
select nombre
from fabricante
where nombre like "%w%";

#33.
select nombre
from fabricante
where nombre like "____";

#34.
select nombre
from producto
where nombre like "%Portatil%";

#35.
select nombre
from producto
where nombre in (select nombre from producto where nombre like 
"%Monitor%") and precio < 215;

#36.
select nombre, precio
from producto
where precio >= 180
order by precio desc, nombre;

-- Consultas multitabla

#1.
select p.nombre, p.precio, f.nombre
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo;

#2.
select p.nombre, p.precio, f.nombre
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
order by f.nombre;

#3.
select p.codigo, p.nombre, f.codigo, f.nombre
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo;

#4.
select p.nombre, p.precio, f.nombre
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
order by p.precio asc
limit 1;

#5.
select p.nombre, p.precio, f.nombre
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
order by p.precio desc
limit 1;

#6.
select p.*
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre = "Lenovo";

#7.
select p.*
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre = "Crucial" and p.precio > 200;

#8.
select p.*
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre = "Asus" or f.nombre = "Hewlett-Packard" or f.nombre = 
"Seagate";

#9.
select p.*
from producto p
inner join fabricante f on p.codigo_fabricante = f.codigo
where f.nombre in ("Asus", "Hewlett-Packard", "Seagate");

#10.




