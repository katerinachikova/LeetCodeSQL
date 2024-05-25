SELECT st.machine_id, ROUND(AVG(en.timestamp-st.timestamp), 3) AS processing_time
FROM Activity st JOIN Activity en ON st.machine_id=en.machine_id AND st.process_id=en.process_id AND st.activity_type='start' AND en.activity_type='end'
GROUP BY st.machine_id
