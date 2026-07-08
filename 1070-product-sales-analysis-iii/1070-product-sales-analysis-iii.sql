with min_year as(
select * , DENSE_RANK() over (partition by product_id order by year) rank_year
from sales)
select product_id, year first_year, quantity,price
from min_year
where rank_year=1





























