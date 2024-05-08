--1
SELECT tot.month, 
        tot.country, 
        trans_count, 
        ISNULL(approved_count,0) AS approved_count, 
        trans_total_amount, 
        ISNULL(approved_total_amount, 0) AS approved_total_amount
FROM (
    SELECT FORMAT(trans_date, 'yyyy-MM') as month, country, COUNT(1) AS trans_count, SUM(amount) AS trans_total_amount 
    FROM Transactions 
    GROUP BY FORMAT(trans_date, 'yyyy-MM'), country
) tot LEFT JOIN
(
    SELECT FORMAT(trans_date, 'yyyy-MM') as month, country, COUNT(1) AS approved_count, SUM(amount) AS approved_total_amount 
    FROM Transactions 
    WHERE state='approved'
    GROUP BY FORMAT(trans_date, 'yyyy-MM'), country
) appr ON tot.month=appr.month AND ISNULL(tot.country, -1)=ISNULL(appr.country, -1)

--2
SELECT FORMAT(trans_date, 'yyyy-MM') AS month,
        country,
        count(1) AS trans_count,
        SUM(CASE WHEN state = 'approved' THEN 1 ELSE 0 END) AS approved_count,
        SUM(amount) AS trans_total_amount,
        SUM(CASE WHEN state = 'approved' THEN amount ELSE 0 END) AS approved_total_amount
FROM Transactions
GROUP BY FORMAT(trans_date, 'yyyy-MM'), country

