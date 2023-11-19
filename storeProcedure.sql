select * from Employee;
select * from Department;

drop table Employee;
CREATE TABLE Employee (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    birthdate DATE,
	gender CHAR(1),
    hire_date DATE,
    department_id INT,
    salary DECIMAL(10, 2),
    CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

-- Insert departments
INSERT INTO Department (department_id, department_name)
VALUES
    (1, 'Human Resources'),
    (2, 'Engineering'),
    (3, 'Marketing');

-- Insert employees
-- Insert values into the Employee table
INSERT INTO Employee (employee_id, first_name, last_name, birthdate, gender, hire_date, department_id, salary)
VALUES
    (1, 'John', 'Doe', '1990-01-15', 'M', '2020-03-01', 1, 60000.00),
    (2, 'Jane', 'Smith', '1985-05-22', 'F', '2019-07-15', 2, 75000.00),
    (3, 'Michael', 'Johnson', '1993-09-10', 'M', '2021-02-10', 2, 80000.00),
    (4, 'Emily', 'Davis', '1988-12-03', 'F', '2018-04-05', 3, 70000.00);


--------------------------------------------------------------------------------------------

	-- store procedure
create procedure spGetEmployees
as
begin
select first_name,last_name from Employee;
end

spGetEmployees;
-
-------------------------------------------------------------------------------------

-- using parameter
-- Create a stored procedure
CREATE PROCEDURE GetEmployeeDetails
    @employee_id INT
AS
BEGIN
    SELECT
        employee_id,
        first_name,
        last_name,
        salary
    FROM
        Employee
    WHERE
        employee_id = @employee_id;
END;

--EXEC -> [Execute] the stored procedure with a specific employee_id
EXEC GetEmployeeDetails @employee_id = 1;


--------------------------------------------------------------------------------------------

create procedure GetEmployeeByIdAndName
@id int,
@name varchar(100)
as
begin

select * from Employee where employee_id = @id
and first_name = @name;
end

-- alter
-- Corrected stored procedure
ALTER PROCEDURE GetEmployeeByIdAndName
    @id INT,
    @name VARCHAR(100)
	--with encryption
AS
BEGIN
    SELECT first_name,
			salary
	FROM    Employee 
	WHERE employee_id = @id AND first_name = @name;
END;

EXEC GetEmployeeByIdAndName @id = 2,
							@name = 'jane';
select * from Employee;

--> see how u create sp
sp_helptext GetEmployeeByIdAndName;
-----------------------------------------------------------------------------------------------
-- SP taking multiple parameters
-- Create a stored procedure with multiple parameters
CREATE PROCEDURE GetEmployeeDetailsByIdAndDepartment
    @employee_id INT,
    @department_id INT
AS
BEGIN
    SELECT
        employee_id,
        first_name,
        last_name,
        birthdate,
        hire_date,
        department_id,
        salary
    FROM
        Employee
    WHERE
        employee_id = @employee_id
        AND department_id = @department_id;
END;

-- calling
-- Execute the stored procedure with specific values
EXEC GetEmployeeDetailsByIdAndDepartment
    @employee_id = 1,
    @department_id = 2;

		-- Drop a stored procedure
DROP PROCEDURE IF EXISTS GetEmployeeDetailsByIdAndDepartment;
----------------------------------------------------------------------------------------------


-- out put
create proc spGetEmployeeByGender
@Gender varchar(50),
@EmployeeCount int Output
as
begin
select @EmployeeCount = Count(employee_id) from Employee
where gender = @Gender
end

-- Declare variables to hold the output
DECLARE @EmployeeCountResult INT;

-- Execute the stored procedure
EXEC spGetEmployeeByGender @Gender = 'M', @EmployeeCount = @EmployeeCountResult OUTPUT;

-- Display the result
SELECT @EmployeeCountResult AS EmployeeCount;

