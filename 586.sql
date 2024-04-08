--1
SELECT TOP 1 customer_number
FROM orders
GROUP BY customer_number
ORDER BY COUNT(order_number) DESC

--2
WITH cte as
(
    SELECT customer_number, COUNT(order_number) as cnt
    FROM orders
    GROUP BY customer_number
)
SELECT customer_number
