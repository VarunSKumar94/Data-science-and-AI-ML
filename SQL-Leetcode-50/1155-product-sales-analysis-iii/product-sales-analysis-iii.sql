-- Write your PostgreSQL query statement below

/*SELECT product_id, year AS first_year, quantity, price FROM 
(SELECT 
    s.product_id,
    s.year,
    s.quantity,
    s.price,
    ROW_NUMBER() OVER (PARTITION BY s.product_id ORDER BY s.year) AS rn
  FROM Sales s
  LEFT JOIN Product p ON p.product_id = s.product_id) where rn=1;*/

select product_id, year as first_year, quantity, price from Sales s where CONCAT(product_id, '|', year) in 
(SELECT CONCAT(product_id, '|', MIN(year)) AS product_first_year
FROM Sales
GROUP BY product_id);