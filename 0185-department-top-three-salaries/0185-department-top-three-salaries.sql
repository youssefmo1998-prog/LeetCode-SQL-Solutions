# Write your MySQL query statement below
with top_three as(
select d.name as Department,e.name as Employee,e.Salary,
dense_rank() over (partition by departmentId order by salary DESC) as ranking
from employee e
left join Department d
on e.departmentId = d.id
)
select Department,Employee,Salary
from top_three
where ranking <=3
