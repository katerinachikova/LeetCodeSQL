SELECT ROUND(SUM(CAST(tiv_2016 AS float)), 2) as tiv_2016
FROM Insurance
WHERE pid IN (
                SELECT DISTINCT prev.pid
                FROM Insurance prev JOIN Insurance cur ON (cur.tiv_2015=prev.tiv_2015 AND prev.pid!=cur.pid)
                        LEFT JOIN Insurance loc ON (prev.lat=loc.lat AND prev.lon=loc.lon AND loc.pid!=prev.pid)
                WHERE loc.pid IS NULL
            )
