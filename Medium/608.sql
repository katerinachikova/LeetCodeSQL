--1
SELECT id, 
        CASE WHEN  p_id IS NULL THEN 'Root'
            WHEN id NOT IN (SELECT p_id FROM tree WHERE p_id IS NOT NULL) THEN 'Leaf'
            WHEN p_id IS NOT NULL AND id IN (SELECT p_id FROM tree) THEN 'Inner'
        END as type
FROM tree

--1, but prettier
SELECT id, 
        CASE WHEN  p_id IS NULL THEN 'Root'
            WHEN id IN (SELECT p_id FROM tree) THEN 'Inner'
            ELSE 'Leaf'
        END as type
FROM tree
