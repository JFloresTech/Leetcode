/*
Leetcode SQL50: 550 Game Play Analysis IV (Medium)

Table: Activity

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| player_id    | int     |
| device_id    | int     |
| event_date   | date    |
| games_played | int     |
+--------------+---------+
(player_id, event_date) is the primary key (combination of columns with unique values) of this table.
This table shows the activity of players of some games.
Each row is a record of a player who logged in and played a number of games (possibly 0) before logging out on someday using some device.
 

Write a solution to report the fraction of players that logged in again on the day after the day they first logged in, rounded to 2 decimal places. In other words, you need to count the number of players that logged in for at least two consecutive days starting from their first login date, then divide that number by the total number of players.

The result format is in the following example.

 

Example 1:

Input: 
Activity table:
+-----------+-----------+------------+--------------+
| player_id | device_id | event_date | games_played |
+-----------+-----------+------------+--------------+
| 1         | 2         | 2016-03-01 | 5            |
| 1         | 2         | 2016-03-02 | 6            |
| 2         | 3         | 2017-06-25 | 1            |
| 3         | 1         | 2016-03-02 | 0            |
| 3         | 4         | 2018-07-03 | 5            |
+-----------+-----------+------------+--------------+
Output: 
+-----------+
| fraction  |
+-----------+
| 0.33      |
+-----------+
Explanation: 
Only the player with id 1 logged back in after the first day he had logged in so the answer is 1/3 = 0.33
*/

-- Example schema

CREATE DATABASE Leetcode_550
GO
USE [Leetcode_550]
GO
CREATE TABLE Activity (player_id int, device_id int, event_date date, games_played int)
GO
INSERT INTO Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-01', '5')
INSERT INTO Activity (player_id, device_id, event_date, games_played) values ('1', '2', '2016-03-02', '6')
INSERT INTO Activity (player_id, device_id, event_date, games_played) values ('2', '3', '2017-06-25', '1')
INSERT INTO Activity (player_id, device_id, event_date, games_played) values ('3', '1', '2016-03-02', '0')
INSERT INTO Activity (player_id, device_id, event_date, games_played) values ('3', '4', '2018-07-03', '5')
GO

-----------------------
--SOLUTION
-----------------------

WITH ranked_login(player_id, event_date, ranked_date)
AS
(
SELECT player_id, event_date, RANK() OVER(PARTITION BY player_id ORDER BY event_date ASC) AS ranked_date
FROM [Activity]
),
first(player_id, first_login)
AS
(
SELECT player_id, event_date AS first_login
FROM ranked_login
WHERE ranked_date = 1
),
second(player_id, second_login)
AS
(
SELECT player_id, event_date AS second_login
FROM ranked_login
WHERE ranked_date = 2
)

SELECT ROUND((COUNT(first.player_id)*1.00)/(SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM first JOIN second
ON first.player_id = second.player_id
WHERE second_login = DATEADD(DAY, 1, first_login)


/* REMOVE 
 USE master
 GO
 ALTER DATABASE [Leetcode_550] 
 SET SINGLE_USER 
 WITH ROLLBACK IMMEDIATE
 DROP DATABASE [Leetcode_550]
 */