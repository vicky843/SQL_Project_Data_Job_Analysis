
-- SELECT *FROM job_postings_fact LIMIT 100;

SELECT job_title_short AS job_role,
    job_posted_date AS date_time,
    job_location AS location,
    EXTRACT(MONTH FROM job_posted_date ) AS month
    FROM job_postings_fact
    LIMIT 10;

SELECT COUNT(job_id) as job_post_count,
        EXTRACT(MONTH from job_posted_date) AS month
    FROM job_postings_fact
    WHERE job_title_short ='Data Analyst'
    GROUP BY month
    ORDER BY job_post_count;


