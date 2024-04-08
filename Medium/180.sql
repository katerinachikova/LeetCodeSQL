SELECT DISTINCT num as ConsecutiveNums
FROM
(
  SELECT num, CASE 
      WHEN num=LAG(num, 2) OVER (ORDER BY id) 
          AND num=LAG(num, 1) OVER (ORDER BY id) 
      THEN 1 
      ELSE 0 
    END as flag
  FROM logs) t
WHERE flag=1
