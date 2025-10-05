# 🍕 Pizza Sales Data Analytics Project (SQL)

## 📘 Project Overview
This project analyzes **Pizza Sales Data** using **SQL** to uncover key business insights such as:
- Total revenue generated 💰  
- Most popular pizzas 🍕  
- Sales trends over time 📆  
- Customer ordering behavior ⏰  
- Top-performing categories and sizes  

The goal is to help the pizza store understand sales performance and make data-driven decisions.

---

## 🗂️ Dataset Description

The dataset consists of four CSV files:

| File Name | Description |
|------------|--------------|
| `orders.csv` | Contains order IDs, dates, and times of orders |
| `order_details.csv` | Contains pizza quantities and links orders to pizzas |
| `pizzas.csv` | Contains pizza sizes, prices, and pizza type IDs |
| `pizza_types.csv` | Contains pizza names, categories, and ingredients |

---

## 🏗️ Database Schema (ER Diagram)

**Entities:**
- `orders(order_id, order_date, order_time)`
- `order_details(order_details_id, order_id, pizza_id, quantity)`
- `pizzas(pizza_id, pizza_type_id, size, price)`
- `pizza_types(pizza_type_id, name, category, ingredients)`

**Relationships:**
- Each order has multiple order details.
- Each order detail corresponds to one pizza.
- Each pizza belongs to one pizza type.

---

## ⚙️ SQL Setup

### 1️⃣ Create Database
```sql
CREATE DATABASE pizza_sales;
USE pizza_sales;
```

2️⃣ Create Tables
The table creation scripts are provided in the file:
pgsql
Copy code
pizza_sales_project.sql


3️⃣ Import Data
Import all CSV files into the corresponding tables using:

MySQL Workbench → Table Data Import Wizard

or use the LOAD DATA INFILE command.

📊 Data Analysis Queries
🔹 Total Revenue
sql```
SELECT ROUND(SUM(od.quantity * p.price), 2) AS total_revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id;
```
🔹 Most Popular Pizzas
sql```
SELECT pt.name, SUM(od.quantity) AS total_sold
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.name
ORDER BY total_sold DESC
LIMIT 5;
```

🔹 Sales by Category
sql```
SELECT pt.category, ROUND(SUM(od.quantity * p.price), 2) AS category_revenue
FROM order_details od
JOIN pizzas p ON od.pizza_id = p.pizza_id
JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
GROUP BY pt.category
ORDER BY category_revenue DESC;
```
🔹 Hourly Sales Trend
sql```
SELECT HOUR(o.order_time) AS hour, SUM(od.quantity * p.price) AS revenue
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY HOUR(o.order_time)
ORDER BY hour;
```
🔹 Daily and Monthly Sales
sql```
-- Daily
SELECT o.order_date, SUM(od.quantity * p.price) AS daily_revenue
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY o.order_date
ORDER BY o.order_date;

-- Monthly
SELECT MONTH(o.order_date) AS month, SUM(od.quantity * p.price) AS monthly_revenue
FROM order_details od
JOIN orders o ON od.order_id = o.order_id
JOIN pizzas p ON od.pizza_id = p.pizza_id
GROUP BY MONTH(o.order_date)
ORDER BY month;

```
💡 Key Insights
Insight	Description
Top-Selling Pizza	Identifies which pizza generated the highest revenue.
Peak Order Time	Determines which hour of the day has the most sales.
Top Category	Shows which pizza category (Classic, Veggie, etc.) performs best.
Most Preferred Size	Finds out which pizza size sells the most.
Sales Trends	Reveals daily and monthly revenue patterns.

📈 Future Improvements
Create a Power BI / Tableau dashboard for data visualization.

Add Python or Streamlit integration for interactive analytics.

Use stored procedures to automate recurring reports.

Extend dataset to include customer information for segmentation analysis.

🧑‍💻 Tools Used
MySQL / SQL Server / SQLite

Excel / Power BI / Tableau (for visualization)

GitHub (for version control)

📦 Project Files
File	Description
pizza_sales_project.sql	SQL script with table creation & all analytics queries
orders.csv	Orders data
order_details.csv	Order details
pizzas.csv	Pizza size & price info
pizza_types.csv	Pizza categories & ingredients
README.md	Project documentation

🏁 Conclusion
This SQL project demonstrates how to perform end-to-end data analysis using raw sales data.
It provides a strong foundation for building data dashboards, performing ETL automation, and applying business intelligence techniques.

✨ Author
Dharmesh Panpatil
📅 October 2025