USE ecommerce_dashboard;
SELECT * FROM details LIMIT 5;
DROP TABLE orders;
CREATE TABLE orders (
    Order_ID VARCHAR(50),
    Order_Date VARCHAR(50),
    Customer_Name VARCHAR(100),
    City VARCHAR(50),
	State VARCHAR(50)

);

SELECT COUNT(*) FROM orders;
SELECT * FROM orders LIMIT 5;
SELECT * FROM Details LIMIT 5;

# TOTAL REVENUE

SELECT SUM(AMOUNT) AS TOTAL_REVENUE
FROM Details;

# TOTAL PROFIT

SELECT SUM(PROFIT) AS TOTAL_PROFIT
FROM Details;

# REVENYE BY CATEGORY

SELECT CATEGORY,
SUM(AMOUNT) AS REVENUE
FROM Details
GROUP BY CATEGORY
ORDER BY REVENUE DESC

# PROFIT BY STATE

SELECT o.State,
       SUM(d.Profit) AS Profit
FROM orders o
JOIN details d
ON o.Order_ID = d.Order_ID
GROUP BY o.State
ORDER BY Profit DESC;

# TOP CUSTOMERS

SELECT o.Customer_Name,
       SUM(d.Amount) AS Revenue
FROM orders o
JOIN details d
ON o.Order_ID = d.Order_ID
GROUP BY o.Customer_Name
ORDER BY Revenue DESC
LIMIT 5;

# PAYMENT MODE ANALYSIS

SELECT PaymentMode,
       COUNT(*) AS Total_Orders
FROM details
GROUP BY PaymentMode;

# CATEGORY PROFITABILITY

SELECT Category,
       SUM(Profit) AS Total_Profit,
       ROUND(SUM(Profit)/SUM(Amount)*100,2) AS Profit_Margin
FROM details
GROUP BY Category;






