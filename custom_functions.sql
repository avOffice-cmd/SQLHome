--CREATE DATABASE  SqlPractice;

--======================Scalar function ================--
create function showMessage()
returns varchar(100)
as 
begin
   return 'well come achal'
end
 
-- calling function

select dbo.showMessage();


-- create function with a single parameter
create function TakeANumber(@num as int)
returns int 
as
begin
    return (@num * @num)
end

-- alter teh function
alter function TakeANumber(@num as int)
returns int 
as
begin
    return (@num * @num * @num)
end

select dbo.TakeANumber(2);

----------------------------------------
-- if u want to drop the function
----------------------------------------
drop function dbo.TakeANumber;
---------------------------------------


-- addition of two numbers
create function Addition(@num1 as int,@num2 as int)
returns int 
as
begin
    return (@num1 + @num2)
end

select dbo.Addition(2,8);
select dbo.Addition(12,8);


--  check voters
CREATE FUNCTION CheckVoterAge(@age AS INT)
RETURNS VARCHAR(100)
AS
BEGIN
    DECLARE @str VARCHAR(100)

    IF @age >= 18
    BEGIN
        SET @str = 'You are eligible to vote'
    END
    ELSE
    BEGIN
        SET @str = 'You are not eligible to vote'
    END

    RETURN @str
END


-- call the function
DECLARE @result VARCHAR(100)
SET @result = dbo.CheckVoterAge(20)
PRINT @result


--========================Inline table value function=============================--
--contain a single TSQL statement and return a table set

-- Creating the Teachers table
CREATE TABLE Teachers (
    id INT PRIMARY KEY,
    name NVARCHAR(100),
    subject NVARCHAR(50)
);

-- Inserting sample data into the Teachers table
INSERT INTO Teachers (id, name, subject)
VALUES
    (101, 'Mr. Smith', 'Mathematics'),
    (102, 'Mrs. Johnson', 'English'),
    (103, 'Ms. Davis', 'Science');

	CREATE TABLE Students (
    id INT PRIMARY KEY,
    name NVARCHAR(100),
    gender NVARCHAR(10),
    age INT,
    standard INT,
    teacherid INT,
    FOREIGN KEY (teacherid) REFERENCES Teachers(id) -- Assuming there is a Teachers table with an 'id' column
);

-- Inserting sample data into the Students table
INSERT INTO Students (id, name, gender, age, standard, teacherid)
VALUES
    (1, 'John Doe', 'Male', 18, 10, 101),  -- Assuming teacher with id 101
    (2, 'Jane Smith', 'Female', 17, 11, 102),  -- Assuming teacher with id 102
    (3, 'Bob Johnson', 'Male', 16, 9, 103);  -- Assuming teacher with id 103


	select * from Teachers;
	select * from Students;
	
	-- dbo -> means database owner 
	--or iska database owmber hai SqlPrafctice

	create function fn_GetStudents()
	returns table
	as
	return (select * from Teachers)

	select * from dbo.fn_GetStudents()
	------------------------------------------------------
	-- Creating the function
CREATE FUNCTION fn_GetStudentWithAge (@targetAge INT)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM Students
    WHERE age = @targetAge
);

-- Creating the function with validation
CREATE FUNCTION fn_GetStudentWithAge (@targetAge INT)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM Students
    WHERE age = @targetAge
        AND @targetAge > 0 -- Validation: Check if @targetAge is a positive integer
);

    -- Main logic: Retrieve students with the specified age
    RETURN
    (
        SELECT *
        FROM Students
        WHERE age = @targetAge
    );
END;

-- Example usage of the function
-- Select students with age 18
SELECT * FROM dbo.fn_GetStudentWithAge(16);
