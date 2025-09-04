--Nombre: Rolando Gutierrez
--Fecha: 04/09/2023
--Descripción: Consultas básicas a la base de datos World
/* 
    Pregunta 1: Introduccion
*/
SELECT name, continent, population FROM world;
/* 
    Pregunta 2: large countries
*/
SELECT name FROM world
WHERE population >= 200000000;
/* 
    Pregunta 3: Per caita - GDP
*/
select name , GDP/population as pc_gdp from world where population >= 20000000;
/* 
    Pregunta 4: South America In millions
*/
select name, population/1000000 as countries from world where continent = 'South America';
/* 
    Pregunta 5: France, Germany, Italy
*/
select name, population from world where name in('France', 'Germany', 'Italy')
/* 
    Pregunta 6: United
*/
select name from world where name like '%United%'
/* 
    Pregunta 7: two ways to be big
*/
select name, population, area from world where area >= 3000000 or population >= 250000000;
/* 
    Pregunta 8: One or the other (but not both)
*/
