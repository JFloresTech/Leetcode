/*
Leetcode SQL50: 197 Rising Temperature (Easy)

Table: Weather

+---------------+---------+
| Column Name   | Type    |
+---------------+---------+
| id            | int     |
| recordDate    | date    |
| temperature   | int     |
+---------------+---------+
id is the column with unique values for this table.
There are no different rows with the same recordDate.
This table contains information about the temperature on a certain day.
 

Write a solution to find all dates' Id with higher temperatures compared to its previous dates (yesterday).

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Weather table:
+----+------------+-------------+
| id | recordDate | temperature |
+----+------------+-------------+
| 1  | 2015-01-01 | 10          |
| 2  | 2015-01-02 | 25          |
| 3  | 2015-01-03 | 20          |
| 4  | 2015-01-04 | 30          |
+----+------------+-------------+
Output: 
+----+
| id |
+----+
| 2  |
| 4  |
+----+
Explanation: 
In 2015-01-02, the temperature was higher than the previous day (10 -> 25).
In 2015-01-04, the temperature was higher than the previous day (20 -> 30).
*/

-- Example schema

CREATE DATABASE Leetcode_197
GO
USE [Leetcode_197]
GO

CREATE TABLE Weather (id int, recordDate date, temperature int)

INSERT INTO Weather (id, recordDate, temperature) values ('1', '2015-01-01', '10')
INSERT INTO Weather (id, recordDate, temperature) values ('2', '2015-01-02', '25')
INSERT INTO Weather (id, recordDate, temperature) values ('3', '2015-01-03', '20')
INSERT INTO Weather (id, recordDate, temperature) values ('4', '2015-01-04', '30')

-----------------------
--SOLUTION
-----------------------

WITH comp (id, presentTemp, presentDate, previousTemp, previousDate) 
AS(
SELECT id, 
        temperature AS presentTemp, 
        recordDate AS presentDate,
        lag(temperature) OVER (ORDER BY recordDate) AS previousTemp,  
        lag(recordDate) OVER (ORDER BY recordDate) AS previousDate
FROM Weather
)
SELECT id
FROM comp
WHERE ABS(DATEDIFF(day, presentDate, previousDate)) = 1 AND presentTemp > previousTemp


/* REMOVE 
 USE master
 GO
 ALTER DATABASE [Leetcode_197] 
 SET SINGLE_USER 
 WITH ROLLBACK IMMEDIATE
 DROP DATABASE [Leetcode_197]
*/