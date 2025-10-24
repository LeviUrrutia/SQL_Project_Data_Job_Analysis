/*
Question: What are the top skills based on salary?
-Look at the average salary associated with each skills for Data Analyst role
-Focus on roles with specified salaries, regardless of location
*/

SELECT 
    skills,
    --COUNT(skills_job_dim.job_id) AS demand_count,
    ROUND(AVG(salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE  
    job_title_short = 'Data Analyst' --AND job_location = 'Anywhere' 
    AND salary_year_avg IS NOT NULL
GROUP BY
    skills
ORDER BY
    --demand_count DESC
    avg_salary DESC
LIMIT 10
