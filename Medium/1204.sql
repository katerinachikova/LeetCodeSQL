SELECT TOP 1 person_name
FROM (
    SELECT *, SUM(weight) OVER (ORDER BY turn) as run_t
    FROM Queue
) t
WHERE run_t<=1000
ORDER BY run_t DESC
