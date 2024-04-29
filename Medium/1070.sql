--1 for fun
SELECT product_id, year as first_year, quantity, price
FROM Sales s 
WHERE CONCAT(product_id, year) IN (SELECT CONCAT(product_id, MIN(year))
                                FROM Sales
                                GROUP BY product_id)


--2
SELECT product_id, first_year, quantity, price
FROM (
    SELECT product_id, 
            year as first_year, 
            quantity, 
            price, 
            RANK() OVER (PARTITION BY product_id ORDER BY year) as rnk
    FROM Sales 
) T
WHERE rnk=1
