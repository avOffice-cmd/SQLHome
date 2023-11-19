-- Create the department table
CREATE TABLE department (
    department_id INT PRIMARY KEY IDENTITY(1,1),
    department_name VARCHAR(255)
);

-- Insert data into the department table
INSERT INTO department (department_name) VALUES
('IT'),
('Finance'),
('HR');

-- Create the employee table
CREATE TABLE employee (
    emp_id INT PRIMARY KEY IDENTITY(1,1),
    emp_name VARCHAR(255),
    emp_gender CHAR(1),
    emp_salary DECIMAL(10, 2),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

-- Insert data into the employee table
INSERT INTO employee (emp_name, emp_gender, emp_salary, department_id) VALUES
('John Doe', 'M', 60000.00, 1),
('Jane Smith', 'F', 75000.00, 2),
('Bob Johnson', 'M', 50000.00, 3),
('Alice Brown', 'F', 80000.00, 1),
('Charlie Davis', 'M', 70000.00, 2),
('Eva White', 'F', 65000.00, 3),
('Michael Lee', 'M', 72000.00, 1),
('Olivia Green', 'F', 55000.00, 2),
('David Wilson', 'M', 90000.00, 3),
('Sophia Anderson', 'F', 68000.00, 1),
('James Miller', 'M', 80000.00, 2),
('Emily Wilson', 'F', 62000.00, 3),
('Daniel Turner', 'M', 75000.00, 1),
('Emma Davis', 'F', 70000.00, 2),
('Andrew Brown', 'M', 85000.00, 3);

INSERT INTO employee (emp_name, emp_gender, emp_salary, department_id) VALUES
('Aanchal Verma', 'F', 80000.00, null)


select * from employee;
select * from department;
