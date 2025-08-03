# SQL-retail-sale-project
## Project Summary
### Title: 
Retail Sales Analysis
### Database: 
p1_retail_db

This project focuses on analyzing retail sales data using SQL. It involves creating and populating a retail database, cleaning the data, exploring patterns and trends, and answering key business questions through SQL queries. The goal is to extract actionable insights from the sales data by applying core data analysis techniques.

## Project Objectives:

Database Setup: Build and populate the retail sales database using the provided dataset.

Data Cleaning: Identify and remove records that contain missing or null values to ensure data quality.

Exploratory Data Analysis (EDA): Conduct an initial examination of the dataset to uncover patterns, relationships, and anomalies.

Business Analysis: Write SQL queries to answer specific business questions and generate insights that can support decision-making.


## Project structure 
**Database Creation:** The project begins with the creation of a database called p1_retail_db.

**Table Setup:** Within this database, a table named retail_sales is established to hold sales-related information. The table includes fields for transaction ID, sale date, sale time, customer ID, gender, age, product category, quantity sold, unit price, cost of goods sold (COGS), and total sales amount.

```sql
SELECT COUNT(*) FROM retail_sales;
SELECT COUNT(DISTINCT customer_id) FROM retail_sales;
SELECT DISTINCT category FROM retail_sales;

SELECT * FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;

DELETE FROM retail_sales
WHERE 
    sale_date IS NULL OR sale_time IS NULL OR customer_id IS NULL OR 
    gender IS NULL OR age IS NULL OR category IS NULL OR 
    quantity IS NULL OR price_per_unit IS NULL OR cogs IS NULL;
```

## 3. Data Analysis & Insights
The SQL queries below were created to address key business questions and uncover actionable insights."

`Question 1:` Write a SQL query to retrieve all columns for sales made on '2022-11-05'.


