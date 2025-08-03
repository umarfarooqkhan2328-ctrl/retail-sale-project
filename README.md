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
```sql
select *
From demo.`sql - retail sales analysis_utf`
where sale_date = '2022-11-05';
```

`Question 2` Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:
```sql
SELECT 
  *
FROM demo.`sql - retail sales analysis_utf`
WHERE 
    category = 'Clothing'
	
	AND 
    DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
    AND
    quantiy >= 4;
```
`Question 3` Write a SQL query to calculate the total sales (total_sale) for each category.:
```sql
select 
	category,
    sum(quantiy) as 'net quantity',
    COUNT(*) as 'total order'
    from demo.`sql - retail sales analysis_utf`
    group by 1;
```
`Question 4` Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
```sql
 SELECT 
    round(AVG(AGE),2)
    FROM DEMO.`sql - retail sales analysis_utf`
    WHERE category = 'BEAUTY';
```
`Question 5` Write a SQL query to find all transactions where the total_sale is greater than 1000.:
```sql
    SELECT
    *
    FROM DEMO.`sql - retail sales analysis_utf`
    WHERE total_sale > 1000 ;
    
`Question 6` Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
SELECT 
    category , gender,
    COUNT(*) as total_trans
FROM
   DEMO.`sql - retail sales analysis_utf`
   GROUP BY category , gender
   ORDER BY 1;
```
`Question 7` Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:
```sql
SELECT 
    year,
    month,
    avg_sale
FROM (
    SELECT 
        EXTRACT(YEAR FROM sale_date) AS year,
        EXTRACT(MONTH FROM sale_date) AS month,
       ROUND(AVG(total_sale),2) AS avg_sale,
        RANK() OVER (PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale) DESC) AS `rank`
    FROM DEMO.`sql - retail sales analysis_utf`
    GROUP BY year, month
) AS t1
WHERE `rank` = 1;
```
`Question 8` Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:
```sql
SELECT
    customer_id AS CUSTOMER,
    total_sale
FROM
    DEMO.`sql - retail sales analysis_utf`
ORDER BY
    total_sale DESC
LIMIT 5;
```
`Question 9` Write a SQL query to find the number of unique customers who purchased items from each category.:
```sql
SELECT 
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM 
    DEMO.`sql - retail sales analysis_utf`
GROUP BY 
    category
ORDER BY 
    category;
```
`Question 10` Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):
```sql
WITH hourly_sale AS (
  SELECT
    *,
    CASE
      WHEN HOUR(sale_time) < 12 THEN 'morning'
      WHEN HOUR(sale_time) BETWEEN 12 AND 17 THEN 'afternoon'
      ELSE 'evening'
    END AS shifts
  FROM demo.`sql - retail sales analysis_utf`
)
SELECT 
  shifts,
  COUNT(ï»¿transactions_id) AS total_orders    
FROM hourly_sale
GROUP BY shifts;
```

## Findings
**Customer Demographics:** The dataset includes customers from various age groups, with sales distributed across different categories such as Clothing and Beauty.
**High-Value Transactions:** Several transactions had a total sale amount greater than 1000, indicating premium purchases.
**Sales Trends:** Monthly analysis shows variations in sales, helping identify peak seasons.
**Customer Insights:** The analysis identifies the top-spending customers and the most popular product categories.

## Reports
**Sales Summary:** A detailed report summarizing total sales, customer demographics, and category performance.
**Trend Analysis:** Insights into sales trends across different months and shifts.
**Customer Insights:** Reports on top customers and unique customer counts per category.

## Conclusion
This project offers a complete introduction to SQL for data analysts, encompassing database setup, data cleaning, exploratory analysis, and business-focused SQL queries. The insights gained can support informed business decisions by revealing sales trends, customer behavior, and product performance.







