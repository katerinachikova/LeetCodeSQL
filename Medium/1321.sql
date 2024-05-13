--1
WITH sales AS 
(
    SELECT visited_on, SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
)
SELECT visited_on, amount, average_amount
FROM (
    SELECT sales_prev.visited_on, 
            SUM(sales.amount) AS amount, 
            ROUND(AVG(sales.amount*1.0), 2) AS average_amount,
            ROW_NUMBER() OVER (ORDER BY sales_prev.visited_on) AS rn
    FROM sales CROSS JOIN sales AS sales_prev
    WHERE DATEDIFF(day, sales_prev.visited_on, sales.visited_on) BETWEEN -6 AND 0 
    GROUP BY sales_prev.visited_on
) t
WHERE rn>6
