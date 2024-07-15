/*
Leetcode SQL50: 1934 Confirmation Rate (Medium)

Table: Signups

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| user_id        | int      |
| time_stamp     | datetime |
+----------------+----------+
user_id is the column of unique values for this table.
Each row contains information about the signup time for the user with ID user_id.
 

Table: Confirmations

+----------------+----------+
| Column Name    | Type     |
+----------------+----------+
| user_id        | int      |
| time_stamp     | datetime |
| action         | ENUM     |
+----------------+----------+
(user_id, time_stamp) is the primary key (combination of columns with unique values) for this table.
user_id is a foreign key (reference column) to the Signups table.
action is an ENUM (category) of the type ('confirmed', 'timeout')
Each row of this table indicates that the user with ID user_id requested a confirmation message at time_stamp and that confirmation message was either confirmed ('confirmed') or expired without confirming ('timeout').
 

The confirmation rate of a user is the number of 'confirmed' messages divided by the total number of requested confirmation messages. The confirmation rate of a user that did not request any confirmation messages is 0. Round the confirmation rate to two decimal places.

Write a solution to find the confirmation rate of each user.

Return the result table in any order.

The result format is in the following example.

Example 1:

Input: 
Signups table:
+---------+---------------------+
| user_id | time_stamp          |
+---------+---------------------+
| 3       | 2020-03-21 10:16:13 |
| 7       | 2020-01-04 13:57:59 |
| 2       | 2020-07-29 23:09:44 |
| 6       | 2020-12-09 10:39:37 |
+---------+---------------------+
Confirmations table:
+---------+---------------------+-----------+
| user_id | time_stamp          | action    |
+---------+---------------------+-----------+
| 3       | 2021-01-06 03:30:46 | timeout   |
| 3       | 2021-07-14 14:00:00 | timeout   |
| 7       | 2021-06-12 11:57:29 | confirmed |
| 7       | 2021-06-13 12:58:28 | confirmed |
| 7       | 2021-06-14 13:59:27 | confirmed |
| 2       | 2021-01-22 00:00:00 | confirmed |
| 2       | 2021-02-28 23:59:59 | timeout   |
+---------+---------------------+-----------+
Output: 
+---------+-------------------+
| user_id | confirmation_rate |
+---------+-------------------+
| 6       | 0.00              |
| 3       | 0.00              |
| 7       | 1.00              |
| 2       | 0.50              |
+---------+-------------------+
Explanation: 
User 6 did not request any confirmation messages. The confirmation rate is 0.
User 3 made 2 requests and both timed out. The confirmation rate is 0.
User 7 made 3 requests and all were confirmed. The confirmation rate is 1.
User 2 made 2 requests where one was confirmed and the other timed out. The confirmation rate is 1 / 2 = 0.5.
*/

-- Example schema
CREATE DATABASE Leetcode_1934
GO
USE [Leetcode_1934]
GO

CREATE TABLE Signups (user_id int, time_stamp datetime)
-- Original schema utilized MySQL requiring the translation of ENUM to CHECK
-- Create table Confirmations (user_id int, time_stamp datetime, action ENUM('confirmed','timeout'))
CREATE TABLE Confirmations (user_id int, time_stamp datetime, [action] VARCHAR(9)NOT NULL CHECK([action] IN('confirmed','timeout')))
TRUNCATE TABLE Signups
INSERT INTO Signups (user_id, time_stamp) values ('3', '2020-03-21 10:16:13')
INSERT INTO Signups (user_id, time_stamp) values ('7', '2020-01-04 13:57:59')
INSERT INTO Signups (user_id, time_stamp) values ('2', '2020-07-29 23:09:44')
INSERT INTO Signups (user_id, time_stamp) values ('6', '2020-12-09 10:39:37')
TRUNCATE TABLE Confirmations
INSERT INTO Confirmations (user_id, time_stamp, action) values ('3', '2021-01-06 03:30:46', 'timeout')
INSERT INTO Confirmations (user_id, time_stamp, action) values ('3', '2021-07-14 14:00:00', 'timeout')
INSERT INTO Confirmations (user_id, time_stamp, action) values ('7', '2021-06-12 11:57:29', 'confirmed')
INSERT INTO Confirmations (user_id, time_stamp, action) values ('7', '2021-06-13 12:58:28', 'confirmed')
INSERT INTO Confirmations (user_id, time_stamp, action) values ('7', '2021-06-14 13:59:27', 'confirmed')
INSERT INTO Confirmations (user_id, time_stamp, action) values ('2', '2021-01-22 00:00:00', 'confirmed')
INSERT INTO Confirmations (user_id, time_stamp, action) values ('2', '2021-02-28 23:59:59', 'timeout')

-----------------------
--SOLUTION
-----------------------

USE [Leetcode_1934]
GO

WITH 
pivoted ([user_id], [confirmed], [timeout])
AS
(
SELECT [user_id], [confirmed], [timeout]
FROM [Confirmations]
Pivot (
 COUNT([action]) FOR [action] IN ([confirmed], [timeout])
) AS pivotTable
),
Grouped ([user_id],[confirmation_rate])
AS(
SELECT [user_id], (SUM([confirmed]))/((SUM([confirmed])+SUM([timeout]*1.00))) AS [confirmation_rate]
FROM [pivoted]
GROUP BY [user_id]
)
-- COALESCE is needed to handle NULL values
-- CAST to decimal or numeric is needed for ROUND to modify the decimal places
-- ROUND is needed for the required 2 decimal places
SELECT [Signups].[user_id] AS [user_id], COALESCE(CAST(ROUND([Grouped].[confirmation_rate],2) AS numeric(4,2)), 0.00) AS [confirmation_rate]
FROM [Grouped]
RIGHT JOIN [Signups]
ON [Grouped].[user_id] = [Signups].[user_id]