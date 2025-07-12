create schema medical_history;
alter table admission rename column attending_doctor_id to doctor_id;
select * from admission;
select * from doctors;
select * from patients;
select * from province_name;
desc patients;

-- Question 01 --
select first_name,last_name,gender
from patients where gender='M';

-- Question 02 --
select first_name,last_name,allergies
from patients where allergies is null;

-- Question 03 --
select first_name from patients
where first_name like 'C%';

-- Question 04 --
select first_name,last_name,weight
from patients where weight between 100 and 120;

set sql_safe_updates = 0;
-- Question 05 --
update patients
set allergies = "NKA"
where allergies IS NULL;

-- Question 06 --
select Concat(first_name,'',last_name)
as full_name from patients;

-- Question 07 --
SELECT p.first_name,p.last_name,pr.province_name
from patients as p join province_name as pr on 
p.province_id = pr.province_id;

-- Question 08 --
select count(*) as total_patients_2010
from patients where year(birth_date) = 2010;

-- Question 09 --
select first_name,last_name,height
from patients order by height desc limit 1;

-- Question 10 -- 
select * from patients
where patient_id in (1,45,534,879,1000);

-- Question 11 --
select count(*) as total_admission
from admission;

-- Question 12 --
select admission_date,discharge_date
from admission where admission_date = discharge_date;

-- Question 13 -- 
select count(*) as total_admission
from admission where patient_id ="579";

-- Question 14 --
select distinct city
from patients where province_id = "NS";

-- Question 15 --
select first_name,last_name,birth_date
from patients where height > 160 and weight >70;

-- Question 16 -- 
select distinct year(birth_date) as 
birth_year from patients order by birth_year asc;

-- Question 17 --
select first_name from patients
group by first_name having count(*)=1;

-- Question 18 --
select patient_id,first_name
from patients where first_name like "s%" and first_name like "%s"
and length(first_name)=6;

-- Question 19 --
select p.patient_id,p.first_name,p.last_name
from patients p join admission a on p.patient_id = a.patient_id
where a.diagnosis = "Dementia";

-- Question 20 -- 
select first_name 
from patients order by length(first_name),first_name;

-- Question 21 --
select 
count(case when gender = "M" Then 1 end) as male_count,
count(case when gender = "F" Then 1 end) as female_count
from patients;

-- Question 22 --
select
count(case when gender = "M" then 1 end) as male_count,
count(case when gender = "F" then 1 end) as female_count
from patients;

-- Question 23 --
select patient_id,diagnosis
from admission group by patient_id,diagnosis
having count(*) > 1;

-- Question 24 --
select city, count(*) as total_patient
from patients group by city
order by total_patient desc,city asc;

-- Question 25 --
select first_name,last_name,'patient' as 
role from patients
union
select first_name,last_name,'doctor' as
role from doctors;

-- Question 26 --
select allergies,count(*) as frequency
from patients
where allergies is not null
group by allergies
order by frequency desc;

-- Question 27 --
select first_name,last_name,birth_date
from patients where birth_date between
"1970-01-01" and "1979-12-31"
order by birth_date asc;

-- Question 28 --
select 
concat(UPPER(last_name),',',
LOWER(first_name)) AS full_name
from patients
order by first_name desc;

-- Question 29 --
select province_id,sum(height) as total_height
from patients
group by province_id
having sum(height) >= 7000;

-- Question 30 --
select max(weight) - min(weight) as
weight_difference from patients
where last_name = "Maroni";

-- Question 31 --
select day(admission_date) as day_of_month,
count(*) as admission_count
from admission
group by day_of_month
order by admission_count desc;

-- Question 32 --
select 
floor(weight/10)*10 as weight_group,
count(*) as total_patients
from patients
group by weight_group
order by weight_group desc;

-- Question 33 --
select patient_id,
weight,height,
case
when weight/power(height/100.0,2) >= 30 then 1
else 0
end as isObese from patients;

-- Question 34 --
SELECT p.patient_id, p.first_name, p.last_name, d.specialty
FROM patients p
JOIN admission a ON p.patient_id = a.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id
WHERE a.diagnosis = 'Epilepsy' AND d.first_name = 'Lisa';

-- Question 35 --
SELECT 
  patient_id,
  CONCAT(patient_id, LENGTH(last_name)) AS temp_password
FROM patients
WHERE patient_id IN (SELECT DISTINCT patient_id FROM admission);






