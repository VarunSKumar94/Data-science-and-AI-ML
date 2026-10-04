CREATE OR REPLACE FUNCTION NthHighestSalary(N INT) RETURNS TABLE (Salary INT) AS $$
BEGIN
  RETURN QUERY (
    -- Write your PostgreSQL query statement below.
    SELECT DISTINCT e.sal
    FROM (SELECT 
            e.salary as sal,
            DENSE_RANK() OVER (ORDER BY e.salary DESC) AS rnk
        FROM Employee e
    ) e
    WHERE e.rnk = N
 );
END;
$$ LANGUAGE plpgsql;