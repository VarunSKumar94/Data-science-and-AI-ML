-- Write your PostgreSQL query statement below
with salary_lookup_table as 
(select departmentId,
  unnest(unique_salary_list[1:3]) AS top_3_salary
from 
(select departmentId, array_agg(distinct salary order by salary desc) as unique_salary_list
 from Employee group by
departmentId)),
high_earners as
(select e.* from Employee e inner join 
salary_lookup_table slt on 
slt.departmentId = e.departmentId 
and slt.top_3_salary = e.Salary)

select d.name as Department, he.name as Employee, he.salary from high_earners he
inner join Department d on d.id = he.departmentId
