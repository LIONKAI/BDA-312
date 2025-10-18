/*
    Pregunta 1:Enumere cada nombre de país cuya población sea mayor que la de Rusia.
*/
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
/*
    Pregunta 2: Mostrar los países de Europa con un PIB per cápita mayor que 'Reino Unido'.
*/
select name from world where continent = 'Europe' and gdp/population > 
(select gdp/population from world where name = 'United Kingdom')

/*
    Pregunta 3: Enumere el nombre y el continente de los países que contienen Argentina o Australia . Ordene por nombre del país.
*/
SELECT name, continent
FROM world
WHERE continent in (select continent from world where name in ('Argentina', 'Australia'))
order by name

/*
    Pregunta 4: ¿Qué país tiene una población mayor que la del Reino Unido pero menor que la de Alemania? Indica el nombre y la población.
*/
Select name, population from world where population >
(select population from world where name = 'United Kingdom')
and population < (select population from world where name = 'Germany')

/*
    Pregunta 5: Muestra el nombre y la población de cada país europeo. Muestra la población como porcentaje de la población de Alemania.
*/
Select name,
concat(round((population/(select population from world where name ='Germany'))* 100), '%') as Porcentaje
from world where continent = 'Europe'

/*
    Pregunta 6: ¿Qué países tienen un PIB mayor que el de todos los países europeos? 
    [Indique solo el nombre .]
*/
SELECT name
FROM world
WHERE gdp > (SELECT MAX(gdp) FROM world WHERE continent = 'Europe')

/*
    Pregunta 7: Encuentra el país más grande (por área) en cada continente, muestra el continente , el nombre y el área
*/
SELECT continent, name, area
FROM world w1
WHERE area = (
    SELECT MAX(area)
    FROM world w2
    WHERE w2.continent = w1.continent
)

/*
    Pregunta 8: Enumere cada continente y el nombre del país que aparece primero en orden alfabético.
*/
SELECT continent, name
FROM world w1
WHERE name = (
    SELECT MIN(name)
    FROM world w2
    WHERE w2.continent = w1.continent
)
ORDER BY continent

/*
    Pregunta 9: Encuentra los continentes donde todos los países tienen una población <= 25000000. Luego, encuentra los nombres de los países asociados a estos continentes. 
    Muestra el nombre , el continente y la población .
*/
SELECT name, continent, population
FROM world
WHERE continent IN (
    SELECT continent
    FROM world
    GROUP BY continent
    HAVING MAX(population) <= 25000000
)

/*
    Pregunta 10:Algunos países tienen poblaciones tres veces mayores que las de todos sus vecinos (en el mismo continente).
    Indica los países y continentes.
*/
SELECT name, continent
FROM world x
WHERE population > ALL (
    SELECT population * 3
    FROM world y
    WHERE y.continent = x.continent AND y.name <> x.name
)
