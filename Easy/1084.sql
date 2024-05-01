--1
SELECT DISTINCT p.product_id, product_name
FROM Product p JOIN Sales s ON p.product_id=s.product_id
WHERE sale_date BETWEEN '2019-01-01' and '2019-03-31'
        AND p.product_id NOT IN (SELECT product_id FROM sales WHERE sale_date NOT BETWEEN '2019-01-01' and '2019-03-31')


--2
SELECT p.product_id, p.product_name
FROM Product p JOIN Sales s ON p.product_id = s.product_id
GROUP BY p.product_id, p.product_name
HAVING MIN(s.sale_date) > '2018-12-31' AND MAX(s.sale_date) < '2019-04-01'
