select d.student_id,d.subject,s.score first_score,s2.score latest_score 
from(
select student_id,subject,min(exam_date) first_date,max(exam_date) last_date
from scores
group by student_id,subject) d
left join scores s
on d.student_id=s.student_id and d.subject=s.subject and d.first_date =s.exam_date
left join scores s2
on d.student_id=s2.student_id and d.subject=s2.subject and d.last_date =s2.exam_date
where s2.score > s.score
order by student_id,subject 