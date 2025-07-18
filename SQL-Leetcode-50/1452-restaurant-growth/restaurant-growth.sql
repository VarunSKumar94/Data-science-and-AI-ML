-- Write your PostgreSQL query statement below
with total_amount_by_visits as 
(select visited_on, sum(amount) as amount 
from Customer 
group by visited_on
),
dates_ranked as 
(SELECT
  visited_on,
  ROW_NUMBER() OVER (ORDER BY visited_on) AS rn
FROM (
  SELECT DISTINCT visited_on
  FROM Customer
) AS distinct_dates),
rolling_agg_amount as 
(SELECT
  visited_on,
  SUM(amount) OVER (
    ORDER BY visited_on
    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
  ) AS amount,
  AVG(amount) OVER (
    ORDER BY visited_on
    ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
  ) AS average_amount
FROM total_amount_by_visits)

select visited_on, amount, round(average_amount, 2) as average_amount
from rolling_agg_amount where 
visited_on in (select visited_on from dates_ranked where rn>=7)