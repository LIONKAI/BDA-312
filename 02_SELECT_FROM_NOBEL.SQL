--Nombre: Rolando Gutierrez
--Fecha: 11/09/2023
--Descripción: Consultas básicas a la base de datos NOBEL
/* 
    Pregunta 1: Winners from 1950
*/
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950/* 
    Pregunta 2: 1962 Literature;
*/
SELECT winner
  FROM nobel
 WHERE yr = 1962
   AND subject = 'literature';
/* 
    Pregunta 3: Albert Einstein
*/
select yr, subject from nobel
where winner = 'albert einstein';
/* 
    Pregunta 4: Recent Peace Prizes
*/
select winner from nobel
where yr >= 2000 and subject = 'peace';
/* 
    Pregunta 5: Literature in the 1980's
*/
select yr, subject, winner from nobel 
where yr >= 1980 and yr <= 1989 and subject = 'literature';
/* 
    Pregunta 6: Only Presidents
*/
select yr, subject, winner from nobel
where winner  in ('Theodore Roosevelt',
'Thomas Woodrow Wilson',
'Jimmy Carter',
'Barack Obama');
/* 
    Pregunta 7: John
*/
select winner from nobel
where winner like 'John%'; 
/*
    Pregunta 8: Chemistry and Physics from different years
*/
select yr, subject, winner from nobel
where yr = 1980 and subject = 'physics' or yr=1984 and subject = 'chemistry';
/*
    Pregunta 9: Exclude Chemists and Medics
*/
select yr, subject, winner from nobel
where yr = 1980 and subject not in ('chemistry',
'medicine');
/*
    Pregunta 10:  Early Medicine, Late Literatureo
*/
select yr, subject, winner from nobel
where yr < 1910 and subject = 'medicine'
or yr >= 2004 and subject = 'literature';
/*
    Pregunta 11: Umlaut
*/
select yr, subject, winner from nobel
where winner like '%nberg' and winner like 'peter%';
/*
    Pregunta 12: Apostrophe
*/
select yr, subject, winner from nobel
where winner like '%neill' and winner like 'eugene%';
/*
    Pregunta 13: Knights of the realm
*/
select winner, yr, subject from nobel
where winner like 'Sir%'
order by yr desc, winner asc;
/* 
    Pregunta 14: Chemistry and Physics last
*/
SELECT winner, subject FROM nobel
 WHERE yr=1984
 ORDER BY
case when subject in ('physics', 'chemistry') then 1 else 0 end, subject, winner;
