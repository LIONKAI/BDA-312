/*
    Pregunta 1:Enumere las películas en las que el año es 1962 y el presupuesto 
    es superior a 2000000 [ID del programa, título]
*/
SELECT id, title
FROM movie
WHERE yr = 1962 AND budget > 2000000
/*
    Pregunta 2: Regala el año de 'Ciudadano Kane'.
*/
select yr from movie
where title = 'Citizen Kane'
/*
    Pregunta 3: Enumere todas las películas de Star Trek, incluya la identificación, el título y 
    el año (todas estas películas comienzan con las palabras Star Trek en el título). 
    Ordene los resultados por año.
*/
SELECT id, title, yr
FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr
/*
    Pregunta 4: ¿Qué número de identificación tiene el actor 'Glenn Close'?
*/
select id from actor
where name = 'Glenn Close'
/*
    Pregunta 5:  Cuál es la identificación de la película de 1942 'Casablanca'
*/
select id from movie
where yr = 1942 and title = 'Casablanca'
/*
    Pregunta 6: Obtenga la lista de reparto de 'Casablanca' de 1942.
¿Qué es una lista de reparto?
Use movieid = 11768 (o cualquier valor que haya obtenido de la pregunta anterior)
*/
SELECT actor.name
FROM casting
JOIN actor ON casting.actorid = actor.id
WHERE casting.movieid = 132689
/*
    Pregunta 7:  Obtén la lista de reparto de la película 'Alien'
*/
SELECT actor.name
FROM casting
JOIN actor ON casting.actorid = actor.id
WHERE casting.movieid = 103569
/*
    Pregunta 8: Enumera las películas en las que ha aparecido 'Harrison Ford'
*/
SELECT title
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford'
/*
    Pregunta 9: Enumere las películas en las que ha aparecido 'Harrison Ford', pero no 
    en el papel protagonista. [Nota: el campo de casting da la posición del actor. 
    Si ord=1 entonces este actor está en el papel protagonista]
*/
SELECT title
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE actor.name = 'Harrison Ford'
  AND casting.ord != 1
/*
    Pregunta 10:Enumere las películas junto con la estrella principal de todas las películas de 1962.
*/
SELECT movie.title, actor.name
FROM movie
JOIN casting ON movie.id = casting.movieid
JOIN actor ON casting.actorid = actor.id
WHERE movie.yr = 1962
  AND casting.ord = 1
/*
    Pregunta 11:Enumere las películas junto con la estrella principal de todas las películas de 1962.
*/
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2
/*
    Pregunta 12:Enumere las películas junto con la estrella principal de todas las películas de 1962.
*/
SELECT title, name
FROM movie JOIN casting ON (movieid=movie.id
AND ord=1)
JOIN actor ON (actorid=actor.id)
WHERE movie.id IN (
SELECT movieid FROM casting
WHERE actorid IN (
SELECT id FROM actor
WHERE name='Julie Andrews'))
/*
    Pregunta 13:Enumere las películas junto con la estrella principal de todas las películas de 1962.
*/
SELECT name
FROM actor
JOIN casting ON id = actorid
WHERE ord = 1
GROUP BY id, name
HAVING COUNT(*) >= 15
ORDER BY name ASC;
/*
    Pregunta 14:Enumere las películas junto con la estrella principal de todas las películas de 1962.
*/
SELECT title, COUNT(actorid) as numero_actores
FROM movie 
JOIN casting  ON id = movieid
WHERE yr = 1978
GROUP BY id, title
ORDER BY numero_actores DESC, title ASC;
/*
    Pregunta 15:Enumere las películas junto con la estrella principal de todas las películas de 1962.
*/
SELECT DISTINCT name
FROM actor
JOIN casting ON actor.id = casting.actorid
WHERE casting.movieid IN (
  SELECT movieid
  FROM casting
  JOIN actor ON casting.actorid = actor.id
  WHERE actor.name = 'Art Garfunkel'
)
AND actor.name != 'Art Garfunkel'