/*
    Pregunta 1: Mostrar la población total del mundo.
*/
SELECT SUM(population)
FROM world

/*
    Pregunta 2: Enumere todos los continentes, sólo una vez cada uno.
*/
select distinct continent
from world

/*
    Pregunta 3: Dar el GDP total de África
*/
select sum(gdp) as GDP
from world
where continent = 'Africa'

/*
    Pregunta 4: ¿Cuántos países tienen un area de al menos 1000000?
*/
select count(*)
from world
where area >= 1000000

/*
    Pregunta 5: ¿Cuál es la población total de ('Estonia', 'Letonia', 'Lituania')?
*/

select sum(population)
from world
where name in('Estonia', 'Latvia', 'Lithuania')

/*
    Pregunta 6: Para cada continente muestre el continente y el número de países.
*/
SELECT continent, COUNT(name)
FROM world
GROUP BY continent

/*
    Pregunta 7: Para cada continente , muestre el continente y
     el número de países con poblaciones de al menos 10 millones.
*/
select continent, count(name)
from world
where population >= 10000000
group by continent

/*
    Pregunta 8: Enumere los continentes que tienen una población total de al menos 100 millones.
*/
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000