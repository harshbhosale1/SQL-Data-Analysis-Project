-- SQL Data Analysis Project
-- Database dialect: PostgreSQL

CREATE TABLE sales (
    order_id INTEGER,
    customer_name VARCHAR(100),
    order_date DATE,
    category VARCHAR(100),
    subcategory VARCHAR(100),
    product VARCHAR(200),
    quantity INTEGER,
    sales NUMERIC(12,2),
    profit NUMERIC(12,2),
    region VARCHAR(100)
);

CREATE TABLE products (
    order_id INTEGER,
    category VARCHAR(100),
    subcategory VARCHAR(100),
    product_name VARCHAR(200),
    unit_price NUMERIC(12,2)
);

-- 1. Display all records from sales table
SELECT * FROM sales;

-- 2. Display specific columns
SELECT customer_name AS name, product, profit
FROM sales;

-- 3. Find customers whose names start with A
SELECT DISTINCT customer_name, category, profit
FROM sales
WHERE customer_name LIKE 'A%';

-- 4. Find Furniture sales between 500 and 2000
SELECT order_id, category, product, sales
FROM sales
WHERE category = 'Furniture'
  AND sales BETWEEN 500 AND 2000;

-- 5. Display the five highest-sales records
SELECT order_id, product, sales
FROM sales
ORDER BY sales DESC
LIMIT 5;

-- 6. Calculate total quantity sold for each product category
SELECT category, SUM(quantity) AS total_quantity
FROM sales
GROUP BY category;

-- 7. Calculate sales by category and subcategory
SELECT category, subcategory, SUM(sales) AS total_sales
FROM sales
GROUP BY category, subcategory
ORDER BY total_sales DESC;

-- 8. Calculate total sales, profit, and quantity
SELECT
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    SUM(quantity) AS total_quantity
FROM sales;

-- 9. Calculate average sales and average profit
SELECT
    AVG(sales) AS average_sales,
    AVG(profit) AS average_profit
FROM sales;

-- 10. Count total records and unique customers
SELECT
    COUNT(*) AS total_records,
    COUNT(DISTINCT customer_name) AS unique_customers
FROM sales;

-- 11. Find products with total sales greater than 2000
SELECT product, SUM(sales) AS total_sales
FROM sales
GROUP BY product
HAVING SUM(sales) > 2000
ORDER BY total_sales DESC;

-- 12. Calculate monthly sales
SELECT
    DATE_TRUNC('month', order_date) AS sales_month,
    SUM(sales) AS total_sales
FROM sales
GROUP BY DATE_TRUNC('month', order_date)
ORDER BY sales_month;

-- 13. Display all records from products table
SELECT * FROM products;

-- 14. Display sales and product details using LEFT JOIN
SELECT
    s.order_id,
    s.customer_name,
    p.product_name,
    p.category
FROM sales AS s
LEFT JOIN products AS p
    ON s.order_id = p.order_id;

-- 15. Categorize regions using CASE
SELECT
    order_id,
    customer_name,
    region,
    CASE
        WHEN region = 'North' THEN 'Northern Region'
        WHEN region = 'South' THEN 'Southern Region'
        WHEN region = 'East' THEN 'Eastern Region'
        WHEN region = 'West' THEN 'Western Region'
        ELSE 'Other Region'
    END AS region_name
FROM sales;

-- 16. Create a product performance report
SELECT
    p.product_name,
    p.category,
    p.unit_price,
    s.quantity,
    s.profit,
    CASE
        WHEN s.profit >= 3000 THEN 'High Performer'
        WHEN s.profit >= 1000 THEN 'Average Performer'
        ELSE 'Low Performer'
    END AS performance_status
FROM sales AS s
JOIN products AS p
    ON s.order_id = p.order_id
ORDER BY s.profit DESC;
