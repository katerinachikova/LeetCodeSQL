SELECT project_id, ROUND(AVG(CAST(experience_years as decimal)), 2) AS average_years
FROM Project p JOIN Employee e ON p.employee_id=e.employee_id
GROUP BY project_id
ORDER BY project_id
