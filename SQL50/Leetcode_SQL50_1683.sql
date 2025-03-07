/*
Leetcode SQL50: 1683 Invalid Tweets (Easy)

Table: Tweets

+----------------+---------+
| Column Name    | Type    |
+----------------+---------+
| tweet_id       | int     |
| content        | varchar |
+----------------+---------+
tweet_id is the primary key (column with unique values) for this table.
This table contains all the tweets in a social media app.
 

Write a solution to find the IDs of the invalid tweets. The tweet is invalid if the number of characters used in the content of the tweet is strictly greater than 15.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Tweets table:
+----------+----------------------------------+
| tweet_id | content                          |
+----------+----------------------------------+
| 1        | Vote for Biden                   |
| 2        | Let us make America great again! |
+----------+----------------------------------+
Output: 
+----------+
| tweet_id |
+----------+
| 2        |
+----------+
Explanation: 
Tweet 1 has length = 14. It is a valid tweet.
Tweet 2 has length = 32. It is an invalid tweet.
*/

-- Example schema

CREATE DATABASE Leetcode_1683
GO
USE [Leetcode_1683]
GO

CREATE TABLE Tweets(tweet_id int, content varchar(50))

INSERT INTO Tweets (tweet_id, content) values ('1', 'Vote for Biden')
INSERT INTO Tweets (tweet_id, content) values ('2', 'Let us make America great again!')
GO

-----------------------
--SOLUTION
-----------------------

SELECT tweet_id
FROM Tweets
WHERE DATALENGTH(content) > 15

/* REMOVE 
 USE master
 GO
 ALTER DATABASE [Leetcode_1683] 
 SET SINGLE_USER 
 WITH ROLLBACK IMMEDIATE
 DROP DATABASE [Leetcode_1683]
*/