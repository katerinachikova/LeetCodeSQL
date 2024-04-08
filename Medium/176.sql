--1 mssql
WITH rn as 
(
    SELECT salary, RANK() OVER (ORDER BY salary DESC) as rn
    FROM Employee 
),
max_rn as
(
    SELECT MAX(rn) as max_rn
    FROM rn
)
SELECT CASE 
        WHEN (SELECT max_rn FROM max_rn)>=2 
          THEN (SELECT TOP 1 salary FROM rn WHERE rn=2)
    ELSE null END
 as SecondHighestSalary

--2 pgsql
SELECT (
    SELECT DISTINCT salary as "SecondHighestSalary"
    FROM employee
    ORDER BY salary DESC
    LIMIT 1
    OFFSET 1
)
