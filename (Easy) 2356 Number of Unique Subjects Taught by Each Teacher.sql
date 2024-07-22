/*
Leetcode SQL50: 2356 Number of Unique Subjects Taught by Each Teacher (Easy)

Table: Teacher

+-------------+------+
| Column Name | Type |
+-------------+------+
| teacher_id  | int  |
| subject_id  | int  |
| dept_id     | int  |
+-------------+------+
(subject_id, dept_id) is the primary key (combinations of columns with unique values) of this table.
Each row in this table indicates that the teacher with teacher_id teaches the subject subject_id in the department dept_id.
 

Write a solution to calculate the number of unique subjects each teacher teaches in the university.

Return the result table in any order.

The result format is shown in the following example.

 

Example 1:

Input: 
Teacher table:
+------------+------------+---------+
| teacher_id | subject_id | dept_id |
+------------+------------+---------+
| 1          | 2          | 3       |
| 1          | 2          | 4       |
| 1          | 3          | 3       |
| 2          | 1          | 1       |
| 2          | 2          | 1       |
| 2          | 3          | 1       |
| 2          | 4          | 1       |
+------------+------------+---------+
Output:  
+------------+-----+
| teacher_id | cnt |
+------------+-----+
| 1          | 2   |
| 2          | 4   |
+------------+-----+
Explanation: 
Teacher 1:
  - They teach subject 2 in departments 3 and 4.
  - They teach subject 3 in department 3.
Teacher 2:
  - They teach subject 1 in department 1.
  - They teach subject 2 in department 1.
  - They teach subject 3 in department 1.
  - They teach subject 4 in department 1.
*/

-- Example schema

CREATE DATABASE Leetcode_2356
GO
USE [Leetcode_2356]
GO

CREATE TABLE Teacher (teacher_id int, subject_id int, dept_id int)
GO
INSERT INTO Teacher (teacher_id, subject_id, dept_id) values ('1', '2', '3')
INSERT INTO Teacher (teacher_id, subject_id, dept_id) values ('1', '2', '4')
INSERT INTO Teacher (teacher_id, subject_id, dept_id) values ('1', '3', '3')
INSERT INTO Teacher (teacher_id, subject_id, dept_id) values ('2', '1', '1')
INSERT INTO Teacher (teacher_id, subject_id, dept_id) values ('2', '2', '1')
INSERT INTO Teacher (teacher_id, subject_id, dept_id) values ('2', '3', '1')
INSERT INTO Teacher (teacher_id, subject_id, dept_id) values ('2', '4', '1')
GO
-----------------------
--SOLUTION
-----------------------

SELECT teacher_id, COUNT(DISTINCT  subject_id) AS cnt
FROM [Teacher]
GROUP BY teacher_id

/* REMOVE 
 USE master
 GO
 ALTER DATABASE [Leetcode_2356] 
 SET SINGLE_USER 
 WITH ROLLBACK IMMEDIATE
 DROP DATABASE [Leetcode_2356]
 */