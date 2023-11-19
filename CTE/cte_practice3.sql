-- Creating the Employees table
CREATE TABLE Employees (
    id INT PRIMARY KEY,
    name NVARCHAR(100),
    manager_id INT,
    CONSTRAINT FK_Manager FOREIGN KEY (manager_id) REFERENCES Employees(id)
);

-- Inserting sample data into the Employees table
INSERT INTO Employees (id, name, manager_id)
VALUES
    (1, 'CEO', NULL),
    (2, 'Manager 1', 1),
    (3, 'Employee 1.1', 2),
    (4, 'Employee 1.2', 2),
    (5, 'Manager 2', 1),
    (6, 'Employee 2.1', 5),
    (7, 'Employee 2.2', 5);

	-- Using a Recursive CTE to retrieve hierarchical data
WITH EmployeeCTE AS (
    SELECT id, name, manager_id
    FROM Employees
    WHERE manager_id IS NULL -- Anchor member

    UNION ALL

    SELECT e.id, e.name, e.manager_id
    FROM Employees e
    JOIN EmployeeCTE ecte 
	ON e.manager_id = ecte.id -- Recursive member
)
SELECT *
FROM EmployeeCTE;

--------------------------------------------------------------------------------------------------------------

-- Creating the Sales table
CREATE TABLE Sales (                               -- dout
    id INT PRIMARY KEY,
    sale_date DATE,
    amount DECIMAL(10, 2)
);

-- Inserting sample data into the Sales table
INSERT INTO Sales (id, sale_date, amount)
VALUES
    (1, '2023-01-01', 100.00),
    (2, '2023-01-02', 150.00),
    (3, '2023-01-03', 75.00),
    (4, '2023-01-04', 200.00);


	-- Using a CTE to calculate running total
WITH SalesCTE AS (
    SELECT id, sale_date, amount,
           SUM(amount) OVER (ORDER BY sale_date) AS running_total
    FROM Sales
	--SELECT id, sale_date, amount,
 --          SUM(amount) AS running_total
 --   FROM Sales
)
SELECT *
FROM SalesCTE;


-----------------------------------------------------------------------------------------------------------
--Finding Duplicate Rows
---------------------------------------------------------------------------------------------------------

-- Creating the Customers table
CREATE TABLE Customers (
    id INT PRIMARY KEY,
    name NVARCHAR(100),
    email NVARCHAR(100),
    phone NVARCHAR(20)
);

-- Inserting sample data into the Customers table
INSERT INTO Customers (id, name, email, phone)
VALUES
    (1, 'John Doe', 'john@example.com', '555-1234'),
    (2, 'Jane Smith', 'jane@example.com', '555-5678'),
    (3, 'John Doe', 'john@example.com', '555-1234'),
    (4, 'Bob Johnson', 'bob@example.com', '555-9999');


	-- Using a CTE to find duplicate rows
WITH DuplicateCustomersCTE AS (
    SELECT
        name,
        email,
        phone,
        COUNT(*) AS duplicate_count
    FROM Customers
    GROUP BY
        name,
        email,
        phone
    HAVING COUNT(*) > 1
)
SELECT *
FROM DuplicateCustomersCTE;

-----------------------------------------------------------------------------------------------------------------







