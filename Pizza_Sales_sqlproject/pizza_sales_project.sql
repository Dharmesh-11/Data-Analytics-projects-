-- 🍕 Pizza Sales Data Analytics Project 
-- Database: pizza_sales

-- Step 1: Create Database
CREATE DATABASE IF NOT EXISTS pizza_sales;
USE pizza_sales;

-- Step 2: Create Tables
CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    order_time TIME
);

CREATE TABLE IF NOT EXISTS pizza_types (
    pizza_type_id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    ingredients TEXT
);

CREATE TABLE IF NOT EXISTS pizzas (
    pizza_id VARCHAR(50) PRIMARY KEY,
    pizza_type_id VARCHAR(50),
    size VARCHAR(10),
    price DECIMAL(10,2),
    FOREIGN KEY (pizza_type_id) REFERENCES pizza_types(pizza_type_id)
);

CREATE TABLE IF NOT EXISTS order_details (
    order_details_id INT PRIMARY KEY,
    order_id INT,
    pizza_id VARCHAR(50),
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (pizza_id) REFERENCES pizzas(pizza_id)
);

-- Step 3: Import Data
-- Use MySQL Workbench or any SQL client to import your CSV files into respective tables.

-- Step 4: SQL Analytics Queries

-- 1. Total Revenue
SELECT ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id;

-- 2. Total Pizzas Sold
SELECT SUM(quantity) AS total_pizzas_sold FROM order_details;

-- 3. Total Orders
SELECT COUNT(DISTINCT order_id) AS total_orders FROM order_details;

-- 4. Average Order Value
SELECT ROUND(SUM(od.quantity * p.price) / COUNT(DISTINCT od.order_id), 2) AS avg_order_value
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id;

-- 5. Most Popular Pizzas (by Quantity)
SELECT pt.name AS pizza_name, SUM(od.quantity) AS total_sold
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_sold DESC
LIMIT 5;

-- 6. Top Revenue-Generating Pizzas
SELECT pt.name AS pizza_name, ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_revenue DESC
LIMIT 5;

-- 7. Sales by Pizza Category
SELECT pt.category, ROUND(SUM(od.quantity * p.price), 2) AS category_revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY category_revenue DESC;

-- 8. Hourly Sales Trend
SELECT HOUR(o.order_time) AS order_hour, ROUND(SUM(od.quantity * p.price), 2) AS hourly_revenue
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY HOUR(o.order_time)
ORDER BY order_hour;

-- 9. Daily Sales Trend
SELECT o.order_date, ROUND(SUM(od.quantity * p.price), 2) AS daily_revenue
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY o.order_date
ORDER BY o.order_date;

-- 10. Monthly Sales Trend
SELECT MONTH(o.order_date) AS month_number, ROUND(SUM(od.quantity * p.price), 2) AS monthly_revenue
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY MONTH(o.order_date)
ORDER BY month_number;

-- 11. Best-Selling Pizza Size
SELECT p.size, SUM(od.quantity) AS total_sold
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY p.size
ORDER BY total_sold DESC;
