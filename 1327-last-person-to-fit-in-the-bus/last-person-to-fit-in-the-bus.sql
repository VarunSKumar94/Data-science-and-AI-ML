-- Write your PostgreSQL query statement below
WITH wgt_cumltd AS (
  SELECT *, 
         SUM(weight) OVER (ORDER BY turn ASC) AS total_weight
  FROM Queue
)

SELECT person_name
FROM wgt_cumltd
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1;
