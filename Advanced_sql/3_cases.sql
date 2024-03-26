-- January
CREATE TABLE january_jobs AS
SELECT *
FROM job_postings_fact 
WHERE EXTRACT(MONTH FROM job_posted_date) = 1;

-- February
CREATE TABLE february_jobs AS
SELECT *
FROM job_postings_fact 
WHERE EXTRACT(MONTH FROM job_posted_date) = 2;

-- March
CREATE TABLE march_jobs AS
SELECT *
FROM job_postings_fact 
WHERE EXTRACT(MONTH FROM job_posted_date) = 3;

-- April
CREATE TABLE april_jobs AS
SELECT *
FROM job_postings_fact 
WHERE EXTRACT(MONTH FROM job_posted_date) = 4;

-- Continue creating tables for the remaining months...
SELECT 
job_location,
job_title_short,
CASE 
WHEN job_location = 'Anywhere' THEN 'REMOTE'
WHEN job_location = 'New York' THEN 'LOCAL'
ELSE 'ONSITE'
END AS Location
    from job_postings_fact;


SELECT 
count(job_id) AS total_jobs,
CASE 
WHEN job_location = 'Anywhere' THEN 'REMOTE'
WHEN job_location = 'New York, NY' THEN 'LOCAL'
ELSE 'ONSITE'
END AS Location
    from job_postings_fact
    WHERE job_title_short = 'Data Analyst'
    GROUP BY 
    LOCATION;

select 
jobs.job_id,
jobs.company_id,
    companies.company_id,
    companies.name,
    count(*)
        from job_postings_fact as jobs
        LEFT JOIN company_dim AS companies
ON jobs.company_id =companies.company_id
;

WITH company_job_count AS(
SELECT company_id,
count(*) as total_jobs
from 
job_postings_fact GROUP BY company_id)

SELECT company_dim.name,
company_job_count.total_jobs AS company_dim
from company_dim
LEFT JOIN company_job_count 
ON company_job_count.company_id =company_dim.company_id
ORDER BY total_jobs desc;