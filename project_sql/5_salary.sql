SELECT *
FROM job_postings_fact

SELECT
    job_id,
    job_location,
    salary_year_avg,
CASE
    WHEN salary_year_avg > 50000 THEN 'High'
    WHEN salary_year_avg BETWEEN 25000 AND 50000 THEN 'Standard'
    ELSE 'Low'
END AS salary_bucket
FROM job_postings_fact
WHERE job_title_short = 'Data Analyst'
ORDER BY salary_bucket;