use employees; 

#2

select distinct title
from titles;
-- there have been 7 unique titles


#3
Select last_name, COUNT(last_name)
from employees
where last_name LIKE 'E%E'
GROUP BY last_name;

#4
Select first_name,last_name
from employees
where last_name LIKE 'E%E'
GROUP BY first_name, last_name;

#5
Select last_name
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE ('%qu%')
GROUP BY last_name;

-- Chleq, Lindqvist, Qiwen

#6
Select COUNT(last_name) as number_of_employees, last_name
FROM employees
WHERE last_name LIKE '%q%'
AND last_name NOT LIKE ('%qu%')
GROUP BY last_name;


#7

SELECT COUNT(*),gender
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
GROUP BY gender;

#8
select lower(concat(substr(first_name,1,1), 
substr(last_name,1,4), 
'_', 
substr(birth_date,6,2), 
substr(birth_date,3,2))) as username, count(*) as count_of_users
from employees
group by username
having count_of_users > 1;



