-- Write your PostgreSQL query statement below
with tiv_2015_interest as 
(select tiv_2015, count(*), array_agg(pid order by pid) as pid_array 
from Insurance group by
tiv_2015 having count(*)>1),
lat_long_interest as 
(select lat, lon, count(*), array_agg(pid order by pid) as pid_array 
from Insurance group by lat, lon having 
count(*)=1),
-- Unnest both arrays into tables
tiv_pids AS (
  SELECT UNNEST(pid_array) AS pid FROM tiv_2015_interest
),
lat_lon_pids AS (
  SELECT UNNEST(pid_array) AS pid FROM lat_long_interest
)

-- Get intersection
(select round(sum(tiv_2016::numeric), 2) as tiv_2016 from Insurance where pid in (SELECT UNNEST(ARRAY_AGG(pid ORDER BY pid)) AS intersection_array
FROM (
  SELECT pid FROM tiv_pids
  INTERSECT
  SELECT pid FROM lat_lon_pids
) AS intersected));



/*
(SELECT ARRAY_AGG(pid ORDER BY pid) AS flat_pid_array
FROM (
  (SELECT UNNEST(pid_array) AS pid
  FROM lat_long_interest)
) AS flat1)
union 
(SELECT ARRAY_AGG(pid ORDER BY pid) AS flat_pid_array
FROM (
  (SELECT UNNEST(pid_array) AS pid
  FROM tiv_2015_interest)
) AS flat2);

select sum(tiv_2016) from Insurance where pid in 
(select pid from Insurance where tiv_2015 in 
(select tiv_2015 from tiv_2015_interest)) */

/*
SELECT ROUND(SUM(tiv_2016)::numeric, 2) AS tiv_2016
FROM Insurance
WHERE tiv_2015 IN (
    SELECT tiv_2015
    FROM Insurance
    GROUP BY tiv_2015
    HAVING COUNT(*) > 1
)
AND (lat, lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);*/
