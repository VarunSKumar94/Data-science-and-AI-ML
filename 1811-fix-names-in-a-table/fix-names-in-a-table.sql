-- Write your PostgreSQL query statement below
SELECT
  user_id,
  UPPER(LEFT(LOWER(name), 1)) || SUBSTRING(LOWER(name) FROM 2) AS name
FROM Users
ORDER BY user_id;
