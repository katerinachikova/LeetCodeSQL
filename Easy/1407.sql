SELECT name, SUM(ISNULL(distance, 0)) AS travelled_distance
FROM Users u LEFT JOIN Rides r ON r.user_id=u.id
GROUP BY name, user_id
ORDER BY 2 DESC, 1
