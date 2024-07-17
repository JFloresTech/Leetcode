/*
Leetcode SQL50: 620 Not Boring Movies (Easy)

Table: Cinema

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| id             | int      |
| movie          | varchar  |
| description    | varchar  |
| rating         | float    |
+----------------+----------+
id is the primary key (column with unique values) for this table.
Each row contains information about the name of a movie, its genre, and its rating.
rating is a 2 decimal places float in the range [0, 10]
 

Write a solution to report the movies with an odd-numbered ID and a description that is not "boring".

Return the result table ordered by rating in descending order.

The result format is in the following example.

 

Example 1:

Input: 
Cinema table:
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 1  | War        | great 3D    | 8.9    |
| 2  | Science    | fiction     | 8.5    |
| 3  | irish      | boring      | 6.2    |
| 4  | Ice song   | Fantacy     | 8.6    |
| 5  | House card | Interesting | 9.1    |
+----+------------+-------------+--------+
Output: 
+----+------------+-------------+--------+
| id | movie      | description | rating |
+----+------------+-------------+--------+
| 5  | House card | Interesting | 9.1    |
| 1  | War        | great 3D    | 8.9    |
+----+------------+-------------+--------+
Explanation: 
We have three movies with odd-numbered IDs: 1, 3, and 5. The movie with ID = 3 is boring so we do not include it in the answer.
*/

-- Example schema

CREATE DATABASE Leetcode_620
GO
USE [Leetcode_620]
GO

CREATE TABLE cinema (id int, movie varchar(255), description varchar(255), rating numeric(2, 1))

INSERT INTO cinema (id, movie, description, rating) values ('1', 'War', 'great 3D', '8.9')
INSERT INTO cinema (id, movie, description, rating) values ('2', 'Science', 'fiction', '8.5')
INSERT INTO cinema (id, movie, description, rating) values ('3', 'irish', 'boring', '6.2')
INSERT INTO cinema (id, movie, description, rating) values ('4', 'Ice song', 'Fantacy', '8.6')
INSERT INTO cinema (id, movie, description, rating) values ('5', 'House card', 'Interesting', '9.1')
GO

-----------------------
--SOLUTION
-----------------------
 
SELECT id, movie, description, rating
FROM [cinema]
WHERE (id%2 = 1) AND (description != 'boring')
ORDER BY rating DESC

/* REMOVE 
 USE master
 GO
 ALTER DATABASE [Leetcode_620] 
 SET SINGLE_USER 
 WITH ROLLBACK IMMEDIATE
 DROP DATABASE [Leetcode_620]
*/