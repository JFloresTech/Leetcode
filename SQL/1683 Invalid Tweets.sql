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

CREATE TABLE Views (article_id int, author_id int, viewer_id int, view_date date)

INSERT INTO Views (article_id, author_id, viewer_id, view_date) values ('1', '3', '5', '2019-08-01')
INSERT INTO Views (article_id, author_id, viewer_id, view_date) values ('1', '3', '6', '2019-08-02')
INSERT INTO Views (article_id, author_id, viewer_id, view_date) values ('2', '7', '7', '2019-08-01')
INSERT INTO Views (article_id, author_id, viewer_id, view_date) values ('2', '7', '6', '2019-08-02')
INSERT INTO Views (article_id, author_id, viewer_id, view_date) values ('4', '7', '1', '2019-07-22')
INSERT INTO Views (article_id, author_id, viewer_id, view_date) values ('3', '4', '4', '2019-07-21')
INSERT INTO Views (article_id, author_id, viewer_id, view_date) values ('3', '4', '4', '2019-07-21')

-----------------------
--SOLUTION
-----------------------

SELECT DISTINCT [author_id] AS id
FROM [Views]
WHERE [viewer_id] = [author_id]

/* REMOVE 
 USE master
 GO
 ALTER DATABASE [Leetcode_1683] 
 SET SINGLE_USER 
 WITH ROLLBACK IMMEDIATE
 DROP DATABASE [Leetcode_1683]
*/