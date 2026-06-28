/*
  Description:
A company's executives are interested in seeing who earns the most money in 
each of the company's departments. A high earner in a department is an employee 
who has a salary in the top three unique salaries for that department.

Write a solution to find the employees who are high earners in each of the departments.
=============================================================================
  */
  
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
