CREATE TABLE employee
(
    EmployeeId INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(100),
    Salary Decimal(10,3)
)
SELECT *
FROM employee

CREATE TABLE Departments
(
    DepartmentID INT PRIMARY KEY,
    -- Unique ID for each department
    DepartmentName NVARCHAR(100)
    -- Name of the department
);


