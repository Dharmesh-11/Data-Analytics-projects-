# 🛒 Online Retail Inventory Management Project  

## 📌 Project Overview  
This project is designed to manage and analyze **retail transactions** data. It demonstrates how SQL can be used to create a database, store retail information, and run **analytical queries** for business insights such as stock availability, revenue, customer trends, and product performance.  
The project simulates a real-world **inventory and sales analytics system** that can help retail businesses make data-driven decisions.  

---

## 🏗️ Project Structure  

1. **Database Creation**  
   - Creates a database named `OnlineRetailDB`.  
   - Creates a table `Retail_Transactions` to store sales data.  

2. **Table Columns**  
   - `InvoiceNo` → Unique invoice number for transactions.  
   - `StockCodes` → Product code.  
   - `Descriptions` → Product description.  
   - `Quantity` → Number of units sold.  
   - `InvoiceDate` → Date and time of transaction.  
   - `UnitPrice` → Price per unit.  
   - `CustomerID` → Unique identifier for each customer.  
   - `Country` → Customer’s country.  
   - `TotalAmount` → Pre-computed total (Quantity × UnitPrice).  
   - `Year, Month, Day` → Extracted fields for time-based analysis.  

---

## 📊 Analytical SQL Queries  

### 1️⃣ Total Stock Availability by Product  
```sql
SELECT StockCodes, Descriptions, SUM(Quantity) AS TotalStock
FROM Retail_Transactions
GROUP BY StockCodes, Descriptions
ORDER BY TotalStock DESC;
```

2️⃣ Low-Selling Products (Discount Candidates)
```sql
SELECT StockCodes, Descriptions, SUM(Quantity) AS TotalSold
FROM Retail_Transactions
GROUP BY StockCodes, Descriptions
HAVING SUM(Quantity) < 50
ORDER BY TotalSold ASC;
```

3️⃣ Revenue by Country
```sql
SELECT Country, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM Retail_Transactions
GROUP BY Country
ORDER BY TotalRevenue DESC;
```

4️⃣ Monthly Revenue Trend
```sql
SELECT YEAR(InvoiceDate) AS Year,
       MONTH(InvoiceDate) AS Month,
       SUM(IFNULL(Quantity,0) * IFNULL(UnitPrice,0)) AS MonthlyRevenue
FROM Retail_Transactions
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY Year, Month;
```

5️⃣ Top 10 Customers by Revenue
```sql
SELECT CustomerID, SUM(Quantity * UnitPrice) AS CustomerRevenue
FROM Retail_Transactions
GROUP BY CustomerID
ORDER BY CustomerRevenue DESC
LIMIT 10;
```

6️⃣ Top 10 Products by Revenue
```sql
SELECT StockCodes, Descriptions, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM Retail_Transactions
GROUP BY StockCodes, Descriptions
ORDER BY TotalRevenue DESC
LIMIT 10;
```

7️⃣ Average Order Value (AOV) per Customer
```sql
SELECT CustomerID,
       COUNT(DISTINCT InvoiceNo) AS TotalOrders,
       SUM(Quantity * UnitPrice) AS TotalSpent,
       (SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo)) AS AvgOrderValue
FROM Retail_Transactions
GROUP BY CustomerID
ORDER BY AvgOrderValue DESC;
```

8️⃣ Hourly Sales Trend (Peak Shopping Hours)
```sql
SELECT HOUR(InvoiceDate) AS HourOfDay,
       SUM(Quantity * UnitPrice) AS HourlyRevenue
FROM Retail_Transactions
GROUP BY HOUR(InvoiceDate)
ORDER BY HourOfDay;
```

🚀 How to Run
Clone the repository:
```
git clone https://github.com/your-username/Online-Retail-Inventory-Management.git
cd Online-Retail-Inventory-Management
```
Open MySQL Workbench or your SQL editor.

Run the SQL script:

Create the database

Create the table

Execute analytical queries

Analyze the results to generate insights.

📈 Business Insights You Can Get
Which products are best-sellers and which are low performers.

Which countries generate the most revenue.

The monthly sales trend (growth/decline).

Who are the top customers contributing to revenue.

What are the peak shopping hours.

🛠️ Tech Stack
Database: MySQL

Language: SQL

📜 License
This project is open-source and free to use for educational and learning purposes.

📝 Author

👤 Dharmesh Panpatil

📧 dharmeshpanpatil01@gmial.com
