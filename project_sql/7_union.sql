SELECT
    job_title_short,
    company_id,
    job_location
FROM 
    january_jobs

UNION --same number of columns and same data type in order to work
      -- also filter duplicates
      --UNION ALL (same process for UNION, but returns duplicates also)

SELECT
    job_title_short,
    company_id,
    job_location
FROM 
    february_jobs


-- Another example

/* Find job postings from the first quarter that have a salary greater than 70k
- Combine job postings tables from the first quarter of 2023 (Jan-Mar)
- Get job postings with an ave yr salary > 70k
*/

SELECT 
    job_id,
    salary_year_avg,
    job_posted_date
FROM january_jobs
WHERE
    salary_year_avg > 70000 AND
    EXTRACT(MONTH FROM job_posted_date) IN (1, 2, 3)

UNION ALL

SELECT 
    job_id,
    salary_year_avg,
    job_posted_date
FROM february_jobs
WHERE
    salary_year_avg > 70000 AND
    EXTRACT(MONTH FROM job_posted_date) IN (1, 2, 3)

UNION ALL

SELECT 
    job_id,
    salary_year_avg,
    job_posted_date
FROM march_jobs
WHERE
    salary_year_avg > 70000 AND
    EXTRACT(MONTH FROM job_posted_date) IN (1, 2, 3)