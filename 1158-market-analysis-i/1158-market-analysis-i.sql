select user_id as buyer_id,join_date,count(o.order_id) orders_in_2019 
from Users u
left join (select order_id, buyer_id,item_id from orders where order_date between '2019-01-01'and '2019-12-31') o
on u.user_id = o.buyer_id
left join Items i
on o.item_id = i.item_id
group by user_id,join_date