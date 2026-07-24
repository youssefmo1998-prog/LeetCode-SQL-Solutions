select person_name
from(
select person_name,turn,weight,sum(weight) over (order by turn) total_weight 
from Queue) total
where total_weight <=1000
order by total_weight desc
limit 1