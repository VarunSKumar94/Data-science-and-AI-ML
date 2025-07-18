-- Write your PostgreSQL query statement below
with a as  
(select *, ROW_NUMBER() OVER (PARTITION BY p.product_id ORDER BY p.change_date DESC) AS rn
from Products p where change_date<='2019-08-16')

(SELECT product_id, new_price AS price 
  FROM a 
  WHERE rn = 1)
UNION
(
  SELECT product_id, 10 AS price 
  FROM Products p 
  WHERE product_id NOT IN (
    SELECT product_id FROM a
  ));
