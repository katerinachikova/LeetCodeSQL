--1 
SELECT id, CASE WHEN id%2=0 THEN LAG(student, 1) OVER (ORDER BY id)
                WHEN id%2=1 THEN 
                    CASE WHEN id=MAX(id) OVER () THEN student
                        ELSE LEAD(student, 1) OVER (ORDER BY id) 
                    END
            END as student
FROM seat

--2
SELECT norm.id, CASE WHEN norm.id%2=0 THEN prev.student
                WHEN norm.id%2=1 THEN 
                    CASE WHEN next.id IS NULL THEN norm.student
                        ELSE next.student 
                    END
            END as student
FROM seat norm 
        LEFT JOIN seat next ON norm.id+1=next.id 
        LEFT JOIN seat prev ON norm.id=prev.id+1

--3
SELECT CASE 
            WHEN ID % 2 = 1 THEN LEAD(ID, 1, ID) OVER (ORDER BY ID ASC)
            WHEN ID % 2 = 0 THEN ID - 1
        END AS ID, STUDENT
FROM SEAT
ORDER BY ID
