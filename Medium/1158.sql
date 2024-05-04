--1
SELECT user_id as buyer_id, join_date, ISNULL(cnt, 0) AS orders_in_2019
FROM  Users u LEFT JOIN (SELECT buyer_id, COUNT(order_id) AS cnt
                            FROM Orders
                            WHERE YEAR(order_date)=2019
                            GROUP BY buyer_id) o
    ON o.buyer_id=u.user_id

--2
SELECT user_id as buyer_id, join_date, count(order_id) as 'orders_in_2019'
FROM Users u LEFT JOIN Orders o ON o.buyer_id=u.user_id AND YEAR(order_date)='2019'
GROUP BY user_id, join_date
