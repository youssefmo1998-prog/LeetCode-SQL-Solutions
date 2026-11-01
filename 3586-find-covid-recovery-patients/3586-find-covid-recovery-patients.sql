WITH FirstPositive AS (
    SELECT patient_id,MIN(test_date) AS first_pos_date
    FROM covid_tests
    WHERE result = 'Positive'
    GROUP BY patient_id)
,FirstNegativeAfterPositive AS (
    SELECT fp.patient_id,fp.first_pos_date,MIN(ct.test_date) AS first_neg_date
    FROM FirstPositive fp
    JOIN covid_tests ct 
        ON fp.patient_id = ct.patient_id
    WHERE ct.result = 'Negative' 
      AND ct.test_date > fp.first_pos_date
    GROUP BY fp.patient_id, fp.first_pos_date)
SELECT p.patient_id,p.patient_name,p.age,
    DATEDIFF(fn.first_neg_date, fn.first_pos_date) AS recovery_time
FROM FirstNegativeAfterPositive fn
JOIN patients p 
    ON fn.patient_id = p.patient_id
ORDER BY 
    recovery_time ASC, 
    patient_name ASC;