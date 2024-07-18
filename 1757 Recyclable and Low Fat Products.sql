/*

Leetcode SQL50: 1757 Recyclable and Low Fat Products (Easy)

Table: Products

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_id  | int     |
| low_fats    | enum    |
| recyclable  | enum    |
+-------------+---------+
product_id is the primary key (column with unique values) for this table.
low_fats is an ENUM (category) of type ('Y', 'N') where 'Y' means this product is low fat and 'N' means it is not.
recyclable is an ENUM (category) of types ('Y', 'N') where 'Y' means this product is recyclable and 'N' means it is not.
 

Write a solution to find the ids of products that are both low fat and recyclable.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Products table:
+-------------+----------+------------+
| product_id  | low_fats | recyclable |
+-------------+----------+------------+
| 0           | Y        | N          |
| 1           | Y        | Y          |
| 2           | N        | Y          |
| 3           | Y        | Y          |
| 4           | N        | N          |
+-------------+----------+------------+
Output: 
+-------------+
| product_id  |
+-------------+
| 1           |
| 3           |
+-------------+
Explanation: Only products 1 and 3 are both low fat and recyclable.
*/

CREATE DATABASE Leetcode_1757
GO
USE Leetcode_1757
GO
-- Original MySQL schema used ENUM and needed ot be converted to T-SQL CHECK
-- Create table If Not Exists Products (product_id int, low_fats ENUM('Y', 'N'), recyclable ENUM('Y','N'))
CREATE TABLE Products (product_id int, [low_fats] VARCHAR(1) NOT NULL CHECK([low_fats] IN ('Y', 'N')), [recyclable] VARCHAR(1) NOT NULL CHECK([recyclable] IN ('Y','N')))

INSERT INTO Products (product_id, low_fats, recyclable) values ('0', 'Y', 'N')
INSERT INTO Products (product_id, low_fats, recyclable) values ('1', 'Y', 'Y')
INSERT INTO Products (product_id, low_fats, recyclable) values ('2', 'N', 'Y')
INSERT INTO Products (product_id, low_fats, recyclable) values ('3', 'Y', 'Y')
INSERT INTO Products (product_id, low_fats, recyclable) values ('4', 'N', 'N')
GO

-----------
-- SOLUTION
-----------

SELECT product_id
FROM Products
WHERE low_fats = 'Y' AND recyclable = 'Y';

/* REMOVE 
 USE master
 GO
 ALTER DATABASE [Leetcode_1757] 
 SET SINGLE_USER 
 WITH ROLLBACK IMMEDIATE
 DROP DATABASE [Leetcode_1757]
*/