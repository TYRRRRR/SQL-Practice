/*
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
(player_id, event_date) is the primary key of this table.
This table shows the activity of players of some games.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.
*/

SELECT 
PLAYER_ID,
DEVICE_ID
FROM 
	(
	SELECT 
	PLAYER_ID, DEVICE_ID, EVENT_DATE,
	DENSE_RANK() OVER(PARTITION BY PLAYER_ID ORDER BY EVENT_DATE ASC) AS CRANK
	FROM ACTIVITY 
	GROUP BY PLAYER_ID, EVENT_DATE
	) AS OP
WHERE OP.CRANK = 1
