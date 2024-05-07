--1
WITH src AS
(
    SELECT *
    FROM (
        SELECT order_date, customer_pref_delivery_date, RANK() OVER (PARTITION BY customer_id ORDER BY order_date) as rnk
        FROM Delivery
    ) t
    WHERE rnk=1
)
SELECT ROUND((SELECT COUNT(1)*1.0 FROM src WHERE order_date=customer_pref_delivery_date)*100/(SELECT COUNT(1)*1.0 FROM src), 2) AS immediate_percentage

--2
WITH src AS
(
    SELECT *
    FROM (
        SELECT order_date, customer_pref_delivery_date, RANK() OVER (PARTITION BY customer_id ORDER BY order_date) as rnk
        FROM Delivery
    ) t
    WHERE rnk=1
)
SELECT ROUND(AVG(CASE WHEN order_date=customer_pref_delivery_date THEN 1.0 ELSE 0.0 END)*100, 2) AS immediate_percentage
FROM src
