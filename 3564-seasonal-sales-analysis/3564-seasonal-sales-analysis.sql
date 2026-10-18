with final as(
select*,ROW_NUMBER() over (partition by season order by season,total_quantity desc,total_revenue desc,category ) num
from
(select case when monthname(sale_date) in('December','January','February') then 'Winter'
 when monthname(sale_date) in('March','April','May') then 'Spring'
 when monthname(sale_date) in('June','July','August') then 'Summer'
 when monthname(sale_date) in('September','October','November') then 'Fall' end season,
category,sum(quantity) total_quantity,sum(quantity*price) total_revenue
from
(select sale_date,category,quantity,price
from sales s
left join products p
on s.product_id = p.product_id) mearge
group by category,season
) se
)
select season,category,total_quantity,total_revenue
from final
where num=1