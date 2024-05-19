SELECT sell_date, 
        COUNT(1) as 'num_sold', 
        STRING_AGG(product, ',') as products
FROM
(
    SELECT DISTINCT *
    FROM Activities
) t
GROUP BY sell_date
