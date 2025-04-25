-- Write your PostgreSQL query statement below
select *, 
    case when 
        x+y>z AND y+z>x AND z+x>y then 'Yes'
        else 'No' end as triangle from Triangle;