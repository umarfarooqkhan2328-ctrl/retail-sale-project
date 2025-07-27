SELECT * FROM demo.`sql - retail sales analysis_utf`
where 
	ï»¿transactions_id is null
	or sale_date is null
	or sale_time is null
	or customer_id is null
	or gender is null 
	or age is null
	or category is null 
	or quantiy is null
	or price_per_unit is null 
	or cogs is null
	or  total_sale is null;
    
-- data exploration
-- how many sales we have ??

SELECT COUNT(*) FROM demo.`sql - retail sales analysis_utf`;

-- how many customer unique we have 

SELECT COUNT(DISTINCT customer_id)FROM demo.`sql - retail sales analysis_utf`;

SELECT DISTINCT category FROM demo.`sql - retail sales analysis_utf`;

-- data analysis and bussiness  key problem and answer.


-- Q1 write a sql query to retrieve all column for the sale mode on 2022-11-05

select *
From demo.`sql - retail sales analysis_utf`
where sale_date = '2022-11-05';

-- Q2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 4 in the month of Nov-2022:

SELECT 
  *
FROM demo.`sql - retail sales analysis_utf`
WHERE 
    category = 'Clothing'
	
	AND 
    DATE_FORMAT(sale_date, '%Y-%m') = '2022-11'
    AND
    quantiy >= 4;
    
-- Q3 Write a SQL query to calculate the total sales (total_sale) for each category.:    
select 
	category,
    sum(quantiy) as 'net quantity',
    COUNT(*) as 'total order'
    from demo.`sql - retail sales analysis_utf`
    group by 1;
    
    -- Q4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.:
    
    SELECT 
    round(AVG(AGE),2)
    FROM DEMO.`sql - retail sales analysis_utf`
    WHERE category = 'BEAUTY';
    
    
    -- Q5 Write a SQL query to find all transactions where the total_sale is greater than 1000.:
    SELECT
    *
    FROM DEMO.`sql - retail sales analysis_utf`
    WHERE total_sale > 1000 ;
    
   -- Q6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.:
SELECT 
    category , gender,
    COUNT(*) as total_trans
FROM
   DEMO.`sql - retail sales analysis_utf`
   GROUP BY category , gender
   ORDER BY 1;

-- Q7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year:

   
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
   
  -- Q8 **Write a SQL query to find the top 5 customers based on the highest total sales **:
   
 SELECT
    customer_id AS CUSTOMER,
    total_sale
FROM
    DEMO.`sql - retail sales analysis_utf`
ORDER BY
    total_sale DESC
LIMIT 5;
   
-- Q9 Write a SQL query to find the number of unique customers who purchased items from each category.:

SELECT 
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM 
    DEMO.`sql - retail sales analysis_utf`
GROUP BY 
    category
ORDER BY 
    category;

-- Q10 Write a SQL query to create each shift and number of orders (Example Morning <12, Afternoon Between 12 & 17, Evening >17):
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
