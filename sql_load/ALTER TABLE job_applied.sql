ALTER TABLE job_applied
ADD contact VARCHAR(50);

UPDATE job_applied
SET contact = 'Sai Teja'
WHERE job_id =1;

UPDATE job_applied
SET contact = 'Roma'
WHERE job_id =2;

UPDATE job_applied
SET contact = 'Dixita'
WHERE job_id =3;

UPDATE job_applied
SET contact = 'Venkat'
WHERE job_id =4;

UPDATE job_applied
SET contact = 'Devi'
WHERE job_id =5;
