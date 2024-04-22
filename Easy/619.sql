--1
SELECT MAX(num) as num
FROM 
(
    SELECT num 
    FROM MyNumbers
    GROUP BY num
    HAVING COUNT(1)=1
) t

--2
SELECT (SELECT TOP 1 num 
FROM MyNumbers
GROUP BY num
HAVING COUNT(1)=1
ORDER BY num DESC) AS num
