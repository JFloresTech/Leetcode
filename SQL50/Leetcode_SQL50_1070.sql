/*
Leetcode SQL50: 1070 Product Sales Analysis III (Medium)

Table: Sales

+-------------+-------+
| Column Name | Type  |
+-------------+-------+
| sale_id     | int   |
| product_id  | int   |
| year        | int   |
| quantity    | int   |
| price       | int   |
+-------------+-------+
(sale_id, year) is the primary key (combination of columns with unique values) of this table.
product_id is a foreign key (reference column) to Product table.
Each row of this table shows a sale on the product product_id in a certain year.
Note that the price is per unit.
 

Table: Product

+--------------+---------+
| Column Name  | Type    |
+--------------+---------+
| product_id   | int     |
| product_name | varchar |
+--------------+---------+
product_id is the primary key (column with unique values) of this table.
Each row of this table indicates the product name of each product.
 

Write a solution to select the product id, year, quantity, and price for the first year of every product sold.

Return the resulting table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Sales table:
+---------+------------+------+----------+-------+
| sale_id | product_id | year | quantity | price |
+---------+------------+------+----------+-------+ 
| 1       | 100        | 2008 | 10       | 5000  |
| 2       | 100        | 2009 | 12       | 5000  |
| 7       | 200        | 2011 | 15       | 9000  |
+---------+------------+------+----------+-------+
Product table:
+------------+--------------+
| product_id | product_name |
+------------+--------------+
| 100        | Nokia        |
| 200        | Apple        |
| 300        | Samsung      |
+------------+--------------+
Output: 
+------------+------------+----------+-------+
| product_id | first_year | quantity | price |
+------------+------------+----------+-------+ 
| 100        | 2008       | 10       | 5000  |
| 200        | 2011       | 15       | 9000  |
+------------+------------+----------+-------+
*/

-- Example schema

CREATE DATABASE Leetcode_1070
GO
USE [Leetcode_1070]
GO

CREATE TABLE Sales (sale_id int, product_id int, year int, quantity int, price int)
CREATE TABLE Product (product_id int, product_name varchar(10))
GO
INSERT INTO Sales (sale_id, product_id, year, quantity, price) values ('1', '100', '2008', '10', '5000')
INSERT INTO Sales (sale_id, product_id, year, quantity, price) values ('2', '100', '2009', '12', '5000')
INSERT INTO Sales (sale_id, product_id, year, quantity, price) values ('7', '200', '2011', '15', '9000')
GO
INSERT INTO Product (product_id, product_name) values ('100', 'Nokia')
INSERT INTO Product (product_id, product_name) values ('200', 'Apple')
INSERT INTO Product (product_id, product_name) values ('300', 'Samsung')
GO
-----------------------
--SOLUTION
-----------------------

WITH
[first](product_id, first_year)
AS
(
SELECT product_id, MIN([year]) AS [first_year]
FROM [Sales]
GROUP BY product_id
)

SELECT [Sales].[product_id] AS [product_id], 
	   [first].[first_year] AS [first_year],
	   [Sales].[quantity] AS [quantity],
	   [Sales].[price] AS [price]
FROM [Sales] 
JOIN [first]
ON [Sales].[product_id] = [first].[product_id] AND [Sales].[year] = [first].[first_year]



/* REMOVE 
 USE master
 GO
 ALTER DATABASE [Leetcode_1070] 
 SET SINGLE_USER 
 WITH ROLLBACK IMMEDIATE
 DROP DATABASE [Leetcode_1070]
 */