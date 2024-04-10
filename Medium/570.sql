SELECT man.name
FROM Employee man LEFT JOIN Employee emp ON man.id=emp.managerId
GROUP BY man.id, man.name
HAVING COUNT(1)>=5
