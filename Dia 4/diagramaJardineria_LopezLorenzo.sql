-- Active: 1715117132873@@172.16.101.139@3306@Jardineria
create table gama_producto(
    gama VARCHAR(50) primary key,
    descripcion_texto text,
    descripcion_html text,
    imagen VARCHAR(255)
);

create table producto(
    codigo_producto varchar(15) primary key,
    nombre VARCHAR(70) not null,
    gama varchar(50) not null,
    dimensiones VARCHAR(25),
    proveedor varchar(50),
    descripcion text,
    cantidad_en_stock smallint(6) not null,
    precio_venta decimal(15, 2) not null,
    precio_proveedor decimal(15, 2),
    Foreign Key (gama) REFERENCES gama_producto(gama)
);

create table oficina(
    codigo_oficina VARCHAR(15) primary key,
    ciudad VARCHAR(30) not null,
    pais VARCHAR(50) not null,
    region varchar(50),
    codigo_postal varchar(10) not null,
    telefono VARCHAR(20) not null,
    linea_direccion1 varchar(50) not null,
    linea_direccion2 varchar(50) 
);

create table empleado(
    codigo_empleado int(11) primary key,
    nombre varchar(50) not null,
    apellido1 varchar(50) not NULl,
    apellido2 varchar(50),
    extension varchar(10) not null,
    email varchar(100) not null,
    codigo_oficina varchar(10) not null,
    codigo_jefe int(11),
    puesto varchar(50),
    Foreign Key (codigo_oficina) REFERENCES oficina(codigo_oficina)
);

create table cliente(
    codigo_cliente int(11) primary key,
    nombre_cliente varchar(50),
    nombre_contacto varchar(30),
    apellido_contacto varchar(30),
    telefono varchar(15) not null,
    fax varchar(15) not null,
    linea_direccion1 VARCHAR(50) not null,
    linea_direccion2 VARCHAR(50),
    ciudad varchar(50) not null,
    region VARCHAR(50),
    pais varchar(50),
    codigo_postal varchar(10),
    codigo_empleado_rep_ventas int(11),
    limite_credito decimal(15, 2),
    Foreign Key (codigo_empleado_rep_ventas) REFERENCES empleado(codigo_empleado)
);

create table pago(
    codigo_cliente int(11) not null,
    forma_pago varchar(40) not null,
    id_transaccion varchar(50) not null,
    fecha_pago date not null,
    total decimal(15, 2) not null,
    PRIMARY KEY(codigo_cliente, id_transaccion),
    Foreign Key (codigo_cliente) REFERENCES cliente(codigo_cliente)
);

create table pedido(
    codigo_pedido int(11) primary key,
    fecha_pedido date not null,
    fecha_esperada date not null,
    fecha_entrega date,
    estado varchar(15) not null,
    comentarios text,
    codigo_cliente int(11) not null,
    Foreign Key (codigo_cliente) REFERENCES cliente(codigo_cliente)
);

create table detalle_pedido(
    codigo_pedido int(11) not null,
    codigo_producto varchar(15) not null,
    cantidad int(11) not null,
    precio_unidad DECIMAL(15, 2),
    numero_linea smallint(6),
    PRIMARY KEY(codigo_pedido, codigo_producto),
    Foreign Key (codigo_pedido) REFERENCES pedido(codigo_pedido),
    Foreign Key (codigo_producto) REFERENCES producto(codigo_producto)
);

