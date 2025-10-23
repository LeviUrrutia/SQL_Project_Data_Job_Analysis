SELECT *
FROM (
    SELECT 
        search_location,
        job_via,
        job_title_short
    FROM job_postings_fact
    WHERE EXTRACT(MONTH FROM job_posted_date) = 1
    ) AS january_jobs;


--Another example

SELECT 
    company_id,
    name AS company_name --get company name in which in job_posting_fact table degree = true
FROM company_dim --company_dim table
WHERE company_id IN (
    SELECT
        company_id
    FROM
        job_postings_fact --job_posting_fact table
    WHERE 
        job_no_degree_mention = true --condition
    ORDER BY
        company_id
)