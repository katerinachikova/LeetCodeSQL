--1
SELECT contest_id, ROUND(COUNT(1)*100/cnt_users, 2) as percentage
FROM 
(
    SELECT COUNT(1)*1.0 as cnt_users
    FROM Users
) t, Register
GROUP BY contest_id, cnt_users
ORDER BY percentage DESC, contest_id

--2
SELECT contest_id,
        ROUND((COUNT(u.user_id)*1.0/(SELECT COUNT(1) FROM  Users))*100 ,2) as percentage
FROM Users u JOIN Register r ON u.user_id = r.user_id 
GROUP BY contest_id
ORDER BY percentage DESC, contest_id
