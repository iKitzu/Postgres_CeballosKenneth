-- TABLAS
create table fabricante (
    codigo int primary key,
    nombre varchar(100)
);

create table producto (
    codigo int primary key,
    nombre varchar(100),
    precio double precision,
    codigo_fabricante int,
    foreign key (codigo_fabricante) references fabricante(codigo)
);
