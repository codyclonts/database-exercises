USE join_example_db;

select * from users;


#1


select *
from users as u
join roles as r ON u.role_id= r.id;

#2
SELECT *
FROM users as u
LEFT JOIN roles as r ON u.role_id = r.id;

SELECT *
FROM users as u
RIGHT JOIN roles as r ON u.role_id = r.id;

#3

SELECT  role_id, COUNT(role_id) as count_role_id
FROM users as u
LEFT JOIN roles as r ON u.role_id=r.id
GROUP BY role_id;


## Employees database

#1

USE employees;

select * from dept_emp;
select * from employees;
SELECT * FROM dept_manager;
SELECT * FROM departments;
SELECT * FROM titles;

#2

SELECT CONCAT(e.first_name, ' ', e.last_name) as full_name, d.dept_name
FROM employees AS e
join dept_manager as dm 
ON dm.emp_no= e.emp_no
JOIN dept_emp as de
ON de.emp_no = e.emp_no
JOIN departments AS d
on d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND dm.to_date = '9999-01-01';

#3
SELECT CONCAT(e.first_name, ' ', e.last_name) as full_name, d.dept_name,gender
FROM employees AS e
join dept_manager as dm 
ON dm.emp_no= e.emp_no
JOIN dept_emp as de
ON de.emp_no = e.emp_no
JOIN departments AS d
on d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND dm.to_date = '9999-01-01' AND gender = 'F';

#4
select * from dept_emp;
select * from employees;
SELECT * FROM departments;
SELECT * FROM titles;

SELECT t.title , count(t.title)
FROM employees AS e
JOIN titles AS t
on t.emp_no=e.emp_no
JOIN dept_emp as de
ON de.emp_no = e.emp_no
JOIN departments AS d
on d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND t.to_date= '9999-01-01' and dept_name= 'Customer Service'
GROUP BY title;

#5

select * from salaries;

SELECT CONCAT(e.first_name, ' ', e.last_name) as full_name, d.dept_name, salary
FROM employees AS e
join dept_manager as dm 
ON dm.emp_no= e.emp_no
JOIN dept_emp as de
ON de.emp_no = e.emp_no
JOIN departments AS d
on d.dept_no = de.dept_no
Join salaries as s
on s.emp_no = e.emp_no
WHERE de.to_date = '9999-01-01' AND dm.to_date = '9999-01-01' and s.to_date = '9999-01-01'
order by dept_name ASC;

#6
select * from dept_emp;
select * from employees;
SELECT * FROM departments;
SELECT * FROM titles;

SELECT count(de.dept_no) as num_employees, dept_name, d.dept_no
FROM dept_emp as de
JOIN departments as d
on d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01'
group by d.dept_no
ORDER BY dept_no ASC;


#7
select * from salaries;

SELECT dept_name, ROUND(AVG(salary)) as average_salary
FROM salaries as s
join dept_emp as de 
on s.emp_no = de.emp_no
join departments as d
on d.dept_no = de.dept_no
WHERE de.to_date = '9999-01-01' AND s.to_date = '9999-01-01'
group by d.dept_name
ORDER BY average_salary DESC
LIMIT 1;

#8

SELECT e.first_name, e.last_name
FROM employees AS e
join salaries as s
on e.emp_no = s.emp_no
join dept_emp as de
on e.emp_no = de.emp_no
join departments as d
on de.dept_no = d.dept_no
WHERE de.to_date > CURDATE() AND s.to_date >CURDATE() and d.dept_name = 'marketing'
ORDER BY s.salary DESC
LIMIT 1;


#9
select e.first_name, e.last_name, s.salary, d.dept_name
FROM employees AS e
join dept_manager AS dm 
on e.emp_no = dm.emp_no
Join salaries as s on e.emp_no = s.emp_no
join departments as d using (dept_no)
WHERE s.to_date > CURDATE() and dm.to_date > CURDATE()
ORDER BY s.salary DESC
limit 1;

#10
SELECT d.dept_name, ROUND(AVG(s.salary) , 0) AS avg_dept_salary
FROM departments d
JOIN dept_emp de on d.dept_no= de.dept_no
join employees e on e.emp_no = de.emp_no
join salaries s on e.emp_no = s.emp_no
group by d.dept_name
order by avg_dept_salary DESC;
