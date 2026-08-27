select s.user_id,round(COALESCE(d.divide,0),2) confirmation_rate 
from Signups s
left join(
select user_id,count(case when action = 'confirmed' then 1 end)/
count(action) as divide
from Confirmations
group by user_id) d
on s.user_id = d.user_id