with tree_types as(
select id, take,give,
(case when take is null then 'Root'
when take >=1 and give >=1 then 'Inner'
when take >=1 and give is null then 'Leaf' end) as type
from(
select t1.id as id,t1.p_id as take,t2.id as give
from Tree t1
left join tree t2
on t1.id = t2.p_id) ff
)
select distinct id,type
from tree_types