select machine_id, round(processing_time::numeric, 3) as processing_time from 
(SELECT a.machine_id, 
       AVG(b.timestamp - a.timestamp) AS processing_time
FROM Activity a, 
     Activity b
WHERE 
    a.machine_id = b.machine_id
AND 
    a.process_id = b.process_id
AND 
    a.activity_type = 'start'
AND 
    b.activity_type = 'end'
GROUP BY a.machine_id) a;