--1
SELECT alt.category, COALESCE(cnt, alt_cnt) AS accounts_count
FROM
(
    SELECT CASE WHEN income<20000 THEN 'Low Salary'
                WHEN income>50000 THEN 'High Salary'
                ELSE 'Average Salary' END as category, COUNT(1) AS cnt
    FROM Accounts
    GROUP BY CASE WHEN income<20000 THEN 'Low Salary'
                WHEN income>50000 THEN 'High Salary'
                ELSE 'Average Salary' END 
) t
FULL JOIN 
(
    SELECT 'Low Salary' AS category, 0 AS alt_cnt
    UNION 
    SELECT 'Average Salary', 0
    UNION
    SELECT 'High Salary', 0
) alt ON t.category=alt.category

--2
SELECT 'Low Salary' AS category, count(1) AS accounts_count FROM accounts WHERE income < 20000
UNION ALL
SELECT 'Average Salary', count(1) FROM accounts WHERE income BETWEEN 20000 AND 50000
UNION ALL
SELECT 'High Salary', count(1) FROM accounts WHERE income > 50000
