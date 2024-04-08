SELECT d.name as Department,
        e.name as Employee,
        salary as Salary
FROM 
    (
        SELECT name, departmentId, salary, DENSE_RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) as rnk
        FROM Employee
    ) e 
    JOIN Department d ON e.departmentId=d.id
WHERE rnk<=3
