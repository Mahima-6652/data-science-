CREATE DATABASE retail_sales_project;

USE retail_sales_project;

-- View sales data
SELECT *
FROM supermarket_sales
LIMIT 10;

-- Count sales records
SELECT COUNT(*) AS total_records
FROM supermarket_sales;

-- Calculate total revenue
SELECT
    ROUND(SUM(Sales), 2) AS total_revenue
FROM supermarket_sales;

-- Find the best-selling product categories
SELECT
    `Product line`,
    SUM(Quantity) AS total_quantity
FROM supermarket_sales
GROUP BY `Product line`
ORDER BY total_quantity DESC;

-- Find the category with the highest revenue

SELECT
    `Product line`,
    ROUND(SUM(Sales), 2) AS total_revenue
FROM supermarket_sales
GROUP BY `Product line`
ORDER BY total_revenue DESC;

-- ANALYZE SALES BY CITY
SELECT
    City,
    ROUND(SUM(Sales), 2) AS total_revenue
FROM supermarket_sales
GROUP BY City
ORDER BY total_revenue DESC;

-- ANALYZE SALES BY BRANCH
SELECT
    Branch,
    ROUND(SUM(Sales), 2) AS total_revenue
FROM supermarket_sales
GROUP BY Branch
ORDER BY total_revenue DESC;


-- ANALYZE PAYMENT METHODS
SELECT
    Payment,
    COUNT(*) AS transaction_count,
    ROUND(SUM(Sales), 2) AS total_revenue
FROM supermarket_sales
GROUP BY Payment
ORDER BY total_revenue DESC;


-- ANALYZE CUSTOMER TYPES
SELECT
    `Customer type`,
    COUNT(*) AS transaction_count,
    ROUND(SUM(Sales), 2) AS total_revenue
FROM supermarket_sales
GROUP BY `Customer type`
ORDER BY total_revenue DESC;


-- FIND AVERAGE TRANSACTION VALUE
SELECT
    ROUND(AVG(Sales), 2) AS average_transaction_value
FROM supermarket_sales;


-- ANALYZE MONTHLY SALES
SELECT
    DATE_FORMAT(STR_TO_DATE(Date, '%m/%d/%Y'), '%Y-%m') AS sales_month,
    ROUND(SUM(Sales), 2) AS monthly_revenue
FROM supermarket_sales
GROUP BY sales_month
ORDER BY sales_month;


-- FIND CATEGORIES WITH REVENUE ABOVE 150000
SELECT
    `Product line`,
    ROUND(SUM(Sales), 2) AS total_revenue
FROM supermarket_sales
GROUP BY `Product line`
HAVING SUM(Sales) > 150000
ORDER BY total_revenue DESC;


-- CLASSIFY SALES TRANSACTIONS
SELECT
    `Invoice ID`,
    Sales,
    CASE
        WHEN Sales >= 500 THEN 'High'
        WHEN Sales >= 200 THEN 'Medium'
        ELSE 'Low'
    END AS sales_category
FROM supermarket_sales
LIMIT 20;