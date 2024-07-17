/*
Leetcode SQL50: 570 Managers with at Least 5 Direct Reports (Medium)

Table: Employee

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| department  | varchar |
| managerId   | int     |
+-------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table indicates the name of an employee, their department, and the id of their manager.
If managerId is null, then the employee does not have a manager.
No employee will be the manager of themself.
 

Write a solution to find managers with at least five direct reports.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Employee table:
+-----+-------+------------+-----------+
| id  | name  | department | managerId |
+-----+-------+------------+-----------+
| 101 | John  | A          | null      |
| 102 | Dan   | A          | 101       |
| 103 | James | A          | 101       |
| 104 | Amy   | A          | 101       |
| 105 | Anne  | A          | 101       |
| 106 | Ron   | B          | 101       |
+-----+-------+------------+-----------+
Output: 
+------+
| name |
+------+
| John |
+------+
*/

-- Example schema

CREATE DATABASE Leetcode_570
GO
USE [Leetcode_570]
GO

CREATE TABLE Employee (id int, name varchar(255), department varchar(255), managerId int)

INSERT INTO Employee (id, name, department, managerId) values ('101', 'John', 'A', null)
INSERT INTO Employee (id, name, department, managerId) values ('102', 'Dan', 'A', '101')
INSERT INTO Employee (id, name, department, managerId) values ('103', 'James', 'A', '101')
INSERT INTO Employee (id, name, department, managerId) values ('104', 'Amy', 'A', '101')
INSERT INTO Employee (id, name, department, managerId) values ('105', 'Anne', 'A', '101')
INSERT INTO Employee (id, name, department, managerId) values ('106', 'Ron', 'B', '101')
GO
-----------------------
--SOLUTION
-----------------------

WITH managerCount (managerId, count)
AS
(
SELECT managerId, COUNT(managerId) AS count
FROM Employee
GROUP BY managerId
)
SELECT Employee.name AS name
FROM Employee JOIN managerCount
ON Employee.id = managerCount.managerId
WHERE count > 4


/* REMOVE 
 USE master
 GO
 ALTER DATABASE [Leetcode_570] 
 SET SINGLE_USER 
 WITH ROLLBACK IMMEDIATE
 DROP DATABASE [Leetcode_570]
*/