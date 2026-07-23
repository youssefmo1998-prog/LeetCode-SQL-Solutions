with first_order as(
SELECT order_date, customer_pref_delivery_date
from Delivery
where (customer_id, order_date) in 
(select customer_id,min(ORDER_date) from delivery group by customer_id)
)
select round(sum(if(order_date =customer_pref_delivery_date,1,0))/count(*)*100,2) immediate_percentage 
from first_order