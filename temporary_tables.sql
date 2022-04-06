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
VARCHAR(31);


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
use jemison_1745;
select tables;


CREATE TEMPORARY TABLE payments as 
SELECT *
FROM sakila.payment; 


select * from payments;

alter table payments add amount_in_pennies INT(255);

UPDATE payments set amount_in_pennies = (amount * 100);

select * from payments;
-- 3 


create temporary table jemison_1745.current_avg_dept_pay as 
SELECT d.dept_name, ROUND(AVG(s.salary) , 0) AS avg_dept_salary
FROM departments d
JOIN dept_emp de on d.dept_no= de.dept_no
join employees e on e.emp_no = de.emp_no
join salaries s on e.emp_no = s.emp_no
WHERE s.to_date > NOW()
group by d.dept_name 
order by avg_dept_salary DESC;


USE jemison_1745;

select * from current_avg_dept_pay;
(select stddev(salary) from employees.salaries);

 #zscore
 select ((avg_dept_salary - 63810) / 16904) as zscore from current_avg_dept_pay;
 
 select *, 
 ((avg_dept_salary 
 - 
 (select avg(salary) 
 from employees.salaries)) 
 / 
 (select stddev(salary)
 from employees.salaries))
 as zscore
 from current_avg_dept_pay
 order by zscore desc;
 
 -- sales is the best department to work in 
 





