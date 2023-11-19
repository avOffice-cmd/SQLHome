drop table Employee;
CREATE TABLE Employee
(
  Employee_id INT PRIMARY KEY IDENTITY(1,1),
  Employee_name VARCHAR(30),
  Employee_gender varchar(10),
  Employee_city VARCHAR(30),
  Employee_age INT,
  Employee_Salary INT
);

INSERT INTO Employee VALUES
('ACHAL','Female','NAGPUR',22,1000),
('SALIL','Male','DELHI',22,6000),
('KARMA','Male','NAGPUR',25,1300),
('ROHIT','Male','NAGPUR',62,1700),
('ANJU','Female','DELHI',40,15000),
('Henry','Male','DELHI',62,1600),
('KOMAL','Female','NAGPUR',25,100);


-- find the maximum salary of every gender
select Employee_gender,
       max(Employee_Salary) as maximumSalary
from Employee
group by Employee_gender;

-- Find the sum of female and male salary in each city
select Employee_city,Employee_gender,
       sum(Employee_Salary) as sumofsalary
from Employee
group by Employee_city,Employee_gender;

-- find the youngest male and female in each city
select Employee_city,Employee_gender,
       min(Employee_age)
from Employee
group by Employee_city,Employee_gender;

-- find the average salary of Employee from each city
select Employee_city,
       avg(Employee_salary)
from Employee
group by Employee_city;


-- find the total salary of employees from every-
-- gender but count only those salaries which are greater than 1000

select Employee_gender,
sum(Employee_salary)
from Employee
where Employee_salary > 1000
group by Employee_gender;


--find number of male and female teachers from each city.
select Employee_gender,
	   Employee_city,
       count(*) as genderCount
from Employee
group by Employee_gender, Employee_city


select Employee_gender,
	   Employee_city,
       count(*) as genderCount
from Employee
Where Employee_gender = 'Female'
group by Employee_gender, Employee_city


--------------joins



--Joins

create table emp
(
  empId int identity(1,1),
  empName varchar(20),
  deptId int,
  dateColumn DateTime
  foreign key (deptId) references department(Id)
);

drop table department;
create table department
(
   Id int primary key identity(1,1),
   deptName varchar(20),
   
);

insert into department Values
('cs'),
('It'),
('Hr');

insert into emp values
('achal',2),
('salil',1),
('karma',2);

insert into emp values
('Hnery',null);

select * from emp;
select * from department;

select emp.empName,
       department.deptName
from emp
inner join department
on emp.deptId = department.Id
where department.deptName = 'It';


-- find the number of employees in every department
select department.deptName,
	   count(*) as noOfEmp
from emp
right join department
on emp.deptId = department.Id
group by department.deptName;


select department.deptName,
from emp
inner join department
on emp.deptId = department.Id
group by department.deptName;

