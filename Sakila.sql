/* 1. ¿Qué consulta ejecutarías para obtener todos los clientes dentro de city_id = 312?
Su consulta debe devolver el nombre, apellido, correo electrónico y dirección del cliente. */

SELECT cu.first_name Nombre, cu.last_name Apellido, cu.email 'Correo Electronico',CONCAT(ad.address, ', ', ci.city, ', ', co.country) Dirección
FROM customer cu JOIN address ad ON(cu.address_id = ad.address_id)
				 JOIN city ci ON(ad.city_id = ci.city_id)
                 JOIN country co ON(ci.country_id = co.country_id)
WHERE ci.city_id = 312;

/* 2. ¿Qué consulta harías para obtener todas las películas de comedia? Su consulta debe devolver el título de la película, la descripción, el año de estreno,
la calificación, las características especiales y el género (categoría). */
SELECT * FROM category;

SELECT f.film_id 'ID Película', f.title Título, f.description Descripción, f.release_year 'Año de Estreno', f.rating Calificación, f.special_features 'Caracteristicas especiales', c.name 'Genero'
FROM film f JOIN film_category fc ON(f.film_id = fc.film_id)
			JOIN category c ON(fc.category_id = c.category_id)
WHERE c.category_id = 5;

/* 3. ¿Qué consulta harías para obtener todas las películas unidas por actor_id = 5? Su consulta debe devolver la identificación del actor, el nombre del actor,
el título de la película, la descripción y el año de lanzamiento. */

SELECT a.actor_id 'ID Actor', CONCAT(a.first_name, ' ', a.last_name) 'Nombre Actor', f.film_id 'ID Pelicula', f.title 'Titulo', f.description Descripción, f.release_year 'Año Lanzamiento'
FROM actor a JOIN film_actor fa ON(a.actor_id = fa.actor_id)
			JOIN film f ON(fa.film_id = f.film_id)
WHERE a.actor_id = 5;

/* 4. ¿Qué consulta ejecutaría para obtener todos los clientes en store_id = 1 y dentro de estas ciudades (1, 42, 312 y 459)? Su consulta debe devolver el nombre,
apellido, correo electrónico y dirección del cliente. */

SELECT st.store_id 'ID Store', ad.city_id 'ID Ciudad', cu.first_name Nombre, cu.last_name Apellido, cu.email 'Correo Electrónico', ad.address Dirección
FROM customer cu JOIN address ad ON(cu.address_id = ad.address_id)
				 JOIN store st ON(cu.store_id = st.store_id)
WHERE st.store_id = 1 AND ad.city_id IN(1, 42, 312, 459);

/* 5. ¿Qué consulta realizarías para obtener todas las películas con una "calificación = G" y "característica especial = detrás de escena", unidas por
actor_id = 15? Su consulta debe devolver el título de la película, la descripción, el año de lanzamiento, la calificación y la función especial.
Sugerencia: puede usar la función LIKE para obtener la parte 'detrás de escena'. */

select * from film;
SELECT f.title Título, f.description Descripción, f.release_year 'Año de Estreno', f.rating Calificación, f.special_features 'Función Especial'
FROM film f JOIN film_actor fa ON(f.film_id = fa.film_id)
WHERE f.rating = 'G' AND f.special_features LIKE('%Behind the Scenes') AND fa.actor_id = 15;

/* 6. ¿Qué consulta harías para obtener todos los actores que se unieron en el film_id = 369? Su consulta debe devolver film_id, title, actor_id y actor_name. */

SELECT fa.film_id 'ID Película', f.title Título, a.actor_id 'ID Actor', CONCAT(a.first_name, ' ', a.last_name) 'Nombre Actor' 
FROM actor a JOIN film_actor fa ON(fa.actor_id = a.actor_id)
			 JOIN film f ON(fa.film_id = f.film_id)
WHERE fa.film_id = 369;

/* 7. ¿Qué consulta harías para obtener todas las películas dramáticas con una tarifa de alquiler de 2.99? Su consulta debe devolver el título de la película,
la descripción, el año de estreno, la calificación, las características especiales y el género (categoría). */

SELECT f.title Título, f.description Descripción, f.release_year 'Año Estreno', f.rating Calificación, f.special_features 'Características Especiales', c.name 'Género(Categoría)', f.rental_rate 'Tarifa Alquiler'
FROM film f JOIN film_category fc ON(f.film_id = fc.film_id)
			JOIN category c ON(fc.category_id = c.category_id)
WHERE f.rental_rate = 2.99 AND c.name = 'Drama';

/* 8. ¿Qué consulta harías para obtener todas las películas de acción a las que se une SANDRA KILMER? Su consulta debe devolver el título de la película,
la descripción, el año de estreno, la calificación, las características especiales, el género (categoría) y el nombre y apellido del actor. */

SELECT f.title Título, f.description Descripción, f.release_year 'Año Estreno', f.rating Calificación, f.special_features 'Características Especiales', c.name 'Género(Categoría)', CONCAT(a.first_name, ' ', a.last_name) 'Nombre Actor'
FROM film f JOIN film_actor fa ON(f.film_id = fa.film_id)
			JOIN actor a ON(fa.actor_id = a.actor_id)
            JOIN film_category fc ON(f.film_id = fc.film_id)
			JOIN category c ON(fc.category_id = c.category_id)
WHERE c.name = 'Action' AND a.actor_id = 23;