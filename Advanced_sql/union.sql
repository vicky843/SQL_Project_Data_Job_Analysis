SELECT 
    job_title_short,
    company_id,
    job_location
From january_jobs
UNION 
SELECT 
    job_title_short,
    company_id,
    job_location
From february_jobs
UNION 
SELECT 
    job_title_short,
    company_id,
    job_location
From march_jobs


---practice--

SELECT *from job_postings_fact;

SELECT 
    job_title_short,
    company_id,
    salary_year_avg,
    job_via,
    job_location,
    job_posted_date::DATE
    
    from job_postings_fact
    Where EXTRACT (MONTH from job_posted_date) BETWEEN 1 AND 3 AND
    salary_year_avg > 70000 
    AND job_title_short= 'Data Analyst'
    ORDER BY salary_year_avg DESC;

--OR----


SELECT 
    job_location,
    job_title_short,
    job_via,
    job_posted_date::DATE,
    salary_year_avg
FROM    (SELECT *
    From january_jobs
    UNION ALL
    SELECT *
    From february_jobs
    UNION ALL
    SELECT *
    From march_jobs)
    AS quarterly_jobs
WHERE salary_year_avg >70200 
AND job_title_short ='Data Analyst'
ORDER BY salary_year_avg DESC;