-- Write your PostgreSQL query statement below
with a as 
(select e.*, emp_count.n_dept from Employee e 
left join 
(select e.employee_id, count(*) as n_dept from Employee e group by
e.employee_id) emp_count
on e.employee_id = emp_count.employee_id)

select employee_id, department_id from a where n_dept=1 or primary_flag='Y';  