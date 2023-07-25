/*Selecciona las columnas film_id y title de la tabla film.*/
SELECT film_id, title FROM film;
/*Selecciona 5 filas de la tabla film, obteniendo todas las columnas.*/
SELECT * FROM film LIMIT 5;
/*Selecciona filas de la tabla film donde film_id sea menor que 4.*/
SELECT * FROM film WHERE film_id<4;
/*Selecciona filas de la tabla film donde el rating sea PG o G.*/
SELECT * FROM film WHERE rating='PG' OR rating='G';
/*Selecciona filas de la tabla actor donde el nombre sea Angela, Angelina o Audrey usando IN.*/
SELECT * FROM actor WHERE first_name IN('Angela','Angelina','Audrey');
/*Obtén una lista de actores con el nombre Julia.*/
SELECT * FROM actor WHERE first_name='Julia';
/*Obtén una lista de actores con los nombres Chris, Cameron o Cuba.*/
SELECT * FROM actor WHERE first_name='Chris' OR first_name='Cameron' OR first_name='Cuba';
/*Selecciona la fila de la tabla customer para el cliente con el nombre Jamie Rice.*/
SELECT * FROM customer WHERE first_name='Jamie' AND last_name='Rice';
/*Selecciona el monto y la fecha de pago de la tabla payment donde el monto pagado sea menor a $1.*/
SELECT amount, payment_date FROM payment WHERE amount<1;
/*¿Cuáles son las diferentes duraciones de alquiler permitidas por la tienda?*/
SELECT rental_duration FROM film GROUP BY rental_duration;
/*Ordena las filas en la tabla city por country_id y luego por city.*/
SELECT * FROM city ORDER BY country_id, city;
/*¿Cuáles son los ID de los últimos 3 clientes que devolvieron un alquiler?*/
SELECT customer_id FROM rental WHERE return_date IS NOT null ORDER BY return_date DESC LIMIT 3;
/*¿Cuántas películas tienen clasificación NC-17? ¿Cuántas tienen clasificación PG o PG-13?*/
SELECT rating, COUNT (rating) FROM film WHERE rating IN ('NC-17','PG','PG-13') GROUP BY rating; 
/*¿Cuántos clientes diferentes tienen registros en la tabla rental?*/
SELECT COUNT(DISTINCT customer_id) FROM rental;
/*¿Hay algún cliente con el mismo apellido?*/
SELECT last_name, COUNT (last_name) FROM customer GROUP BY last_name ORDER BY COUNT (last_name)DESC;
/*¿Qué película (id) tiene la mayor cantidad de actores?*/
SELECT film_id FROM film_actor GROUP BY film_id ORDER BY COUNT (actor_id)DESC LIMIT 1;
/*¿Qué actor (id) aparece en la mayor cantidad de películas?*/
SELECT actor_id FROM film_actor GROUP BY actor_id ORDER BY COUNT (film_id)DESC LIMIT 1;
/*Cuenta el número de ciudades para cada country_id en la tabla city. Ordena los resultados por count(*).*/
SELECT country_id, COUNT(city) FROM city GROUP BY country_id ORDER BY COUNT(*);
/*¿Cuál es la tarifa de alquiler promedio de las películas? ¿Puedes redondear el resultado a 2 decimales?*/
SELECT ROUND(avg(rental_rate),2) FROM film;
/*Selecciona los 10 actores que tienen los nombres más largos (nombre y apellido combinados).*/
SELECT first_name, last_name FROM actor ORDER BY LENGTH(first_name)+LENGTH(last_name) DESC LIMIT 10;