-- Write your PostgreSQL query statement below
SELECT activity_date as day, count(distinct user_id) as active_users 
FROM Activity 
WHERE activity_date <= '2019-07-27' 
  AND activity_date > DATE '2019-07-27' - INTERVAL '30 days'
group by activity_date
order by activity_date asc;
