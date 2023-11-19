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

