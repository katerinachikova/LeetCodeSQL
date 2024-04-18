--1
SELECT TOP 1 ISNULL(requester_id, accepter_id) as id, ISNULL(cnt_1,0)+ISNULL(cnt_2,0) as num
FROM
(
    SELECT requester_id, COUNT(1) as cnt_1
    FROM RequestAccepted
    GROUP BY requester_id
) T1
    FULL JOIN 
(
    SELECT accepter_id, COUNT(1) as cnt_2
    FROM RequestAccepted
    GROUP BY accepter_id
) T2
    ON t1.requester_id=t2.accepter_id
ORDER BY 2 DESC

--2
SELECT TOP 1 requester_id as id, COUNT(1) as num
FROM
(
    SELECT requester_id
    FROM RequestAccepted
        UNION ALL
    SELECT accepter_id
    FROM RequestAccepted
) T2
GROUP BY requester_id
ORDER BY 2 DESC
