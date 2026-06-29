WITH FirstLogin AS (
    -- بنجيب أول يوم تسجيل لكل لاعب
    SELECT player_id, MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
)
SELECT 
    ROUND(
     COUNT(DISTINCT f.player_id) / (SELECT COUNT(DISTINCT player_id) FROM Activity), 2) AS fraction
FROM FirstLogin f
-- بنعمل Join مع الجدول الأصلي عشان نشوف هل نفس اللاعب عنده سجل في اليوم التالي لـ first_date
JOIN Activity a 
  ON f.player_id = a.player_id 
  AND a.event_date = DATE_ADD(f.first_date, INTERVAL 1 DAY);