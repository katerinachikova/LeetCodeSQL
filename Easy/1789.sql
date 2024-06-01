SELECT e.employee_id, department_id
FROM
(SELECT employee_id, COUNT(1) AS cnt
FROM Employee
GROUP BY employee_id) cnts JOIN Employee e ON cnts.employee_id=e.employee_id
WHERE primary_flag='Y' OR cnt=1
