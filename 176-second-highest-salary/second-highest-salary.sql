-- Write your PostgreSQL query statement below
WITH ranked_salary AS (
  SELECT salary, ROW_NUMBER() OVER (ORDER BY salary DESC) AS rn
  FROM (SELECT DISTINCT salary FROM Employee) a
)
SELECT
  (SELECT salary FROM ranked_salary WHERE rn = 2) AS SecondHighestSalary;
