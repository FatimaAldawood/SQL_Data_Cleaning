WITH step1 AS (
    SELECT *
    FROM `my-project-369-433218.training_data.employees_training_data`
    WHERE education IS NULL AND  previous_year_rating IS NULL
),
step2 AS (
  SELECT 
    DISTINCT(employee_id),
    LOWER(department),
    region,

    LOWER(COALESCE(education, 'Not Specified')) AS education,

    CASE 
    WHEN LOWER(gender) IN ('m') THEN ('male')
    WHEN LOWER(gender) IN('f') THEN ('female')
    ELSE ('not specified')
    END AS gender,
    LOWER(recruitment_channel),
    no_of_trainings,
    age,

    COALESCE(previous_year_rating,0) AS previous_year_rating,
    
    length_of_service,
    awards_won,
    avg_training_score,
    is_promoted
    FROM step1
) 

SELECT * FROM step2
