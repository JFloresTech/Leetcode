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

CREATE TABLE Signups ([user_id] int, time_stamp datetime)
CREATE TABLE Confirmations ([user_id] int, time_stamp datetime, [action] VARCHAR(9) CHECK( [action] IN ('confirmed','timeout')))

INSERT INTO Signups ([user_id], time_stamp) values ('3', '2020-03-21 10:16:13')
INSERT INTO Signups ([user_id], time_stamp) values ('7', '2020-01-04 13:57:59')
INSERT INTO Signups ([user_id], time_stamp) values ('2', '2020-07-29 23:09:44')
INSERT INTO Signups ([user_id], time_stamp) values ('6', '2020-12-09 10:39:37')

INSERT INTO Confirmations (user_id, time_stamp, action) values ('3', '2021-01-06 03:30:46', 'timeout')
INSERT INTO Confirmations (user_id, time_stamp, action) values ('3', '2021-07-14 14:00:00', 'timeout')
INSERT INTO Confirmations (user_id, time_stamp, action) values ('7', '2021-06-12 11:57:29', 'confirmed')
INSERT INTO Confirmations (user_id, time_stamp, action) values ('7', '2021-06-13 12:58:28', 'confirmed')
INSERT INTO Confirmations (user_id, time_stamp, action) values ('7', '2021-06-14 13:59:27', 'confirmed')
INSERT INTO Confirmations (user_id, time_stamp, action) values ('2', '2021-01-22 00:00:00', 'confirmed')
INSERT INTO Confirmations (user_id, time_stamp, action) values ('2', '2021-02-28 23:59:59', 'timeout')
GO

-----------------------
--SOLUTION
-----------------------
 
SELECT [Signups].[user_id] AS [user_id], 
		CAST(AVG(CASE WHEN [Confirmations].[action] = 'confirmed' THEN 1.00 ELSE 0.00 END) AS numeric(4,2)) AS [confirmation_rate]
FROM [Signups]
LEFT JOIN [Confirmations]
ON [Signups].[user_id] = [Confirmations].[user_id]
GROUP BY [Signups].[user_id]

/* REMOVE 
 USE master
 GO
 ALTER DATABASE [Leetcode_620] 
 SET SINGLE_USER 
 WITH ROLLBACK IMMEDIATE
 DROP DATABASE [Leetcode_620]
*/