-- Write your PostgreSQL query statement below
/*with movrating_usergrpd as 
(select user_id, count(distinct movie_id) 
from MovieRating group by user_id order by count(distinct movie_id) desc),
movrating_movgrpd as
(select movie_id, avg(rating) from MovieRating group by movie_id
order by avg(rating))

select name as results from movrating_usergrpd*/

with mov_labeled as
(select mr.movie_id, m.title, u.name, u.user_id, mr.rating, mr.created_at from MovieRating mr inner join Movies m on m.movie_id = mr.movie_id 
inner join Users u on u.user_id = mr.user_id),
movrating_usergrpd as 
(select user_id, name, count(distinct movie_id) 
from mov_labeled group by user_id, name 
order by count(distinct movie_id) desc, name asc),
movrating_movgrpd as
(select title, movie_id, avg(rating) from mov_labeled 
where created_at >= '2020-02-01' and created_at<'2020-03-01' 
group by title, movie_id
order by avg(rating) desc, title asc)

(select name as results from movrating_usergrpd limit 1)
union all
(select title as results from movrating_movgrpd limit 1)