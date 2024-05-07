-- #####################
-- #### EJERCICIO 4 ####
-- #####################

create DATABASE Countries;
use Countries;

create table pais(
    id int primary key,
    nombre varchar(20),
    continente varchar(50),
    poblacion int
);

create table ciudad(
    id int primary key,
    nombre varchar(20),
    id_pais int,
    foreign key(id_pais) references pais(id)
);

create table idioma(
    id int primary key,
    idioma varchar(50)
);

create table idioma_pais(
    id_idioma int not null,
    id_pais int not null,
    es_oficial tinyint(1),
    foreign key(id_idioma) references idioma(id),
    foreign key(id_pais) references pais(id)
);

insert into pais values
(1, "usa", "North America", 10000000),
(2, "Colombia", "South America", 10000000),
(3, "Japan", "Asia", 10000000),
(4, "Russia", "Asia", 1000000000),
(5, "Spain", "Europe", 1000000),
(6, "England", "Europe", 10000000),
(7, "Germany", "Europe", 10000000),
(8, "France", "Europe", 10000000),
(9, "Italy", "Europe", 1000000000),
(10, "Canada", "North America", 100000000);

insert into ciudad values
(1, "New York City", 1),
(2, "Tokyo", 3),
(3, "Bucaramanga", 2),
(4, "Bogota", 2),
(5, "Los Angeles", 1),
(6, "Kyoto", 3),
(7, "Orlando", 1),
(8, "London", 6),
(9, "Moscow", 4),
(10, "Paris", 8);

insert into idioma values
(1, "English"),
(2, "Spanish"),
(3, "Japanese"),
(4, "Russian"),
(5, "German"),
(6, "French"),
(7, "Italian"),
(8, "Portuguese"),
(9, "Czech"),
(10, "Irish");

insert into idioma_pais values
(1, 1, 1),
(2, 2, 1),
(3, 1, 0),
(1, 2, 0),
(4, 4, 1),
(10, 6, 0),
(8, 5, 0),
(2, 5, 1),
(3, 3, 1),
(7, 9, 1);

select p.nombre as Country, i.idioma as Language, ip.es_oficial as IsOfficial
from idioma_pais ip
inner join idioma i on ip.id_idioma = i.id
inner join pais p on ip.id_pais = p.id;

select p.continente, sum(p.poblacion)
from pais p
group by p.continente
order by sum(p.poblacion) desc;