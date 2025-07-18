-- Write your PostgreSQL query statement below

select Class from Courses group by Class having count(distinct student)>=5;