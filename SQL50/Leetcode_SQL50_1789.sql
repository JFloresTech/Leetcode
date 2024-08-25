/*

Leetcode SQL50: 1789. Primary Department for Each Employee (Easy)

Table: Employees

+-------------+----------+
| Column Name | Type     |
+-------------+----------+
| employee_id | int      |
| name        | varchar  |
| reports_to  | int      |
| age         | int      |
+-------------+----------+
employee_id is the column with unique values for this table.
This table contains information about the employees and the id of the manager they report to. Some employees do not report to anyone (reports_to is null). 
 

For this problem, we will consider a manager an employee who has at least 1 other employee reporting to them.

Write a solution to report the ids and the names of all managers, the number of employees who report directly to them, and the average age of the reports rounded to the nearest integer.

Return the result table ordered by employee_id.

The result format is in the following example.

 

Example 1:

Input: 
Employees table:
+-------------+---------+------------+-----+
| employee_id | name    | reports_to | age |
+-------------+---------+------------+-----+
| 9           | Hercy   | null       | 43  |
| 6           | Alice   | 9          | 41  |
| 4           | Bob     | 9          | 36  |
| 2           | Winston | null       | 37  |
+-------------+---------+------------+-----+
Output: 
+-------------+-------+---------------+-------------+
| employee_id | name  | reports_count | average_age |
+-------------+-------+---------------+-------------+
| 9           | Hercy | 2             | 39          |
+-------------+-------+---------------+-------------+
Explanation: Hercy has 2 people report directly to him, Alice and Bob. Their average age is (41+36)/2 = 38.5, which is 39 after rounding it to the nearest integer.
Example 2:

Input: 
Employees table:
+-------------+---------+------------+-----+ 
| employee_id | name    | reports_to | age |
|-------------|---------|------------|-----|
| 1           | Michael | null       | 45  |
| 2           | Alice   | 1          | 38  |
| 3           | Bob     | 1          | 42  |
| 4           | Charlie | 2          | 34  |
| 5           | David   | 2          | 40  |
| 6           | Eve     | 3          | 37  |
| 7           | Frank   | null       | 50  |
| 8           | Grace   | null       | 48  |
+-------------+---------+------------+-----+ 
Output: 
+-------------+---------+---------------+-------------+
| employee_id | name    | reports_count | average_age |
| ----------- | ------- | ------------- | ----------- |
| 1           | Michael | 2             | 40          |
| 2           | Alice   | 2             | 37          |
| 3           | Bob     | 1             | 37          |
+-------------+---------+---------------+-------------+
*/

CREATE DATABASE Leetcode_1789
GO
USE Leetcode_1789
GO

CREATE TABLE Employees(employee_id int, name varchar(20), reports_to int, age int)
GO
INSERT INTO Employees (employee_id, name, reports_to, age) values ('9', 'Hercy', NULL, '43')
INSERT INTO Employees (employee_id, name, reports_to, age) values ('6', 'Alice', '9', '41')
INSERT INTO Employees (employee_id, name, reports_to, age) values ('4', 'Bob', '9', '36')
INSERT INTO Employees (employee_id, name, reports_to, age) values ('2', 'Winston', NULL, '37')

GO

-----------
-- SOLUTION
-----------

WITH Managers(employee_id,reports_count,average_age)
AS
(
SELECT reports_to AS employee_id, COUNT(employee_id) AS reports_count, ROUND((SUM(age)*1.0)/COUNT(employee_id), 0) AS  average_age
FROM Employees
GROUP BY reports_to
HAVING reports_to IS NOT NULL
)
SELECT Managers.employee_id AS employee_id,Employees.name AS name,Managers.reports_count AS reports_count, Managers.average_age AS average_age
FROM Employees
JOIN Managers
ON Employees.employee_id = Managers.employee_id
ORDER BY Managers.employee_id



/* REMOVE 
 USE master
 GO
 ALTER DATABASE [Leetcode_1789] 
 SET SINGLE_USER 
 WITH ROLLBACK IMMEDIATE
 DROP DATABASE [Leetcode_1789]
*/