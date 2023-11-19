-- drop table tempEmployee

-- select into 
-- (creates a table and then adds data from original table)
-- (columns in the new table have same schema)
Select *
into tempEmployee
from Employee
where isActive = 1;

select * from tempEmployee;




-- insert into select
-- (copies data from source table to target table)
-- (columns in the new table can have different schema)
Create Table tempEmployee2
(
	EmployeeID INT,
	FullName varchar(100)
);
select * from tempEmployee2;


Insert Into tempEmployee2(EmployeeID, FullName)
Select EmployeeId,
	   concat(FirstName, ' ', LastName)
from Employee;




------------------------------------------------------------------------------------------------------------------------
-- Update salary of Employees having finance deparment

select * from tempEmployee
select * from Employee

-- USING TEMP TABLE
Select emp.EmployeeID,
	   --emp.FirstName,
	   --emp.LastName,
	   --dept.DepartmentName
Into   tempEmployee
From   Employee as emp
Join   Department as dept
On     emp.DepartmentID = dept.DepartmentID
Where  dept.DepartmentName = 'Finance';


update Employee
set Salary = Salary + 100
where EmployeeID in (select EmployeeID from tempEmployee);



-- USING CTE
With updateEmployeeCTE AS
(
	Select emp.EmployeeID,
		   emp.FirstName,
		   emp.LastName,
		   dept.DepartmentName
	From   Employee as emp
	Join   Department as dept
	On     emp.DepartmentID = dept.DepartmentID
	Where  dept.DepartmentName = 'Finance'
)
update Employee
set Salary = Salary + 100
where EmployeeID in (select EmployeeID from updateEmployeeCTE);



-- USING VIEW
Create View vw_UpdateFinanceEmployee
As
Select  emp.EmployeeID,
		emp.FirstName,
		emp.LastName,
		emp.Salary,
		dept.DepartmentName
From   Employee as emp
Join   Department as dept
On     emp.DepartmentID = dept.DepartmentID
--Where  dept.DepartmentName = 'Marketing'

update vw_UpdateFinanceEmployee
set Salary = Salary + 100
where DepartmentName = 'Marketing'


select * from Employee
select * from Department

--===============================================--
-- Create View vw_UpdateFinanceEmployee
CREATE VIEW vw_UpdateFinanceEmployee
AS
SELECT
    emp.EmployeeID,
    emp.FirstName,
    emp.LastName,
    emp.Salary,
    dept.DepartmentName
FROM
    Employee AS emp
JOIN
    Department AS dept ON emp.DepartmentID = dept.DepartmentID
WHERE
    dept.DepartmentName = 'Marketing';

	-- Update salaries for employees in the 'Marketing' department
UPDATE Employee
SET Salary = Salary + 100
WHERE EmployeeID IN (
    SELECT EmployeeID
    FROM vw_UpdateFinanceEmployee
);

-- Verify the changes
SELECT * FROM Employee;
SELECT * FROM Department;


--- USING SUBQUERY --

update Employee
set Salary = Salary + 100
where EmployeeID in (Select emp.EmployeeID
					 From   Employee as emp
					 Join   Department as dept
					 On     emp.DepartmentID = dept.DepartmentID
					 Where  dept.DepartmentName = 'Finance');





----------------------------------------------------------------------------------------------------------------------------------
select * from Employee
select * from Department;

-- Delete employees having IT department

-- with the help of temp Table
select    emp.EmployeeID,
          emp.FirstName ,
		  dept.DepartmentName 
into      tempEmployeeDelete
from      Employee as emp
join      Department as dept
on        emp.DepartmentID = dept.DepartmentID
where     dept.DepartmentName = 'IT';

select * from tempEmployeeDelete; -- 1/7/13

delete from Employee
--Where EmployeeID in(1,7,13)
Where EmployeeID IN (select EmployeeID from tempEmployeeDelete);  


-- with the help of CTE
with DeleteFinanceEmployeesCTE
as
(
	select   emp.EmployeeID, 
				emp.FirstName ,
				dept.DepartmentName 
	from     Employee as emp
	join     Department as dept
	on       emp.DepartmentID = dept.DepartmentID
	where    dept.DepartmentName = 'Finance'
)
delete from Employee
Where EmployeeID in(select EmployeeID from DeleteFinanceEmployeesCTE); 


-------------------------------------------------------------
-- Display the employees whose fullname is less than 13 letters
With CheckFullNameLength_CTE AS
(
	select EmployeeID,
		   concat(FirstName, ' ', LastName) as FullName
	from   Employee 
)
Select * 
from  CheckFullNameLength_CTE
where  Len(FullName) < 13;


------------------------------------------------------------
-- Update the email of the employee who has the maximum salary
with checkMaximumSalary_CTE
As
(
	select 
		   Max(salary) as MaximumSalary
	from   Employee
)
--select *
--from Employee
--where Salary = (Select MaximumSalary from checkMaximumSalary_CTE);
update Employee
set Email = 'abc@123gmail.com'
where Salary = (Select MaximumSalary from checkMaximumSalary_CTE);

select * from Employee;

