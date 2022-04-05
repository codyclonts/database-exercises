#1
use employees; 
select * from employees;
use jemison_1745; 

CREATE TEMPORARY TABLE jemison_1745.employees_with_departments AS
SELECT first_name, last_name, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE to_date > CURDATE();

SELECT * from jemison_1745.employees_with_departments;

-- 1a
ALTER TABLE jemison_1745.employees_with_departments 
ADD full_name 
VARCHAR(100);


select database();
use jemison_1745;
use employees;
select * from jemison_1745.employees_with_departments;

-- 1b
UPDATE jemison_1745.employees_with_departments
SET full_name 
= 
CONCAT(first_name, ' ', last_name);
 
 select * from jemison_1745.employees_with_departments;

-- 1c

alter table jemison_1745.employees_with_departments
DROP COLUMN first_name, DROP COLUMN last_name;

 select * from jemison_1745.employees_with_departments;
 
 
 -- 1d
 select * from employees; 
 SELECT dept_name, concat(first_name, ' ', last_name) as full_name 
 FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
WHERE to_date > CURDATE();


-- 2

## guess work right now 

CREATE TEMPORARY TABLE jemison_1745.payment as 
SELECT *
FROM payment; 

update jemison_1745.payment 
SET amount = (amount * 100)