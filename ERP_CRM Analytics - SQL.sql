-- Total revenue
SELECT SUM(revenue) FROM final_dataset;

-- Top 5 customers
SELECT name, SUM(revenue) AS total
FROM final_dataset
GROUP BY name
ORDER BY total DESC
LIMIT 5;

--Customer Lifetime Value
SELECT customer_id, SUM(revenue) AS lifetime_value
FROM final_dataset
GROUP BY customer_id;

--. Revenue Contribution %
SELECT name,
       SUM(revenue) / (SELECT SUM(revenue) FROM final_dataset) * 100 AS pct
FROM final_dataset
GROUP BY name;

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

