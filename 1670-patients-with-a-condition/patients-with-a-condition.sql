-- Write your PostgreSQL query statement below
SELECT
  patient_id,
  patient_name,
  conditions
FROM Patients
WHERE EXISTS (
  SELECT 1
  FROM regexp_split_to_table(conditions, '\s+') AS cond
  WHERE cond LIKE 'DIAB1%'
);


