-- Online Retail Inventory Management Project 

-- 1. Create Database
CREATE DATABASE IF NOT EXISTS OnlineRetailDB;
USE OnlineRetailDB;

-- 2. Create Table
DROP TABLE IF EXISTS Retail_Transactions;

CREATE TABLE Retail_Transactions (
    InvoiceNo VARCHAR(50),
    StockCodes VARCHAR(50),
    Descriptions VARCHAR(255),
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID nvarchar(50),
    Country VARCHAR(50),
    TotalAmount DECIMAL(18,2),
    Year INT,
    Month INT,
    Day INT
);

-- 3 Analytical Queries

-- (1) Total stock availability by product
SELECT StockCodes, Descriptions, SUM(Quantity) AS TotalStock
FROM Retail_Transactions
GROUP BY StockCodes, Descriptions
ORDER BY TotalStock DESC;

-- (2) Low-selling products (potential discount candidates)
SELECT StockCodes, Descriptions, SUM(Quantity) AS TotalSold
FROM Retail_Transactions
GROUP BY StockCodes, Descriptions
HAVING SUM(Quantity) < 50
ORDER BY TotalSold ASC;

-- (3) Revenue by country
SELECT Country, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM Retail_Transactions
GROUP BY Country
ORDER BY TotalRevenue DESC;

-- (4) Monthly revenue trend
SELECT 
    YEAR(InvoiceDate) AS Year,
    MONTH(InvoiceDate) AS Month,
    SUM(IFNULL(Quantity,0) * IFNULL(UnitPrice,0)) AS MonthlyRevenue
FROM retail_transactions
GROUP BY YEAR(InvoiceDate), MONTH(InvoiceDate)
ORDER BY Year, Month;

-- (5) Top 10 customers by revenue
SELECT CustomerID, SUM(Quantity * UnitPrice) AS CustomerRevenue
FROM Retail_Transactions
GROUP BY CustomerID
ORDER BY CustomerRevenue DESC
LIMIT 10;

-- (6) Top 10 products by total revenue
SELECT StockCodes, Descriptions, SUM(Quantity * UnitPrice) AS TotalRevenue
FROM Retail_Transactions
GROUP BY StockCodes, Descriptions
ORDER BY TotalRevenue DESC
LIMIT 10;

-- (7) Average Order Value (AOV) per customer
SELECT CustomerID,
       COUNT(DISTINCT InvoiceNo) AS TotalOrders,
       SUM(Quantity * UnitPrice) AS TotalSpent,
       (SUM(Quantity * UnitPrice) / COUNT(DISTINCT InvoiceNo)) AS AvgOrderValue
FROM Retail_Transactions
GROUP BY CustomerID
ORDER BY AvgOrderValue DESC;

-- (8) Hourly sales trend (peak shopping hours)
SELECT HOUR(InvoiceDate) AS HourOfDay,
       SUM(Quantity * UnitPrice) AS HourlyRevenue
FROM Retail_Transactions
GROUP BY HOUR(InvoiceDate)
ORDER BY HourOfDay;
