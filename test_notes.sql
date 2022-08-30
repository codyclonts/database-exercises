use employees; 

select * from employees; 
select * from departments; 
select * from dept_emp;




select e.first_name, count(*)
FROM employees as e
join dept_emp as de on de.emp_no= e.emp_no
join departments as d on d.dept_no=de.dept_no
GROUP BY d.dept_name;




# 15
select c.firstname, c.lastname, p.prod_desc
from customers as c
right join current_products as p
on p.prod_id=c.prod_id; 

use numbers;

select * from numbers2;


# 17 
select avg(n), min(n), max(n), sum(n), stddev(n) from numbers;

#18
select
