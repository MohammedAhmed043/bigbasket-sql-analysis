# 🛒 BigBasket SQL Case Study

A hands-on SQL analytics project exploring BigBasket-style e-commerce data to uncover sales trends, customer behavior, product performance, and business insights.

---

## 🎯 Key Objectives

- Analyze customer behavior, orders, and purchasing trends
- Identify top-selling products, brands, and categories
- Track revenue performance and order statuses
- Understand city-wise sales patterns
- Practice SQL queries covering filtering, joins, aggregations, grouping, and subqueries

---

## 🛠️ Tech Stack

![Database: MySQL](https://img.shields.io/badge/Database-MySQL-00758F?style=for-the-badge&logo=mysql&logoColor=white)  
![Language: SQL](https://img.shields.io/badge/Language-SQL-4B8BBE?style=for-the-badge)  
![Tool: MySQL Workbench](https://img.shields.io/badge/Tool-MySQL%20Workbench-F9A825?style=for-the-badge&logo=mysql&logoColor=white)

---

## 🔍 SQL Concepts Covered

- Data selection & filtering (`WHERE`, `BETWEEN`, `IN`, `LIKE`)
- Aggregations: `COUNT`, `SUM`, `AVG`, `MAX`, `MIN`
- Joins: `INNER JOIN`, `LEFT JOIN`
- Grouping & filtering: `GROUP BY`, `HAVING`
- Ordering results: `ORDER BY`, `LIMIT`
- Basic subqueries (`IN`, `NOT IN`, `EXISTS`)
- Null value handling

---

## 📑 Dataset Description

The project uses **three relational tables**:

- **products** – Product details like name, category, brand, price, type, rating
- **customers** – Customer personal and location details
- **orders** – Order details including quantity and date

---

## 📊 Sample Business Insights

Here are **5 examples** of the insights generated in this project:

1. **Top 10 selling products** by quantity and revenue  
2. **Top 5 revenue-generating brands**  
3. **City-wise revenue performance**  
4. **Most loyal customers** based on total spending  
5. **Products with high demand but potential stock issues**  

---

## 📂 Project Structure

bigbasket-sql-analysis/
│
├── data/
│ └── bigbasket_data.sql # Dataset containing all tables & sample records
│
├── queries/
│ └── bigbasket_queries.sql # All SQL queries used for analysis
│
└── README.md # Project documentation

---

## 📂 Dataset
All datasets are located in the [`/data`](data) folder.

---

## 🔗 Direct Access to SQL Queries
You can directly view all SQL queries used in this project here:  
➡️ **[View SQL Queries](queries/bigbasket_queries.sql)**
