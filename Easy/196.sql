DELETE FROM Person
WHERE id IN (
  SELECT DISTINCT p2.id
  FROM Person p1 left join Person p2 ON p1.email=p2.email AND p1.id<p2.id) 
