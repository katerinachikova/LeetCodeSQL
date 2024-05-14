SELECT product_name, SUM(unit) AS unit
FROM Products p JOIN Orders o ON p.product_id=o.product_id
WHERE order_date LIKE '2020-02-%'
GROUP BY product_name
HAVING SUM(unit)>=100
