select employee_id,name,sum(case when rn=1 then rating end)-sum(case when rn=3 then rating end) improvement_score 
from(
     select e.employee_id as employee_id,name,review_date,rating,row_number() over(partition by e.employee_id order by review_date desc) rn
     from employees e
    left join performance_reviews p on e.employee_id = p.employee_id
     where e.employee_id in(
SELECT employee_id
    FROM performance_reviews
    GROUP BY employee_id
    HAVING COUNT(review_id) >= 3)) t
    where rn in(1,2,3)
    group by employee_id,name
    having sum(case when rn=1 then rating end)>sum(case when rn=2 then rating end) and
            sum(case when rn=2 then rating end)>sum(case when rn=3 then rating end)
order by improvement_score desc,name