
/*
+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| id           | int     |
| name         | varchar |
| salary       | int     |
| departmentId | int     |
+--------------+---------+
id is the primary key column for this table.
departmentId is a foreign key of the ID from the Department table.
Each row of this table indicates the ID, name, and salary of an employee. It also contains the ID of their department.
*/


select d.Name as Department, e.Name as Employee, e.salary as salary
from Employee e , Department d
where
e.DepartmentId = d.Id
and
(e.DepartmentId, e.Salary) in
(select e.DepartmentId, max(e.Salary) from Employee e group by e.DepartmentId);
