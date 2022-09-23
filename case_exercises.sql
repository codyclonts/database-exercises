use employees;


# 1
select * from employees;
select * from dept_emp;


select emp_no, first_name, last_name, dept_no, from_date, to_date,
CASE WHEN to_date > CURDATE() then 1
else 0
END as is_current_employee
FROM employees 
join dept_emp using (emp_no);


select * from employees;
#2
select emp_no, CONCAT(first_name, ' ', last_name) as full_name,
CASE WHEN LEFT(last_name,1) BETWEEN 'a' AND 'h' THEN 'A-H'
WHEN LEFT(last_name,1) BETWEEN 'I' AND 'Q' THEN 'I-Q'
ELSE 'R-Z'
END AS alpha_group
FROM employees
ORDER BY last_name;

# 3
select * from employees;

SELECT 
COUNT(CASE WHEN birth_date BETWEEN '1950-01-01' AND '1959-12-31' then birth_date ELSE NULL END) AS '1950s',
COUNT(CASE WHEN birth_date BETWEEN '1960-01-01' AND '1969-12-31' then birth_date ELSE NULL END) AS '1960s',
COUNT(CASE WHEN birth_date BETWEEN '1970-01-01' AND '1979-12-31' then birth_date ELSE NULL END) AS '1970s',
COUNT(CASE WHEN birth_date BETWEEN '1980-01-01' AND '1989-12-31' then birth_date ELSE NULL END) AS '1980s',
COUNT(CASE WHEN birth_date BETWEEN '1990-01-01' AND '1999-12-31' then birth_date ELSE NULL END) AS '1990s'
from employees;

## example
SELECT CONCAT(SUBSTR(birth_date, 1, 3), '0') as decade,
COUNT(*)
FROM employees
GROUP BY decade;

#4

SELECT 
CASE WHEN d.dept_name IN ('Reasearch', 'Development') THEN 'Research & Development'
WHEN d.dept_name IN ('Sales', 'Marketing') THEN 'Sales & Marketing'
WHEN d.dept_name IN ('Production', 'Quality Management') THEN 'Product & Quality Management' 
WHEN d.dept_name IN ('Finance' , 'Human Resouces' ) THEN 'Finance & HR'
ELSE d.dept_name
END AS dept_group, 
AVG(s.salary) as avg_salary
from departments as d
join dept_emp as de using (dept_no)
join salaries s using (emp_no)
WHERE s.to_date > CURDATE() AND de.to_date > CURDATE()
GROUP BY dept_group;
