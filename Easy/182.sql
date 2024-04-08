SELECT DISTINCT p1.email as Email
FROM person p1 LEFT JOIN person p2 ON p1.email=p2.email
WHERE p1.id!=p2.id
