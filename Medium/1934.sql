SELECT s.user_id, 
        ROUND(ISNULL(
        SUM(CASE WHEN action='confirmed' THEN 1.0 ELSE 0.0 END)
        /
        COUNT(1)
        ,0), 2) AS confirmation_rate
FROM Signups s LEFT JOIN Confirmations c ON s.user_id=c.user_id
GROUP BY s.user_id
