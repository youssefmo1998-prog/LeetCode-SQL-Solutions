with firstpositive as(
select patient_id,min(test_date) first_positive
from covid_tests
where result = 'positive'
group by patient_id),
firstnegative as(
select c.patient_id,min(test_date) first_negative,first_positive
from firstpositive f
join covid_tests c
on f.patient_id = c.patient_id
where result = 'negative' and c.test_date>first_positive
group by f.patient_id,f.first_positive)
select p.patient_id,p.patient_name,p.age,datediff(first_negative,first_positive) recovery_time 
from firstnegative f
left join patients p
on f.patient_id = p.patient_id 
order by recovery_time , patient_name 