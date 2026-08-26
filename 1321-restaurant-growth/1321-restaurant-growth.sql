with grouped as(
select visited_on,sum(amount) amount
from customer
group by visited_on
),dailyavg as(
select visited_on, count(visited_on) over(order by visited_on) count,
sum(amount) over(order by visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW )amount,
round(avg(amount) over(order by visited_on ROWS BETWEEN 6 PRECEDING AND CURRENT ROW ),2) average_amount
from grouped
)
select visited_on,amount,average_amount
from dailyavg
where count >=7