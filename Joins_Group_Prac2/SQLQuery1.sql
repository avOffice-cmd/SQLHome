select 
count(*)
from employee;

-- group according to their department
select   department_id,
         count(*) as emp_Count
from     employee 
group by department_id;

-- group according to their gender
select   emp_gender,
         count(*) as emp_Count
from     employee
group by emp_gender;


-- count male and female in every department
select   department_id,
	     emp_gender,
	     count(*) as EmpCount
from     employee
group by department_id, emp_gender;


-- simple joining department and employee
select   dept.department_name,
	     emp.emp_name
from     employee as emp
join     department as dept
on       emp.department_id = dept.department_id;


-- counting employees in every department using deparment name
select    dept.department_name,
          count (*) as emp_Count
from      employee as emp
join      department as dept
on        emp.department_id = dept.department_id
group by  dept.department_name;



-- counting male and female employees in every department using deparment name
select    dept.department_name,
          emp.emp_gender,
          count(*) as emp_count
from      employee as emp
join      department as dept
on        emp.department_id = dept.department_id
group by  dept.department_name, emp.emp_gender
order by  dept.department_name;



-- finding max salary of male and female employee in every department 
select    dept.department_name,
          emp.emp_gender,
          max(emp.emp_salary) as Max_Salary
from      employee as emp
join      department as dept
on        emp.department_id = dept.department_id
group by  dept.department_name, emp.emp_gender;


