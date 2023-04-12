USE AOE2
GO


-- Quantity of games Played by Ladder type
SELECT DISTINCT COUNT(token) as Games, ladder
FROM matches
GROUP BY ladder

-- Quantity of games played by SERVER Grouped by ladder type
SELECT DISTINCT COUNT(token)as Games, ladder, server
FROM matches
GROUP BY ladder, server
ORDER BY Games DESC

-- Quantity of games played by MAP Grouped by Ladder type
SELECT DISTINCT COUNT(token) as Games, ladder, map
FROM matches
GROUP BY map, ladder
ORDER BY Games DESC

-- Most Chosen player color
SELECT DISTINCT COUNT(token) as Games, color
FROM match_players
GROUP BY color
ORDER BY Games DESC

-- Color chosen by players on RM_1v1 Matches with percentage
SELECT COUNT(mp.color) as 'Player Color', mp.color, m.ladder,

	CAST(COUNT(mp.color) as float)/
	(
		SELECT COUNT(mp.color) as 'Player Color'
		FROM match_players mp
		JOIN matches m
			ON mp.match = m.token
		WHERE m.ladder = 'RM_1v1'
	)*100 as 'Percentage'

FROM match_players mp 
JOIN matches m
	ON mp.match = m.token
WHERE m.ladder = 'RM_1v1'
GROUP BY mp.color, m.ladder
ORDER BY 'Player Color' DESC

-- Civ chosen by players on RM_1v1 Matches with percentage
SELECT COUNT(mp.civ) as 'Player Civ', mp.civ, m.ladder,

	CAST(COUNT(mp.civ) as float)/
	(
		SELECT COUNT(mp.civ) as 'Player Civ'
		FROM match_players mp
		JOIN matches m
			ON mp.match = m.token
		WHERE m.ladder = 'RM_1v1'
	)*100 as 'Percentage'

FROM match_players mp 
JOIN matches m
	ON mp.match = m.token
WHERE m.ladder = 'RM_1v1' and mp.rating BETWEEN 1000 
GROUP BY mp.civ, m.ladder
ORDER BY 'Player Civ' DESC

-- Civ chosen by players on RM_TEAM Matches with percentage
SELECT COUNT(mp.civ) as 'Player Civ', mp.civ, m.ladder,

	CAST(COUNT(mp.civ) as float)/
	(
		SELECT COUNT(mp.civ) as 'Player Civ'
		FROM match_players mp
		JOIN matches m
			ON mp.match = m.token
		WHERE m.ladder = 'RM_TEAM'
	)*100 as 'Percentage'

FROM match_players mp 
JOIN matches m
	ON mp.match = m.token
WHERE m.ladder = 'RM_TEAM'
GROUP BY mp.civ, m.ladder
--HAVING COUNT('Player Civ') > 6000
ORDER BY 'Player Civ' DESC



SELECT *
FROM match_players mp 
JOIN matches m
	ON mp.match = m.token
ORDER BY m.token DESC

