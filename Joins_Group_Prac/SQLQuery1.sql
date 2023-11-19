
-- Joins
select emp.employee_id,
	   emp.employee_name,
	   dept.department_name
from   employees as emp
join   departments as dept
on     emp.department_id = dept.department_id;


select      emp.employee_id,
	        emp.employee_name,
	        dept.department_name,
	        pr.project_name
from        employees as emp
join        departments as dept
on          emp.department_id = dept.department_id
left join   projects as pr
on          pr.project_id = emp.project_id;


select      emp.employee_id,
	        emp.employee_name,
	        dept.department_name,
	        pr.project_name
from        employees as emp
left join   departments as dept
on          emp.department_id = dept.department_id
left join   projects as pr
on          pr.project_id = emp.project_id;


-- Group By

-- Find out how many employees are working on each project

Select project_id,
	   count(*) as EmpCount
From employees
Group By project_id;




-- Find total salary from each department

select department_id,
       max(salary)
from employees
group by department_id;



select      pr.project_name,
            count(*)
from        employees as emp
join        projects as pr
on          pr.project_id = emp.project_id
group by    pr.project_name;



select   dept.department_name,
         count(*)
from     employees as emp
join     departments as dept
on       emp.department_id = dept.department_id
group by dept.department_name;



select department_id,
	   project_id,
       count(*) as CountEmp
from employees
group by department_id, project_id;






