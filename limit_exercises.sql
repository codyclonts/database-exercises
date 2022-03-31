use employees;
describe employees; 

select distinct last_name
from employees
ORDER BY last_name DESC
LIMIT 10;

-- 2. zykh, zyda, zwicker, zweizig, zumaque, zultner, zucker, zuberek, zschoche, zongker 


Select *
FROM employees 
Where (hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '%-12-25')
ORDER BY hire_date ASC
LIMIT 5;
-- 3. Alselm Cappello, Utz Mandell, Bouchung Schreiter, Baocai Kushner,  Petter Stroustrup

Select *
FROM employees 
Where (hire_date BETWEEN '1990-01-01' AND '1999-12-31'
AND birth_date LIKE '%-12-25')
ORDER BY hire_date ASC
LIMIT 5 OFFSET 45;

-- 4 Pranay Narwekar, Marjo Farrow, Ennio Karcich, Dines Lubachevsky,  Ipke Fontan