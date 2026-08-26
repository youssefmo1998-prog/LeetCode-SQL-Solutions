(
select u.name as results
from MovieRating mr
left join users u
on mr.user_id = u.user_id
group by u.name
order by count(rating) desc,u.name
limit 1
)
union all
(
SELECT v.title
FROM MovieRating mr
JOIN Movies v ON mr.movie_id = v.movie_id
WHERE mr.created_at >= '2020-02-01' AND mr.created_at <= '2020-02-29'
GROUP BY v.title
ORDER BY avg(rating) DESC, v.title ASC
LIMIT 1
)