select * from Employees;

EXEC sp_rename 'Employees.Salary', 'SalaryInRS', 'COLUMN';