-- Write your PostgreSQL query statement below
WITH cat_inc AS (
  SELECT *, 
    CASE 
      WHEN income < 20000 THEN 'Low Salary'
      WHEN income >=20000 AND income<= 50000 THEN 'Average Salary'
      WHEN income > 50000 THEN 'High Salary'
    END AS category
  FROM Accounts),
cat_master as 
(SELECT 'Low Salary' AS category
UNION ALL
SELECT 'Average Salary'
UNION ALL
SELECT 'High Salary')

select cat_master.category, coalesce(b.accounts_count, 0) as accounts_count from
cat_master
left join
(SELECT category, COUNT(account_id) as accounts_count
FROM cat_inc
GROUP BY category) b
on cat_master.category = b.category

--select * from cat_master;