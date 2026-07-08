/*select m.product_id, first_year, s.quantity,s.price
from Sales s
join(
select product_id,min(year) as first_year
from sales
group by product_id ) M
on s.product_id = m.product_id and s.year = m.first_year*/
with min_year as(
select * , DENSE_RANK() over (partition by product_id order by year) rank_year
from sales)
select product_id, year first_year, quantity,price
from min_year
where rank_year=1





























