SELECT orig.product_id, ISNULL(new_price, pr) AS price
FROM
(
    SELECT product_id, new_price
    FROM (
        SELECT product_id, new_price, ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rnk
        FROM  Products 
        WHERE change_date<='2019-08-16'
    ) t
    WHERE rnk=1
) 
    filt RIGHT JOIN 
    (
        SELECT DISTINCT product_id, 10 as pr
        FROM Products
    ) orig ON filt.product_id=orig.product_id
