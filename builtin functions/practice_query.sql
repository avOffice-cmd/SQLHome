-- functions
select * from employee;



-- Logical functions:
select emp_name,
	   emp_gender,
	   iif(emp_gender = 'M', 'Better', 'Good') as Remarks
from employee;



select emp_name,
	   iif(LEN(emp_name) < 10, 'Less', 'More' ) as Remarks
from employee;

-- same as above
select emp_name,
	   CASE
		   WHEN LEN(emp_name) < 10 THEN 'Less'
	   ELSE 'More'
	   END as Remarks
from employee;


-- case
select emp_name,
	   CASE
		   WHEN emp_salary < 50000 THEN 'Less'
		   WHEN emp_salary BETWEEN 50000 AND 60000 THEN 'thik thak'
		   WHEN emp_salary > 60000 THEN 'More'
	   ELSE 'No salary'
	   END as Remarks
from employee;

-- handling null conditions using ISNULL
-- ISNULL, COALESCE: Return a specified value if an expression is NULL.
select     employee.emp_name,
		   ISNull(department_name, 'No department') as department_name
from       employee
left join  department
on		   employee.department_id = department.department_id

-- handling null conditions using iif
select emp_name,
	  iif(department_name is null , 'no department', department_name) as department_name
from employee
left join  department
on employee.department_id = department.department_id;


-- COALESCE: Returns the first non null value
-- COALESCE(phoneNum1, phoneNum2, phoneNum3, 'No phone number')

