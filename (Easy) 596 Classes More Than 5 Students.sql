/*
Leetcode SQL50: 596 Classes More Than 5 Students (Easy)

Table: Courses

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| student     | varchar |
| class       | varchar |
+-------------+---------+
(student, class) is the primary key (combination of columns with unique values) for this table.
Each row of this table indicates the name of a student and the class in which they are enrolled.
 

Write a solution to find all the classes that have at least five students.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Courses table:
+---------+----------+
| student | class    |
+---------+----------+
| A       | Math     |
| B       | English  |
| C       | Math     |
| D       | Biology  |
| E       | Math     |
| F       | Computer |
| G       | Math     |
| H       | Math     |
| I       | Math     |
+---------+----------+
Output: 
+---------+
| class   |
+---------+
| Math    |
+---------+
Explanation: 
- Math has 6 students, so we include it.
- English has 1 student, so we do not include it.
- Biology has 1 student, so we do not include it.
- Computer has 1 student, so we do not include it.
*/

-- Example schema

CREATE DATABASE Leetcode_596
GO
USE [Leetcode_596]
GO
CREATE TABLE Courses (student varchar(255), class varchar(255))
GO
INSERT INTO Courses (student, class) values ('A', 'Math')
INSERT INTO Courses (student, class) values ('B', 'English')
INSERT INTO Courses (student, class) values ('C', 'Math')
INSERT INTO Courses (student, class) values ('D', 'Biology')
INSERT INTO Courses (student, class) values ('E', 'Math')
INSERT INTO Courses (student, class) values ('F', 'Computer')
INSERT INTO Courses (student, class) values ('G', 'Math')
INSERT INTO Courses (student, class) values ('H', 'Math')
INSERT INTO Courses (student, class) values ('I', 'Math')
GO


-----------------------
--SOLUTION
-----------------------

WITH counted(class, count)
AS
(
SELECT class, COUNT(student) AS [count]
FROM [Courses]
GROUP BY class
)
SELECT [class]
FROM counted
WHERE [count] > 4

/* REMOVE 
 USE master
 GO
 ALTER DATABASE [Leetcode_596] 
 SET SINGLE_USER 
 WITH ROLLBACK IMMEDIATE
 DROP DATABASE [Leetcode_596]
 */