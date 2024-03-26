---Solution 1----
SELECT 
    AVG(salary_hour_avg) AS Hourly_salary,
    AVG(salary_year_avg) AS Yearly_salary,
    job_posted_date::DATE AS Monthly,
    job_schedule_type
    FROM 
    job_postings_fact
    WHERE job_posted_date > '2023-06-01'
    GROUP BY job_schedule_type;

---Solution2----
SELECT COUNT(job_id) as job_post_count,
    EXTRACT(MONTH from (job_posted_date AT TIME ZONE 'UTC' AT TIME ZONE 'EST')::DATE) AS MONTHLY 
    FROM 
        job_postings_fact
        GROUP BY MONTHLY
        ORDER BY job_post_count;

SELECT COUNT(job_id) as job_post_count,
        EXTRACT(MONTH from job_posted_date) AS month

FROM 
    job_postings_fact
        GROUP BY month
    ORDER BY job_post_count;
;
---Solution3----
SELECT 
job.job_health_insurance as Insurance_Providing,
companies.name
FROM 
    job_postings_fact as job
    LEFT JOIN company_dim as companies
    ON job.company_id = companies.company_id
    WHERE job_posted_date::DATE BETWEEN '2023-04-01 00:00:00' AND '2023-06-30 23:59:59' 
    ;
    ---OR---

SELECT 
job.job_health_insurance as Insurance_Providing,
companies.name
FROM 
    job_postings_fact as job
    LEFT JOIN company_dim as companies
    ON job.company_id = companies.company_id
    WHERE EXTRACT(MONTH FROM job_posted_date) BETWEEN 4 AND 6
    ;


    ---Bucketing/Case statements---
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

    select salary_year_avg,
    CASE
    WHEN salary_year_avg <75000 THEN 'Low_salary'
    WHEN salary_year_avg >140000 THEN 'High_salary'
    ELSE 'Standard'
    END AS Salary_Range 
    from job_postings_fact
    WHERE salary_year_avg IS NOT NULL AND 
    job_title_short = 'Data Analyst'
    ORDER by salary_year_avg desc;

    ----Practice7---
WITH Remote_jobs AS(
  SELECT skill_id,
Count(*) AS skill_count
FROM Skills_job_dim As skills_to_job  
INNER JOIN job_postings_fact As job_post
    ON job_post.job_id = skills_to_job.job_id
WHERE job_post.job_work_from_home = True AND 
    job_post.job_title_short ='Data Analyst'
    GROUP BY skill_id)
SELECT
        skills.skill_id,
        skills AS skill_name,
        skill_count 
    from 
    Remote_jobs
         INNER JOIN skills_dim AS skills ON skills.skill_id = Remote_jobs.skill_id
         ORDER BY skill_count desc LIMIT 5;


---Union--
