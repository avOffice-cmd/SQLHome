select * from Employee;

Select *,
	   Row_Number() Over (Order by salary) as RowNumber
From Employee

Select *,
	   Row_Number() Over (Partition By department_id Order by department_id) as RowNumber
From Employee;
-----------------------------------------------------------------------------------


With DeleteDuplicate_CTE AS 
(
	Select *,
		   Row_Number() Over (Partition By first_name, last_name Order by first_name) as RowNumber
	From Employee
)
Delete From  Employee
Where        employee_id IN (Select employee_id
					         From DeleteDuplicate_CTE
					         Where RowNumber > 1)