/*
Leetcode SQL50: 584 Find Customer Referee (Easy)

Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| id          | int     |
| name        | varchar |
| referee_id  | int     |
+-------------+---------+
In SQL, id is the primary key column for this table.
Each row of this table indicates the id of a customer, their name, and the id of the customer who referred them.
 

Find the names of the customer that are not referred by the customer with id = 2.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Customer table:
+----+------+------------+
| id | name | referee_id |
+----+------+------------+
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |
+----+------+------------+
Output: 
+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+
*/

-- Example schema

CREATE DATABASE Leetcode_584
GO
USE [Leetcode_584]
GO

CREATE TABLE Customer (id int, name varchar(25), referee_id int)
INSERT INTO Customer (id, name, referee_id) values ('1', 'Will', NULL)
INSERT INTO Customer (id, name, referee_id) values ('2', 'Jane', NULL)
INSERT INTO Customer (id, name, referee_id) values ('3', 'Alex', '2')
INSERT INTO Customer (id, name, referee_id) values ('4', 'Bill', NULL)
INSERT INTO Customer (id, name, referee_id) values ('5', 'Zack', '1')
INSERT INTO Customer (id, name, referee_id) values ('6', 'Mark', '2')
-----------------------
--SOLUTION
-----------------------

SELECT [name]
FROM [Customer]
WHERE COALESCE([referee_id],'') != 2;

/* REMOVE 
 USE master
 GO
 ALTER DATABASE [Leetcode_584] 
 SET SINGLE_USER 
 WITH ROLLBACK IMMEDIATE
 DROP DATABASE [Leetcode_584]
*/