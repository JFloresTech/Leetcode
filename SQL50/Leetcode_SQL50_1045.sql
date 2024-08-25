/*
Leetcode SQL50: 1045 Customers Who Bought All Products (Medium)

Table: Customer

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| customer_id | int     |
| product_key | int     |
+-------------+---------+
This table may contain duplicates rows. 
customer_id is not NULL.
product_key is a foreign key (reference column) to Product table.
 

Table: Product

+-------------+---------+
| Column Name | Type    |
+-------------+---------+
| product_key | int     |
+-------------+---------+
product_key is the primary key (column with unique values) for this table.
 

Write a solution to report the customer ids from the Customer table that bought all the products in the Product table.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Customer table:
+-------------+-------------+
| customer_id | product_key |
+-------------+-------------+
| 1           | 5           |
| 2           | 6           |
| 3           | 5           |
| 3           | 6           |
| 1           | 6           |
+-------------+-------------+
Product table:
+-------------+
| product_key |
+-------------+
| 5           |
| 6           |
+-------------+
Output: 
+-------------+
| customer_id |
+-------------+
| 1           |
| 3           |
+-------------+
Explanation: 
The customers who bought all the products (5 and 6) are customers with IDs 1 and 3.
*/

-- Example schema

CREATE DATABASE Leetcode_1045
GO
USE [Leetcode_1045]
GO
CREATE TABLE Customer (customer_id int, product_key int)
CREATE TABLE Product (product_key int)
GO
INSERT INTO Customer (customer_id, product_key) values ('1', '5')
INSERT INTO Customer (customer_id, product_key) values ('2', '6')
INSERT INTO Customer (customer_id, product_key) values ('3', '5')
INSERT INTO Customer (customer_id, product_key) values ('3', '6')
INSERT INTO Customer (customer_id, product_key) values ('1', '6')
GO
INSERT INTO Product (product_key) values ('5')
INSERT INTO Product (product_key) values ('6')
GO


-----------------------
--SOLUTION
-----------------------

SELECT customer_id
FROM [Customer]
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key) = (SELECT COUNT(product_key) FROM Product)

/* REMOVE 
 USE master
 GO
 ALTER DATABASE [Leetcode_1045] 
 SET SINGLE_USER 
 WITH ROLLBACK IMMEDIATE
 DROP DATABASE [Leetcode_1045]
 */