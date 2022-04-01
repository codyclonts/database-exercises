USE employees;
Describe employees;

Select count(*)
FROM employees 
WHERE first_name IN ('Irena', 'Vidya', 'Maya');
-- 2. 709  employees

Select COUNT(*)
FROM employees 
WHERE first_name ='Irena'
OR first_name ='Vidya'
OR first_name= 'Maya';

-- 3. 709 employees

Select COUNT(*)
FROM employees 
WHERE gender = 'M' 
AND (first_name ='Irena'
OR first_name ='Vidya'
OR first_name= 'Maya');
-- 4. 441 employees

Select COUNT(*)
From employees
WHERE last_name LIKE 'E%';

-- 5. 7330 last names start with E

Select COUNT(*)
FROM employees 
Where last_name LIKE 'E%'
OR last_name LIKE '%E';

Select count(*)
From employees
WHERE last_name LIKE '%E'
AND NOT last_name LIKE 'E%';
-- 6. 30723 last names end with e.  23393 last names end in E but do not start with E



Select count(*) 
from employees
where last_name LIKE 'E%E';

-- 7.  899 DISTINCT last names that start and end with E

table employees;

Select Count(*)
FROM employees 
Where hire_date BETWEEN '1990-01-01' AND '1999-12-31';

Select Count(*)
FROM employees 
Where hire_date LIKE '199%';
-- 8. 135214 hire dates in the 1990s 
 
Select COUNT(*)
FROM employees
WHERE birth_date LIKE '%-12-25';
-- 9. 842 Birth dates of december 25

Select Count(*)
FROM employees 
Where (hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '%-12-25');
-- 10. 362 employees

 
Select COUNT(*)
From employees 
WHERE last_name LIKE '%q%';

-- 11. 1873 employees 

Select COUNT(*)
From employees 
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE ('%qu%');
 -- 12. 547  EMPLOYEES
 
# ORDER_BY
  
 Use employees;
 
 Select first_name, last_name
 From employees
 WHERE first_name IN ('Irena', 'Vidya', 'Maya')
 ORDER BY first_name ASC;
 -- 2. The first name in my table was Irena Reutenauer and the last name was Vidya Simmen
 
 Select first_name, last_name
 From employees
 WHERE first_name IN ('Irena', 'Vidya', 'Maya')
 ORDER BY first_name ASC, last_name ASC;

-- 3. The first name in the table wasa Irena Acton and the last name in the table was Vidya Zweizig 

Select last_name, first_name
 From employees
 WHERE first_name IN ('Irena', 'Vidya', 'Maya')
 ORDER BY last_name ASC, first_name ASC;

-- 4. the first name in my table was Irena Acton and the last name in my table was Maya Zyda 

describe employees;

Select emp_no, first_name, last_name 
from employees
where last_name LIKE 'E%E'
ORDER BY emp_no;

-- 5. 899 employees returned. the first employee was Ranzu Erde employee number 10021. The last employee was Tadahiro Erde employee number 499648.

Select * 
from employees
where last_name LIKE 'E%E'
ORDER BY hire_date DESC;
 
 -- 6. 899 employees returned. The newest employee is Teiji Eldridge and the oldest employee is Sergi Erde. 
 
 Select *
FROM employees 
Where (hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '%-12-25')
ORDER BY birth_date asc, hire_date DESC;

-- 7. 362 employees returned. oldest employee hired last was Khun Bernini. Youngest employee hired first was Douadi Pettis 
 
 
 
 
 
 ## Functions exercises 
 USE employees;
 Describe employees; 
 
 
 #2
 Select Concat(first_name, ' ', last_name) as full_name
from employees
where last_name LIKE 'E%E';

#3
select Concat(first_name, ' ', last_name) as full_name
from employees
where last_name LIKE 'E%E'
Upper(full_name);

SELECT UPPER(CONCAT(first_name, ' ', last_name)) full_name
FROM employees
WHERE last_name LIKE 'E%E';

#4
 Select Datediff(curdate(),hire_date)
FROM employees 
Where (hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '%-12-25');

#5
use employees;
describe salaries;

select min(salary), max(salary)
from salaries;

-- min 38623, max 158220

#6

select lower(concat(substr(first_name,1,1), substr(last_name,1,4), '_', substr(birth_date,6,2), substr(birth_date,3,2))) as username
from employees;
