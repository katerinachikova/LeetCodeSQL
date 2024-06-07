SELECT COALESCE(e.employee_id, s.employee_id) AS employee_id
FROM Employees e FULL JOIN Salaries s ON e.employee_id=s.employee_id
WHERE salary IS NULL OR name IS NULL
ORDER BY employee_id
