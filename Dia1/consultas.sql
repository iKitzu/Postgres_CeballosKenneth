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


-- ************************
-- * CONSULTAS MULTITABLA *
--*************************

-- 1. Devuelve el nombre del producto, precio y nombre de fabricante de todos los productos
select p.nombre AS producto, p.precio, f.nombre AS fabricante
from producto p
join fabricante f ON p.codigo_fabricante = f.codigo;

-- 2. Devuelve el nombre del producto, precio y nombre de fabricante de todos los productos, ordenado por fabricante
select p.nombre AS producto, p.precio, f.nombre AS fabricante
from producto p
join fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY f.nombre;

-- 3. Devuelve el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante
select p.codigo AS producto_id, p.nombre AS producto, f.codigo AS fabricante_id, f.nombre AS fabricante
from producto p
join fabricante f ON p.codigo_fabricante = f.codigo;

-- 4. Devuelve el nombre del producto, su precio y el nombre de su fabricante del producto más barato
select p.nombre AS producto, p.precio, f.nombre AS fabricante
from producto p
join fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio ASC
LIMIT 1;

-- 5. Devuelve el nombre del producto, su precio y el nombre de su fabricante del producto más caro
select p.nombre AS producto, p.precio, f.nombre AS fabricante
from producto p
join fabricante f ON p.codigo_fabricante = f.codigo
ORDER BY p.precio DESC
LIMIT 1;

-- 6. Devuelve una lista de todos los productos del fabricante Lenovo
select p.nombre AS producto, p.precio
from producto p
join fabricante f ON p.codigo_fabricante = f.codigo
where f.nombre = 'Lenovo';

-- 7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€
select p.nombre AS producto, p.precio
from producto p
join fabricante f ON p.codigo_fabricante = f.codigo
where f.nombre = 'Crucial' AND p.precio > 200;

-- 8. Devuelve todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate sin utilizar el operador IN
select p.nombre AS producto, p.precio
from producto p
join fabricante f ON p.codigo_fabricante = f.codigo
where f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';

-- 9. Devuelve todos los productos de los fabricantes Asus, Hewlett-Packard y Seagate utilizando el operador IN
select p.nombre AS producto, p.precio
from producto p
join fabricante f ON p.codigo_fabricante = f.codigo
where f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');

-- 10. Devuelve el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine con la vocal e
select p.nombre AS producto, p.precio
from producto p
join fabricante f ON p.codigo_fabricante = f.codigo
where f.nombre LIKE '%e';

-- 11. Devuelve el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w
select p.nombre AS producto, p.precio
from producto p
join fabricante f ON p.codigo_fabricante = f.codigo
where f.nombre LIKE '%w%';

-- 12. Devuelve el nombre de producto, precio y nombre de fabricante de todos los productos que tengan un precio mayor o igual a 180€
-- Ordenado por precio (descendente) y por nombre (ascendente)
select p.nombre AS producto, p.precio, f.nombre AS fabricante
from producto p
join fabricante f ON p.codigo_fabricante = f.codigo
where p.precio >= 180
ORDER BY p.precio DESC, p.nombre ASC;

-- 13. Devuelve el identificador y nombre de fabricante de aquellos fabricantes que tienen productos asociados
select f.codigo AS fabricante_id, f.nombre AS fabricante
from fabricante f
join producto p ON f.codigo = p.codigo_fabricante
GROUP BY f.codigo, f.nombre;
