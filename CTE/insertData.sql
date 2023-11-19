-- Create Department table
CREATE TABLE Department (
    DepartmentID INT IDENTITY(1,1) PRIMARY KEY,
    DepartmentName NVARCHAR(50)
);
-- Create Employee table with DepartmentID as a foreign key
CREATE TABLE Employee (
    EmployeeID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100),
    DepartmentID INT,
    Position NVARCHAR(50),
    Salary DECIMAL(10, 2),
    HireDate DATE,
    IsActive BIT,
    CONSTRAINT FK_Employee_Department FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

INSERT INTO Department (DepartmentName)
VALUES ('IT'), ('HR'), ('Finance'), ('Marketing'), ('Operations'), ('Sales');

INSERT INTO Employee (FirstName, LastName, Email, DepartmentID, Position, Salary, HireDate, IsActive)
VALUES
    ('John', 'Doe', 'john.doe@example.com', 1, 'Developer', 60000.00, '2022-01-15', 1),
    ('Jane', 'Smith', 'jane.smith@example.com', 2, 'Manager', 70000.00, '2021-11-20', 0),
    ('Mike', 'Johnson', 'mike.johnson@example.com', 3, 'Accountant', 55000.00, '2022-03-05', 1),
    ('Emily', 'Williams', 'emily.williams@example.com', 4, 'Marketing Specialist', 58000.00, '2022-06-10', 1),
    ('Alex', 'Brown', 'alex.brown@example.com', 5, 'Operations Manager', 72000.00, '2022-02-28', 0),
    ('Sarah', 'Anderson', 'sarah.anderson@example.com', 6, 'Sales Representative', 62000.00, '2021-09-12', 0),
    ('Daniel', 'Clark', 'daniel.clark@example.com', 1, 'System Administrator', 65000.00, '2022-04-25', 1),
    ('Olivia', 'Martinez', 'olivia.martinez@example.com', 2, 'HR Assistant', 50000.00, '2022-07-30', 0),
    ('William', 'Taylor', 'william.taylor@example.com', 3, 'Financial Analyst', 58000.00, '2022-08-15', 1),
    ('Sophia', 'Thomas', 'sophia.thomas@example.com', 4, 'Marketing Manager', 75000.00, '2021-12-05', 1),
    ('Ethan', 'Hill', 'ethan.hill@example.com', 5, 'Operations Coordinator', 54000.00, '2022-05-18', 1),
    ('Ava', 'Adams', 'ava.adams@example.com', 6, 'Sales Manager', 68000.00, '2022-09-22', 1),
    ('Noah', 'Baker', 'noah.baker@example.com', 1, 'IT Support Specialist', 56000.00, '2022-10-10', 0),
    ('Isabella', 'Garcia', 'isabella.garcia@example.com', 2, 'HR Manager', 70000.00, '2022-11-08', 0),
    ('James', 'Mitchell', 'james.mitchell@example.com', 3, 'Financial Manager', 78000.00, '2022-12-18', 1);

drop table Department;
select * from Employee;
select * from Department;

