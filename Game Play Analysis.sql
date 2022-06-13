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

--window function solution
SELECT
    player_id,
    event_date,
    SUM(games_played) OVER (PARTITION BY player_id
                            ORDER BY event_date) AS games_played_so_far
FROM Activity;
