WITH d1 AS
(
    SELECT player_id, MIN(event_date) as first_login
    FROM Activity
    GROUP BY player_id
)
SELECT ROUND(
  CAST(
    (
      SELECT COUNT(DISTINCT d1.player_id)
      FROM d1 JOIN Activity d2 ON (d1.player_id=d2.player_id AND DATEDIFF(day, d1.first_login, d2.event_date)=1)
    ) AS decimal
  )
  /
  (
    SELECT COUNT(DISTINCT player_id) FROM Activity
  )
,2) AS fraction 
