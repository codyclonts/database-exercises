use employees;

select * from employees;
select * from dept_emp;

#1
select hire_date 
from employees
where emp_no= '101010';


 
 
 select e.emp_no, e.hire_date, e.first_name, e.last_name
 from dept_emp as de
 join employees as e on de.emp_no= e.emp_no
 where hire_date =
 (select hire_date 
 from employees
 where emp_no= '101010');
 
 

 #2 
 select * from titles; 
 select * from employees;
 select * from dept_emp;
 
 
 
select t.title, e.first_name, e.last_name
from titles as t
join employees as e on e.emp_no= t.emp_no
join dept_emp as de on de.emp_no= t.emp_no
where first_name='Aamod' and de.to_date > CURDATE()
ORDER BY e.last_name;



SELECT e.first_name, e.last_name, t.title
FROM
    (
        SELECT *
        FROM employees as e
        WHERE first_name = 'Aamod'
    ) as e
JOIN dept_emp as de on de.emp_no= e.emp_no
JOIN titles as t on t.emp_no = e.emp_no
WHERE de.to_date > CURDATE()
ORDER BY e.last_name;



#3
select e.first_name, e.last_name, de.to_date
FROM (SELECT *
FROM dept_emp 
where to_date < CURDATE()) as de
JOIN employees as e on e.emp_no = de.emp_no;

select count(*)
from employees
where emp_no not in
	(select emp_no
    from dept_emp
    where to_date > CURDATE());


-- 59,900

select * from employees;

select * from dept_manager;
#4
SELECT CONCAT(e.first_name, ' ', e.last_name) as full_name, d.dept_name,gender
FROM (select * from employees where gender = 'F') AS e
join dept_manager as dm 
ON dm.emp_no= e.emp_no
JOIN dept_emp as de
ON de.emp_no = e.emp_no
JOIN departments AS d
on d.dept_no = de.dept_no
WHERE de.to_date > CURDATE() AND dm.to_date > CURDATE();

-- Isamu Legleitner, karsten sigstam, leon dasSarma, Hilary Kambil


-- EXAMPLE: 

Select * 
from employees 
where emp_no in (
	select emp_no
		from dept_manager
        where to_date > CURDATE())
AND gender = 'F';


select * from salaries;
#5
SELECT e.first_name, e.last_name, s.salary
FROM salaries as s
JOIN employees as e on e.emp_no = s.emp_no
WHERE salary > (SELECT AVG(salary) FROM salaries WHERE to_date > CURDATE())
AND s.to_date > CURDATE()
order by salary asc;


#6
SELECT ROUND(STDDEV(salary),2) from salaries;

SELECT salary,
    (salary - (SELECT AVG(salary) FROM salaries))
    /
    (SELECT stddev(salary) FROM salaries ) AS zscore
FROM salaries
WHERE (SELECT max(salary) from salaries AS s where s.to_date > CURDATE())



AND zscore <=1 AND zscore > 0;

-- max 158,220
SELECT max(salary) from salaries AS s where s.to_date > CURDATE();

-- 16904.82828800014

SELECT stddev(salary) FROM salaries WHERE to_date > CURDATE(); 
-- 83



SELECT COUNT(*) 
from salaries 
where to_date > CURDATE() 
and salary > (
(SELECT max(salary) from salaries AS s where s.to_date > CURDATE())
- 
(SELECT stddev(salary) FROM salaries WHERE to_date > CURDATE()));


-- 240124
select COUNT(*) from salaries where to_date > NOW();

select ((SELECT COUNT(*) 
from salaries 
where to_date > CURDATE() 
and salary > (
(SELECT max(salary) from salaries AS s where s.to_date > CURDATE()) 
- 
(SELECT stddev(salary) FROM salaries WHERE to_date > CURDATE())))
/
(select COUNT(*) from salaries where to_date > NOW())) * 100 as percentage_points;