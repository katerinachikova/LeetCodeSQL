SELECT name AS results
FROM (
    SELECT TOP 1 name, COUNT(1) AS cnt
    FROM MovieRating r JOIN Users u ON r.user_id=u.user_id
    GROUP BY name
    ORDER BY cnt DESC, name
) us
UNION ALL
SELECT title
FROM (
    SELECT TOP 1 title, AVG(rating*1.0) AS avgr
    FROM MovieRating r JOIN Movies m ON r.movie_id=m.movie_id
    WHERE created_at LIKE '2020-02-%'
    GROUP BY title
    ORDER BY avgr DESC, title
) mo
