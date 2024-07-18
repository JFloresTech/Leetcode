/*
Leetcode SQL50: 1075 Project Employees I (Easy)

Table: Project

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| project_id  | int     |
| employee_id | int     |
+-------------+---------+
(project_id, employee_id) is the primary key of this table.
employee_id is a foreign key to Employee table.
Each row of this table indicates that the employee with employee_id is working on the project with project_id.
 

Table: Employee

+------------------+---------+
| Column Name      | Type    |
+------------------+---------+
| employee_id      | int     |
| name             | varchar |
| experience_years | int     |
+------------------+---------+
employee_id is the primary key of this table. It's guaranteed that experience_years is not NULL.
Each row of this table contains information about one employee.
 

Write an SQL query that reports the average experience years of all the employees for each project, rounded to 2 digits.

Return the result table in any order.

The query result format is in the following example.

 

Example 1:

Input: 
Project table:
+-------------+-------------+
| project_id  | employee_id |
+-------------+-------------+
| 1           | 1           |
| 1           | 2           |
| 1           | 3           |
| 2           | 1           |
| 2           | 4           |
+-------------+-------------+
Employee table:
+-------------+--------+------------------+
| employee_id | name   | experience_years |
+-------------+--------+------------------+
| 1           | Khaled | 3                |
| 2           | Ali    | 2                |
| 3           | John   | 1                |
| 4           | Doe    | 2                |
+-------------+--------+------------------+
Output: 
+-------------+---------------+
| project_id  | average_years |
+-------------+---------------+
| 1           | 2.00          |
| 2           | 2.50          |
+-------------+---------------+
Explanation: The average experience years for the first project is (3 + 2 + 1) / 3 = 2.00 and for the second project is (3 + 2) / 2 = 2.50
*/

-- Example schema

CREATE DATABASE Leetcode_1075
GO
USE [Leetcode_1075]
GO

CREATE TABLE Project (project_id int, employee_id int)
CREATE TABLE Employee (employee_id int, name varchar(10), experience_years int)

INSERT INTO Project (project_id, employee_id) values ('1', '1')
INSERT INTO Project (project_id, employee_id) values ('1', '2')
INSERT INTO Project (project_id, employee_id) values ('1', '3')
INSERT INTO Project (project_id, employee_id) values ('2', '1')
INSERT INTO Project (project_id, employee_id) values ('2', '4')

INSERT INTO Employee (employee_id, name, experience_years) values ('1', 'Khaled', '3')
INSERT INTO Employee (employee_id, name, experience_years) values ('2', 'Ali', '2')
INSERT INTO Employee (employee_id, name, experience_years) values ('3', 'John', '1')
INSERT INTO Employee (employee_id, name, experience_years) values ('4', 'Doe', '2')
GO

-----------------------
--SOLUTION
-----------------------
 
SELECT [Prices].[product_id] AS product_id, COALESCE(CAST((SUM([Prices].[price]*[UnitsSold].[units]*1.00)/(SUM(units)*1.00)) AS numeric(4,2)), 0) AS average_price
FROM [Prices] LEFT JOIN [UnitsSold]
ON [Prices].[product_id] = [UnitsSold].[product_id] AND [UnitsSold].[purchase_date] BETWEEN [Prices].[start_date] AND [Prices].[end_date]
GROUP BY [Prices].[product_id]
/* REMOVE 
 USE master
 GO
 ALTER DATABASE [Leetcode_1251] 
 SET SINGLE_USER 
 WITH ROLLBACK IMMEDIATE
 DROP DATABASE [Leetcode_1251]
*/