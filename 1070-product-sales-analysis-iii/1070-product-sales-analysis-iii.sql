select m.product_id, first_year, s.quantity,s.price
from Sales s
join(
select product_id,min(year) as first_year
from sales
group by product_id ) M
on s.product_id = m.product_id and s.year = m.first_year