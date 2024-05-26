--1
SELECT user_id, CONCAT(UPPER(LEFT(name, 1)), LOWER(RIGHT(name, LEN(name)-1))) AS name 
FROM Users
ORDER BY user_id

--2
SELECT user_id, CONCAT(UPPER(LEFT(name, 1)), LOWER(SUBSTRING(name, 2, LEN(name)))) AS name 
FROM Users
ORDER BY user_id
