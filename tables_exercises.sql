use employees;
-- 3.     use employees;  
show tables;
-- 4.       show tables;
select * FROM employees;
-- 5. date, int, CHAR

show tables;
-- 6. dept_emp, dept_manager, employees, salaries 
-- 7. departments, dept_emp, dept_manager, employees, titles
-- 8. dept_emp, dept_manager, employees, salaries, titles
-- 9. these tables share no columns
-- 10. -- 'CREATE TABLE `dept_manager` (
--   `emp_no` int NOT NULL,
--   `dept_no` char(4) NOT NULL,
--   `from_date` date NOT NULL,
--   `to_date` date NOT NULL,
--   PRIMARY KEY (`emp_no`,`dept_no`),
--   KEY `dept_no` (`dept_no`),
--   CONSTRAINT `dept_manager_ibfk_1` FOREIGN KEY (`emp_no`) REFERENCES `employees` (`emp_no`) ON DELETE CASCADE ON UPDATE RESTRICT,
--   CONSTRAINT `dept_manager_ibfk_2` FOREIGN KEY (`dept_no`) REFERENCES `departments` (`dept_no`) ON DELETE CASCADE ON UPDATE RESTRICT
-- ) ENGINE=InnoDB DEFAULT CHARSET=latin1'
SHOW CREATE TABLE dept_manager;
  
