/*
    Pregunta 1: Modifícalo para que muestre el ID del partido y el nombre del jugador de todos los goles marcados por Alemania.
     Para identificar a los jugadores alemanes, comprueba: teamid = 'GER'
*/
SELECT goal.matchid, goal.player
from eteam
    inner join goal
    on eteam.id = goal.teamid
where id = 'GER'

/*
    Pregunta 2: Mostrar id, estadio, equipo1, equipo2 solo para el juego 1012
*/
SELECT id, stadium, team1, team2
FROM game
where id = 1012

/*
    Pregunta 3: Modifícalo para mostrar el jugador,
     el ID del equipo, el estadio y la fecha de meta de cada gol alemán
*/
SELECT goal.player, goal.teamid, game.stadium, game.mdate
FROM game JOIN goal ON (id=matchid)
where 
teamid = 'GER'

/*
    Pregunta 4: Muestra el equipo1, 
    el equipo2 y el jugador por cada gol marcado por un jugador llamado Marioplayer LIKE 'Mario%'
*/
SELECT GAME.TEAM1, .GAME.TEAM2, GOAL.PLAYER
FROM GAME JOIN GOAL ON(ID = MATCHID)
WHERE
PLAYER LIKE 'Mario%'

/*
    Pregunta 5: Mostrar player, teamid, coach, gtimepara
     todos los goles marcados en los primeros 10 minutosgtime<=10
*/
SELECT GOAL.player, GOAL.teamid, ETEAM.COACH, GOAL.gtime
FROM goal JOIN eteam on teamid=id
WHERE gtime<=10

/*
    Pregunta 6: Enumere las fechas de los partidos 
    y el nombre del equipo en el que 'Fernando Santos' fue el entrenador del equipo1.
*/
SELECT GAME.MDATE, ETEAM.TEAMNAME
FROM GAME JOIN eteam ON (team1=eteam.id)
WHERE COACH = 'Fernando Santos'

/*
    Pregunta 7: Enumere el jugador por cada gol marcado 
    en un partido cuyo estadio fue el 'Estadio Nacional de Varsovia'
*/
SELECT GOAL.PLAYER
FROM GOAL JOIN GAME ON(MATCHID = ID)
WHERE STADIUM = 'National Stadium, Warsaw'

/*
    Pregunta 8: En su lugar, muestra el nombre de todos los jugadores que marcaron un gol contra Alemania.
*/
SELECT DISTINCT goal.player
FROM goal
    JOIN game ON goal.matchid = game.id
WHERE goal.teamid != 'GER'
    AND (game.team1 = 'GER' OR game.team2 = 'GER')

/*
    Pregunta 9: Mostrar el nombre del equipo y el número total de goles marcados
*/
SELECT eteam.teamname, COUNT(*) as total_goals
FROM eteam
    JOIN goal ON eteam.id = goal.teamid
GROUP BY eteam.teamname

/*
    Pregunta 10: Muestra el estadio y el número de goles marcados en cada estadio.
*/
SELECT game.stadium, COUNT(goal.matchid) as numero_goles
FROM game
    JOIN goal ON game.id = goal.matchid
GROUP BY game.stadium

/*
    Pregunta 11: Para cada partido que involucre a 'POL',
     muestra el ID del partido, la fecha y la cantidad de goles marcados.
*/
SELECT game.id as matchid, game.mdate, COUNT(goal.matchid) as goals_scored
FROM game
    JOIN goal ON game.id = goal.matchid
WHERE game.team1 = 'POL' OR game.team2 = 'POL'
GROUP BY game.id, game.mdate

/*
    Pregunta 12: Para cada partido en el que 'GER' marcó, muestra el ID del partido,
     la fecha del partido y la cantidad de goles marcados por 'GER'
*/
SELECT game.id as matchid, game.mdate, COUNT(goal.matchid) as GER_goals
FROM game
    JOIN goal ON game.id = goal.matchid
WHERE goal.teamid = 'GER'
GROUP BY game.id, game.mdate

/*
    Pregunta 13: Ordena el resultado por fecha de meta, ID de coincidencia, equipo 1 y equipo 2.
*/
SELECT
    g.mdate,
    g.team1,
    SUM(CASE WHEN gl.teamid = g.team1 THEN 1 ELSE 0 END) as score1,
    g.team2,
    SUM(CASE WHEN gl.teamid = g.team2 THEN 1 ELSE 0 END) as score2
FROM game g
    LEFT JOIN goal gl ON g.id = gl.matchid
GROUP BY g.id, g.mdate, g.team1, g.team2
ORDER BY g.mdate, g.id, g.team1, g.team2