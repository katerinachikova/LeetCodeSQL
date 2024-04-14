WITH base AS 
(
    SELECT request_at, id, status
    FROM Trips t JOIN Users c ON t.client_id=c.users_id
                    JOIN Users d ON t.driver_id=d.users_id
    WHERE (request_at BETWEEN '2013-10-01' and '2013-10-03')
            AND c.banned='No'
            AND d.banned='No'
)
SELECT total.request_at AS 'Day', ROUND(ISNULL(cancelled.cnt, 0)/total.cnt, 2) AS 'Cancellation Rate'
FROM
    (SELECT request_at, CAST(COUNT(id) AS float) as cnt
    FROM base
    GROUP BY request_at
    ) total
        LEFT JOIN
    (SELECT request_at, CAST(COUNT(id) AS float) as cnt
    FROM base
    WHERE status LIKE 'cancelled%'
    GROUP BY request_at
    ) cancelled
    ON total.request_at=cancelled.request_at
