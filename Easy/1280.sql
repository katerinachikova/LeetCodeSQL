SELECT  t.student_id, 
        t.student_name, 
        t.subject_name,
        ISNULL(COUNT(e.student_id), 0) AS attended_exams
FROM (
        SELECT s.student_id, s.student_name, l.subject_name
        FROM Students s CROSS JOIN Subjects l
    ) t
        LEFT JOIN Examinations e ON e.student_id=t.student_id AND e.subject_name=t.subject_name
GROUP BY t.student_id, t.student_name, t.subject_name
ORDER BY t.student_id, t.subject_name
