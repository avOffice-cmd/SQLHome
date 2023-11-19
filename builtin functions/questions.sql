-- Display the hired year for every employee

SELECT  employee_id,
        employee_name,
        hire_date,
        YEAR(hire_date) AS HiredYear
FROM    employees;


-- Display the experience in years of every employee

SELECT  employee_id,
        employee_name,
        DATEDIFF(YEAR, hire_date, GETDATE())
		AS ExperienceInYears
FROM    employees;

select * from employees;
select * from projects;


-- Display how many months have taken for every project completion
SELECT  project_id,
        project_name,
		DATEDIFF(MONTH, project_start_date , project_end_date )
		AS monthstakenforcomplition
FROM    projects;



-- Display the ongoing projects

SELECT  project_id,
        project_name,
		DATEDIFF(DAY, GETDATE(), project_end_date) AS DaysLeft
FROM    projects
WHERE   project_end_date > GETDATE();



-- Display which projects are completing in the next month

SELECT  project_id,
        project_name,
        DATEDIFF(DAY, GETDATE(), project_end_date) AS DaysLeft
FROM    projects
WHERE   project_end_date BETWEEN GETDATE() AND DATEADD(MONTH, 1, GETDATE());



-- Display the last project that has been completed

SELECT   TOP 1
         project_id,
         project_name,
         project_start_date,
         project_end_date
FROM     projects
WHERE    project_end_date IS NOT NULL
         AND project_end_date <= GETDATE()
ORDER BY project_end_date DESC;

select * from projects;




-- Display the experience in years of every employee
-- (if years is 0 then show the months of experience)
Select employee_name,
	   Case
	   	   When DateDiff(Year, hire_date, getDate()) = 0
	   		    Then concat(DateDiff(Month, hire_date, getDate()), ' ', 'Months' )
	   Else concat(DateDiff(Year, hire_date, getDate()), ' ', 'Years')
	   End as Experience
from employees

select * from employees;
select * from projects;