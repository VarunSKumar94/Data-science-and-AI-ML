-- Write your PostgreSQL query statement below
select distinct num as ConsecutiveNums from 
(SELECT *, 
       LAG(num, 1) OVER () AS num_lag1, 
       LAG(num, 2) OVER () AS num_lag2
FROM Logs)
where num_lag1 = num_lag2 and num_lag1=num;