select name
from(
select managerid
from employee
group by managerid
having count(managerid)>=5
) m
inner join employee e
on m.managerid = e.id