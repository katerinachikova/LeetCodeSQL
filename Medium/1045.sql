SELECT customer_id
FROM customer
GROUP BY customer_id
HAVING COUNT(DISTINCT product_key)=(SELECT COUNT(1) FROM product)
