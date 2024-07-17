/*
Leetcode SQL50: 1378 Replace Employee ID With The Unique Identifier (Easy)

Table: Employees

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| name          | varchar |
+---------------+---------+
id is the primary key (column with unique values) for this table.
Each row of this table contains the id and the name of an employee in a company.
 

Table: EmployeeUNI

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| unique_id     | int     |
+---------------+---------+
(id, unique_id) is the primary key (combination of columns with unique values) for this table.
Each row of this table contains the id and the corresponding unique id of an employee in the company.
 

Write a solution to show the unique ID of each user, If a user does not have a unique ID replace just show null.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Employees table:
+----+----------+
| id | name     |
+----+----------+
| 1  | Alice    |
| 7  | Bob      |
| 11 | Meir     |
| 90 | Winston  |
| 3  | Jonathan |
+----+----------+
EmployeeUNI table:
+----+-----------+
| id | unique_id |
+----+-----------+
| 3  | 1         |
| 11 | 2         |
| 90 | 3         |
+----+-----------+
Output: 
+-----------+----------+
| unique_id | name     |
+-----------+----------+
| null      | Alice    |
| null      | Bob      |
| 2         | Meir     |
| 3         | Winston  |
| 1         | Jonathan |
+-----------+----------+
Explanation: 
Alice and Bob do not have a unique ID, We will show null instead.
The unique ID of Meir is 2.
The unique ID of Winston is 3.
The unique ID of Jonathan is 1.
*/

-- Example schema

CREATE DATABASE Leetcode_1378
GO
USE [Leetcode_1378]
GO

CREATE TABLE Employees (id int, name varchar(20))
CREATE TABLE EmployeeUNI (id int, unique_id int)

INSERT INTO Employees (id, name) values ('1', 'Alice')
INSERT INTO Employees (id, name) values ('7', 'Bob')
INSERT INTO Employees (id, name) values ('11', 'Meir')
INSERT INTO Employees (id, name) values ('90', 'Winston')
INSERT INTO Employees (id, name) values ('3', 'Jonathan')

INSERT INTO EmployeeUNI (id, unique_id) values ('3', '1')
INSERT INTO EmployeeUNI (id, unique_id) values ('11', '2')
INSERT INTO EmployeeUNI (id, unique_id) values ('90', '3')
GO

-----------------------
--SOLUTION
-----------------------

SELECT EmployeeUNI.unique_id, Employees.name
FROM Employees LEFT JOIN EmployeeUNI 
ON Employees.id = EmployeeUNI.id

/* REMOVE 
 USE master
 GO
 ALTER DATABASE [Leetcode_1378] 
 SET SINGLE_USER 
 WITH ROLLBACK IMMEDIATE
 DROP DATABASE [Leetcode_1378]
*/