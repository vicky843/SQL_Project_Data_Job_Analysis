create table job_applied(
    job_id INT,
    application_sent_date DATE,
    Custome_resume BOOLEAN,
    resume_file_name VARCHAR(255),
    cover_letter_sent BOOLEAN,
    cover_letter_file_name VARCHAR(255),
    status VARCHAR(50)
    );

    select *from job_applied;