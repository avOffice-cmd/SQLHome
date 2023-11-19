-- joins stored procedure


Create Table Employees(
  emp_id int primary key identity(1,1),
  emp_name varchar(20),
  emp_roll varchar(20),
  emp_phone int
);



Insert into Employees 
(emp_name,emp_roll,emp_phone)
Values
('achal',101,2223434),
('salil',102,22553434),
('dugu',103,22234388),
('rohit',104,222345534),
('karma',105,222345334);

CREATE TABLE Boss (
  boss_id INT PRIMARY KEY IDENTITY(1,1),
  boss_name VARCHAR(30),
  boss_roll VARCHAR(30),
  employee_id INT,
  FOREIGN KEY (employee_id) REFERENCES Employees (emp_id)
);

Insert INTO Boss 
(boss_name,boss_roll,employee_id)
VALUES
('A',2,1),
('B',7,2),
('C',1,3),
('D',2,4),
('E',3,5);

SELECT *
FROM Employees
WHERE emp_id = 2;

SELECT *
FROM Employees
WHERE emp_roll > 101 AND emp_name = 'salil';

--add column
ALTER TABLE Employees
ADD age int not null DEFAULT 10;

--MODIFY COLUMN datatype
ALTER TABLE Employees
ALTER COLUMN emp_roll VARCHAR(40);

-- rename column name
EXEC sp_rename 'Employees.emp_name', 'FullName';

-- drop column
ALTER TABLE Employees
DROP COLUMN emp_roll;

-- raname table name
EXEC sp_rename 'Employees', 'Employees1';

--update
UPDATE Boss
SET boss_name = 'abc'
WHERE boss_id = 3;


Select * from Employees1;
SELECT * FROM Boss;

-- stored procedure

CREATE proc spDepartList
AS
BEGIN
select * from Employees1 where emp_id = 3;
select * from Employees1 where emp_id = 1;
END


ALTER proc spDepartList
AS
BEGIN
select * from Employees1 where emp_id = 3;
select * from Employees1 where emp_id = 1;
END


DROP proc spDepartList

ALTER proc spDepartList
@boss_id int,
@emp_id int
AS
BEGIN
select * from Boss where boss_id = @boss_id;
select * from Employees1 where emp_id = @emp_id
END

spDepartList 1,2


-- default value
ALTER proc spDepartList
@boss_id int=1,
@emp_id int=2
AS
BEGIN
select * from Boss where boss_id = @boss_id;
select * from Employees1 where emp_id = @emp_id
END

--output
CREATE proc spAddDigit
@Num1 Int
@Num2 INT
@Result INT OUTPUT
AS
BEGIN
        SET @Result=@Num1+@Num2;
END

Declare @EID INT
EXEC spAddDigit 20,30 , @EID OUTPUT;
SELECT @EID;

spDepartList

--joins

select * 
from Employees1
inner join Boss
on emp_id = boss_id;


--left join
select *
from Employees1
left join Boss
on emp_id = boss_id;

-- full join

SELECT e1.*, b.*  -- Use aliases to specify which table's columns to select
FROM Employees1 AS e1
LEFT JOIN Boss AS b
ON e1.emp_id = b.boss_id
UNION
SELECT e1.*, b.*  -- Use aliases to specify which table's columns to select
FROM Employees1 AS e1
RIGHT JOIN Boss AS b
ON e1.emp_id = b.boss_id;

-- left exclusive join
SELECT *
FROM Employees1
LEFT JOIN Boss
ON emp_id = boss_id
WHERE boss_id IS NULL;

--right 

SELECT *
FROM Employees1
LEFT JOIN Boss
ON emp_id = boss_id
WHERE emp_id IS NULL;

-- self join
select *
from Employees1 as a
join Employees1 as b
on a.id = b.id;

SELECT a.name, b.name
FROM Employees1 AS a
JOIN Employees1 AS b
ON a.id = b.id;
