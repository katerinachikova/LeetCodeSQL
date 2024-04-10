--1
SELECT man.name
FROM Employee man LEFT JOIN Employee emp ON man.id=emp.managerId
GROUP BY man.id, man.name
HAVING COUNT(1)>=5

--2
SELECT name
FROM Employee 
WHERE ID IN (SELECT managerId FROM Employee GROUP BY managerId HAVING COUNT(1)>=5)
