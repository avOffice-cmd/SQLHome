-- SQL FUNCTIONS
select * from Employees;


-- 1. String functions
SELECT LEN('Hello, World'); -- Returns 12
SELECT CONCAT('Hello', ', ', 'World'); -- Returns 'Hello, World'
SELECT SUBSTRING('Hello, World', 7, 5); -- Returns 'World'
SELECT CHARINDEX('World', 'Hello, World'); -- Returns 7


-- 2. Aggregate Functions:
-- SUM, AVG, MIN, MAX, COUNT: Perform aggregate calculations on data in a table.


-- 3. Conversion Functions:
SELECT CAST('42' AS INT); -- Converts a string to an integer

-- ISNULL, COALESCE: Return a specified value if an expression is NULL.
SELECT *,
       ISNULL(Age, 0)
From Employees;

SELECT *,
       Coalesce(Age, Salary, Name) As NewColumn
From Employees;



-- 4. Logical Functions:
SELECT *,
	   IIF(Salary > 50000, 'High', 'Low') As SalaryHighOrLow
FROM Employees;

SELECT *,
	CASE 
		WHEN Age < 18 THEN 'Minor' 
		WHEN Age > 50 THEN 'Senior'
		ELSE 'Young' 
	END FROM Employees;


-- 5. Date functions

-- Gives current date and time
select getdate();

-- Adds a specified time interval to a date
select dateadd(Hour, 7, getdate());
select dateadd(Day, 2, getdate());
select dateadd(Minute, 10, getdate());
select dateadd(Week, 1, getdate());

-- Calculates the difference between two dates based on a specified part (e.g., days, months, years).
SELECT DATEDIFF(YEAR, '1990-01-01', '2023-01-15'); 
Declare @startDate Date = '2023-02-12';
Declare @endDate Date = '2023-12-11';

select datediff(month, @startDate,@endDate);



-- Returns a specific part of a date (e.g., year, month, day).
SELECT DATEPART(YEAR, '2023-01-15');
SELECT DATEPART(Minute, getdate());

-- OR I can use separate function for each part (only for year, month, day)
SELECT YEAR(getdate());
SELECT DAY(getdate());


