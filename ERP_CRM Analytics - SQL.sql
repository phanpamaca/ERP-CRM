-- Use the database  erp_crm_schema created with Python in Jupyter notebook. Use MySQL Workbench to run the following SQL statements.
 
-- Total revenue
SELECT SUM(revenue) FROM final_dataset;

-- Total Orders
SELECT count(distinct(order_id)) ORDERS FROM final_dataset

-- Total Customers
SELECT count(distinct(customer_id)) customers FROM final_dataset

-- Average Order Value
SELECT SUM(revenue) / count(distinct(order_id)) ave_order_value FROM final_dataset

select 
-- Top 5 customers
SELECT name, SUM(revenue) AS total
FROM final_dataset
GROUP BY name
ORDER BY total DESC
LIMIT 5;
 
-- Top 5 products
SELECT product_name, SUM(revenue) AS total
FROM final_dataset
GROUP BY product_name
ORDER BY total DESC
LIMIT 5;

-- Top 5 cities
SELECT city, SUM(revenue) AS total
FROM final_dataset
GROUP BY city
ORDER BY total DESC
LIMIT 5; 

-- Customer Lifetime Value
SELECT name, SUM(revenue) AS lifetime_value
FROM final_dataset
GROUP BY name
ORDER BY SUM(revenue) desc;

--. Customer Revenue Contribution %
SELECT name,
       SUM(revenue) / (SELECT SUM(revenue) FROM final_dataset) * 100 AS pct
FROM final_dataset
GROUP BY name
ORDER BY pct DESC;

-- 	Top Customer Contribution
SELECT
    MAX(name_revenue) / SUM(name_revenue) AS Revenue_Ratio
FROM (
    SELECT
        name,
        SUM(Revenue) AS name_revenue
    FROM final_dataset
    GROUP BY name
) AS x;

SELECT
        name,
        SUM(Revenue) AS name_revenue,
        SUM(SUM(Revenue)) OVER () AS total_revenue,
        SUM(Revenue)/ SUM(SUM(Revenue)) OVER () as pct
    FROM final_dataset
    GROUP BY name
    order by name_revenue desc

--Monthly Growth Rate
select date, str_to_date(date, "%Y-%m-%d"), DATE_FORMAT(str_to_date(date, "%Y-%m-%d"), '%y%m')  from final_dataset limit 10;
SELECT 
    DATE_FORMAT(str_to_date(date, "%Y-%m-%d"), '%y%m') AS month,
    SUM(revenue) AS revenue
FROM final_dataset
GROUP BY month;

-- Repeat vs One-time Customers
SELECT customer_id,
       COUNT(order_id) AS orders
FROM final_dataset
GROUP BY customer_id;
