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

-- CREATE CTE TO GROUP BY ELO RANGE
WITH t as
	(SELECT COUNT (mp.rating) as Quantity,
		CASE
			WHEN mp.rating between 0 and 1000 then '0-1000'
			WHEN mp.rating between 1001 and 1100 then '1001-1100' 
			WHEN mp.rating between 1101 and 1200 then '1101 - 1200'
			WHEN mp.rating between 1201 and 1300 then '1201 - 1300'
			WHEN mp.rating between 1301 and 1400 then '1301 - 1400'
			WHEN mp.rating between 1401 and 1500 then '1401 - 1500'
			WHEN mp.rating between 1501 and 1600 then '1501 - 1600'
			WHEN mp.rating between 1601 and 1700 then '1601 - 1700'
			WHEN mp.rating between 1701 and 1800 then '1701 - 1800'
			WHEN mp.rating between 1801 and 1900 then '1801 - 1900'
			WHEN mp.rating between 1901 and 2000 then '1901 - 2000'
			WHEN mp.rating between 2001 and 3000 then '2001 - 3000'
			ELSE 'No rating' 
		END as elo, civ
	 FROM match_players mp GROUP BY mp.rating, civ
	 )

-- CIV PICKS BY ELO RANGE - No game mode 
SELECT elo, count(elo) as Quantity, civ from t group by elo,civ ORDER BY elo,quantity DESC


-- Civ chosen by players on RM_1v1 Matches with percentage
SELECT COUNT(mp.civ) as 'Picked', mp.civ,
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
WHERE m.ladder = 'RM_1v1'
GROUP BY mp.civ
ORDER BY 'Picked' DESC



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

