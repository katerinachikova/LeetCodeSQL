SELECT ISNULL(s.product_id, p.product_id) AS product_id, 
        ISNULL(ROUND(SUM(units*p.price)*1.0/SUM(units), 2), 0) AS average_price
FROM Prices p FULL JOIN UnitsSold s ON p.product_id=s.product_id
WHERE (s.purchase_date<=p.end_date AND s.purchase_date>=p.start_date) OR s.purchase_date IS NULL
GROUP BY s.product_id, p.product_id
