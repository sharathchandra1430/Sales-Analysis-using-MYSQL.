CREATE DATABASE company;
use company;
select * from sales;

-- Q1:Find all orders shipped via ‘economy’ mode with a total amount greater than ₹25,000.--


SELECT * FROM SALES
WHERE SHIP_MODE = 'Economy' AND Total_Amount > 25000;

-- Q2: Retrieve all sales data for ‘Technology’ category in ‘Ireland’ made after 2020-01-01.--

SELECT * FROM SALES
WHERE Category = 'Technology'and Country = 'Ireland' AND Order_Date > '2020-01-01';

-- Q3: List the top 10 most profitable sales transactions in descending order.--

SELECT * FROM SALES
ORDER BY Unit_Profit desc
limit 10;                             # top 10 transactions

SELECT * FROM SALES
ORDER BY Unit_Profit desc
limit 10, 20;                           # skip 10 records, showing next 20 records

-- 	Q4: Find all customers whose name starts with ‘J’ and ends with ‘n’.--

SELECT ORDER_ID, CUSTOMER_NAME FROM sales
WHERE CUSTOMER_NAME LIKE 'J%N' ;

-- Q5: Retrieve all product names that contain ‘Acco’ anywhere in the name.--

SELECT ORDER_ID, PRODUCT_NAME FROM SALES
WHERE PRODUCT_NAME LIKE '%ACCO%';

-- Q6: Get the top 5 cities with the highest total sales amount.--

SELECT CITY, SUM(TOTAL_AMOUNT) AS TOTAL_SALES FROM SALES
GROUP BY CITY
ORDER BY TOTAL_SALES DESC
LIMIT 5;

-- Q7 : Display the second set of 10 records for Customer_Name and Total_Amount in decreasing order. --

SELECT Customer_Name, Total_Amount FROM SALES
ORDER BY Total_Amount DESC
LIMIT 10,10;

-- Q8: Find the total revenue, average unit cost,and total numbers of orders. --

SELECT SUM(TOTAL_AMOUNT) AS `TOTAL REVENUE`,
		AVG(UNIT_COST) AS `AVERAGE UNIT COST`,
        count(ORDER_ID) AS `TOTAL NUMBER OF ORDERS`
FROM SALES;

-- Q9: Count unique number of regions.--

SELECT COUNT(DISTINCT REGION) AS UNIQUE_REGIONS
FROM SALES;

-- Q10:Find the number of orders placed by each customer.--

SELECT Customer_Name, COUNT(Order_ID) AS Order_Count
FROM Sales
GROUP BY Customer_Name
ORDER BY Order_Count DESC;
 
-- Q11 : Rank 5 products based on total sales using RAHNK().--

SELECT Product_Name, SUM(Total_Amount) AS Total_Sales,
		RANK() OVER (ORDER BY SUM(Total_Amount) DESC) AS Sales_Rank
FROM Sales
GROUP BY Product_Name
LIMIT 5;


