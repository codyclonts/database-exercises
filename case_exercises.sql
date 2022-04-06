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
COUNT(CASE WHEN birth_date BETWEEN '1950' AND '1959' then birth_date ELSE NULL END) AS '1950s'
END AS decade_count
from employees;


