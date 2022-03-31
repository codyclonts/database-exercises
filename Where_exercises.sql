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