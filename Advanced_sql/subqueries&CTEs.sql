----CTE 
WITH january_jobs AS (
    SELECT *
    from job_postings_fact
WHERE 
EXTRACT(MONTH FROM job_posted_date)=1)
SELECT *from january_jobs;

--Subqueries--

select 
    company_id,
    name AS company_name
    FROM company_dim
    Where company_id IN(
        SELECT company_id from 
        job_postings_fact
        Where job_no_degree_mention =true
    ORDER BY company_id
    ); 
