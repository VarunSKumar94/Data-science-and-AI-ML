-- Write your PostgreSQL query statement below
with requester_count as 
(select requester_id as user_id, count(*) from RequestAccepted group by requester_id),
accepter_count as 
(select accepter_id as user_id, count(*) from RequestAccepted group by accepter_id) 

select user_id as id, sum(count) as num from 
((select * from requester_count)
union all 
(select * from accepter_count)) as a
group by user_id
order by sum(count) desc limit 1;
