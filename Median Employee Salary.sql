/*
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |
| company      | varchar |
| salary       | int     |
+--------------+---------+
id is the primary key column for this table.
Each row of this table indicates the company and the salary of one employee.
*/


WITH cte1 AS
(SELECT id, company,salary, RANK() OVER (PARTITION BY company ORDER BY salary ASC) as aRank,RANK() OVER (PARTITION BY company ORDER BY salary DESC) as bRank
FROM Employee)
SELECT id,company,salary
FROM cte1
WHERE ABS(CAST(aRank AS SIGNED)-CAST(bRank AS SIGNED))= 1 OR aRank = bRank
GROUP BY company, salary
