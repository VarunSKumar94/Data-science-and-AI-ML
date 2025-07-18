-- Write your PostgreSQL query statement below
WITH master AS (
  SELECT ARRAY_AGG(DISTINCT product_key ORDER BY product_key) AS master_products FROM Product
),
customer_products AS (
  SELECT customer_id, ARRAY_AGG(DISTINCT product_key ORDER BY product_key) AS products
  FROM Customer
  GROUP BY customer_id
)
SELECT cp.customer_id
FROM customer_products cp
CROSS JOIN master
WHERE cp.products = master.master_products;
