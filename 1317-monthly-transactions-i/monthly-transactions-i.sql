-- Write your PostgreSQL query statement below
with transaction_m as
(SELECT *,
       TO_CHAR(trans_date, 'YYYY-MM') AS trans_month
FROM Transactions)
select trans_month as month, country, count(*) as trans_count, sum(case when state = 'approved' then 1 else 0 end) as approved_count, sum(amount) as trans_total_amount, sum(case when state='approved' then amount else 0 end) as approved_total_amount from transaction_m group by trans_month, country
-- select trans_month, count(*) from transaction_m group by trans_month;