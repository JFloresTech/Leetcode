/*
Leetcode SQL50: 1148 Article Views I (Easy)

Table: Views

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| article_id    | int     |
| author_id     | int     |
| viewer_id     | int     |
| view_date     | date    |
+---------------+---------+
There is no primary key (column with unique values) for this table, the table may have duplicate rows.
Each row of this table indicates that some viewer viewed an article (written by some author) on some date. 
Note that equal author_id and viewer_id indicate the same person.
 

Write a solution to find all the authors that viewed at least one of their own articles.

Return the result table sorted by id in ascending order.

The result format is in the following example.

 

Example 1:

Input: 
Views table:
+------------+-----------+-----------+------------+
| article_id | author_id | viewer_id | view_date  |
+------------+-----------+-----------+------------+
| 1          | 3         | 5         | 2019-08-01 |
| 1          | 3         | 6         | 2019-08-02 |
| 2          | 7         | 7         | 2019-08-01 |
| 2          | 7         | 6         | 2019-08-02 |
| 4          | 7         | 1         | 2019-07-22 |
| 3          | 4         | 4         | 2019-07-21 |
| 3          | 4         | 4         | 2019-07-21 |
+------------+-----------+-----------+------------+
Output: 
+------+
| id   |
+------+
| 4    |
| 7    |
+------+
*/

-- Example schema

CREATE DATABASE Leetcode_1148
GO
USE [Leetcode_1148]
GO

CREATE TABLE Views (article_id int, author_id int, viewer_id int, view_date date)

INSERT INTO Views (article_id, author_id, viewer_id, view_date) values ('1', '3', '5', '2019-08-01')
INSERT INTO Views (article_id, author_id, viewer_id, view_date) values ('1', '3', '6', '2019-08-02')
INSERT INTO Views (article_id, author_id, viewer_id, view_date) values ('2', '7', '7', '2019-08-01')
INSERT INTO Views (article_id, author_id, viewer_id, view_date) values ('2', '7', '6', '2019-08-02')
INSERT INTO Views (article_id, author_id, viewer_id, view_date) values ('4', '7', '1', '2019-07-22')
INSERT INTO Views (article_id, author_id, viewer_id, view_date) values ('3', '4', '4', '2019-07-21')
INSERT INTO Views (article_id, author_id, viewer_id, view_date) values ('3', '4', '4', '2019-07-21')
GO

-----------------------
--SOLUTION
-----------------------

SELECT DISTINCT [author_id] AS id
FROM [Views]
WHERE [viewer_id] = [author_id]

/* REMOVE 
 USE master
 GO
 ALTER DATABASE [Leetcode_1148] 
 SET SINGLE_USER 
 WITH ROLLBACK IMMEDIATE
 DROP DATABASE [Leetcode_1148]
*/