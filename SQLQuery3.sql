-- groupby basic command

CREATE DATABASE ACHAL_DB;

drop table Teachers;
CREATE TABLE Teachers
(
  Teacher_id INT PRIMARY KEY IDENTITY(1,1),
  Teacher_name VARCHAR(30),
  Teacher_city VARCHAR(30),
  Teacher_age INT,
  Teacher_Salary INT
);

drop table Student;
CREATE TABLE Student
(
   StudentId INT PRIMARY KEY IDENTITY(1,1),
   StudentName VARCHAR(30),
   TeacherId INT,
   FOREIGN KEY (TeacherId) REFERENCES Teachers(Teacher_id)
);

INSERT INTO Student (StudentName,TeacherId)
VALUES
('A',2),
('B',3),
('C',1),
('D',1),
('E',2);

INSERT INTO Teachers VALUES
('ACHAL','NAGPUR',22,1000),
('SALIL','MUMBAI',20,6000),
('KARMA','PUNE',25,1300),
('ROHIT','NAGPUR',80,1700),
('ANJU','DELHI',40,15000),
('Henry','DELHI',60,1600),
('KOMAL','PUNE',5,100);

SELECT * FROM Teachers;
SELECT * FROM Student;
TRUNCATE TABLE Teacher;

-- drop table from database
DROP TABLE Teacher;

-- change datatype
ALTER TABLE Teacher
ALTER COLUMN Teacher_city VARCHAR(50) NOT NULL;

-- ADD NEW COLUMN
ALTER TABLE Teacher
ADD Teacher_Branch VARCHAR(30)

-- drop column from existing table
ALTER TABLE Teacher
DROP COLUMN Teacher_Branch

-- rename table name
EXEC sp_rename 'Teacher', 'Teachers';

-- NOT IN OPERATOR
SELECT * FROM Teachers
where Teacher_city NOT IN ('DELHI' , 'MUMBAI');


-- IN OPERATOR
SELECT * FROM Teachers
where Teacher_city  IN ('DELHI' , 'MUMBAI');


-- GROUP BY CLAUSE
select Teacher_city, count(*)
from Teachers
group by Teacher_city;

--


select Teacher_city,
	   SUM(Teacher_Salary) As MaxSalary
from Teachers
group by Teacher_city;

select Teacher_city,
       MAX(Teacher_age)
from Teachers
group by Teacher_city;

select count(*) AS TotalSalary
from Teachers
Where Teacher_age < 25;

SELECT * FROM Teachers

-- count teacher
select Teacher_city,
       count(*)
from Teachers
group by Teacher_city;


 