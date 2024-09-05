-- *****************************
-- * CONSULTAS SOBRE UNA TABLA *
-- *****************************

--  1. Lista el nombre de todos los productos que hay en la tabla producto:
select nombre from producto;

--  2. Lista los nombres y los precios de todos los productos de la tabla producto:
select nombre, precio from producto;

--  3. Lista todas las columnas de la tabla producto:
select * from producto;

--  4. Lista el nombre de los productos, el precio en euros y el precio en dólares (USD):
select nombre, precio, precio * 1.1 AS precio_usd from producto;
-- (Suponiendo una tasa de cambio aproximada de 1.1 USD por euro xd)

--  5. Lista el nombre de los productos, el precio en euros y el precio en dólares (USD) con alias:
select nombre AS "nombre de producto", precio AS euros, precio * 1.1 AS dólares from producto;

--  6. Lista los nombres y los precios de todos los productos de la tabla producto, con nombres en mayúscula:
select UPPER(nombre), precio from producto;

--  7. Lista los nombres y los precios de todos los productos de la tabla producto, con nombres en minúscula:
select LOWER(nombre), precio from producto;

--  8. Lista el nombre de todos los fabricantes en una columna y en otra los dos primeros caracteres en mayúsculas:
select nombre, UPPER(SUBSTRING(nombre, 1, 2)) from fabricante;

-- *********
-- * ERROR *
-- *********

--  9. Lista los nombres y los precios de todos los productos, redondeando el precio:
select nombre, ROUND(precio, 2) from producto;

--  10. Lista los nombres y los precios de todos los productos, truncando el precio:
select nombre, TRUNC(precio, 0) from producto;

-- *********
-- */ERROR *
-- *********

--  11. Lista el identificador de los fabricantes que tienen productos en la tabla producto:
select codigo_fabricante from producto;

--  12. Lista el identificador de los fabricantes que tienen productos, eliminando duplicados:
select DISTINCT codigo_fabricante from producto;

--  13. Lista los nombres de los fabricantes ordenados de forma ascendente:
select nombre from fabricante ORDER BY nombre ASC;

--  14. Lista los nombres de los fabricantes ordenados de forma descendente:
select nombre from fabricante ORDER BY nombre DESC;

--  15. Lista los nombres de los productos ordenados por nombre ascendente y precio descendente:
select nombre, precio from producto ORDER BY nombre ASC, precio DESC;

--  16. Devuelve las primeras 5 filas de la tabla fabricante:
select * from fabricante LIMIT 5;

--  17. Devuelve 2 filas a partir de la cuarta fila de la tabla fabricante:
select * from fabricante OFFSET 3 LIMIT 2;

--  18. Lista el nombre y el precio del producto más barato:
select nombre, precio from producto ORDER BY precio ASC LIMIT 1;

--  19. Lista el nombre y el precio del producto más caro:
select nombre, precio from producto ORDER BY precio DESC LIMIT 1;

--  20. Lista el nombre de los productos cuyo fabricante tiene el identificador 2:
select nombre from producto where codigo_fabricante = 2;

--  21. Lista los productos con un precio menor o igual a 120€:
select nombre from producto where precio <= 120;

--  22. Lista los productos con un precio mayor o igual a 400€:
select nombre from producto where precio >= 400;

--  23. Lista los productos que no tienen un precio mayor o igual a 400€:
select nombre from producto where precio < 400;

--  24. Lista los productos con un precio entre 80€ y 300€ (sin `BETWEEN`):
select nombre from producto where precio >= 80 AND precio <= 300;

--  25. Lista los productos con un precio entre 60€ y 200€ (usando `BETWEEN`):
select nombre from producto where precio BETWEEN 60 AND 200;

--  26. Lista los productos con un precio mayor que 200€ y fabricante igual a 6:
select nombre from producto where precio > 200 AND codigo_fabricante = 6;

--  27. Lista los productos donde el fabricante sea 1, 3 o 5 (sin `IN`):
select nombre from producto where codigo_fabricante = 1 OR codigo_fabricante = 3 OR codigo_fabricante = 5;

--  28. Lista los productos donde el fabricante sea 1, 3 o 5 (usando `IN`):
select nombre from producto where codigo_fabricante IN (1, 3, 5);

--  29. Lista el nombre y el precio de los productos en céntimos:
select nombre, precio * 100 AS "céntimos" from producto;

--  30. Lista los fabricantes cuyos nombres empiecen con 'S':
select nombre from fabricante where nombre LIKE 'S%';

--  31. Lista los fabricantes cuyos nombres terminen con la vocal 'e':
select nombre from fabricante where nombre LIKE '%e';

--  32. Lista los fabricantes cuyos nombres contengan la letra 'w':
select nombre from fabricante where nombre LIKE '%w%';

--  33. Lista los fabricantes cuyos nombres tengan 4 caracteres:
select nombre from fabricante where LENGTH(nombre) = 4;

--  34. Lista los productos que contienen la cadena "Portátil":
select nombre from producto where nombre LIKE '%Portátil%';

--  35. Lista los productos que contienen "Monitor" y tienen un precio menor a 215€:
select nombre from producto where nombre LIKE '%Monitor%' AND precio < 215;

--  36. Lista los productos con un precio mayor o igual a 180€, ordenado por precio descendente y luego por nombre ascendente:
select nombre, precio from producto where precio >= 180 ORDER BY precio DESC, nombre ASC;

