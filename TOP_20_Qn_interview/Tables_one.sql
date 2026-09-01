-- database 

-- Table structure create karna
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50) NOT NULL
);

-- Dummy data insert karna
INSERT INTO Department (Dept_ID, Dept_Name) VALUES
(101, 'HR'),
(102, 'IT'),
(103, 'Finance'),
(104, 'Marketing');



-- Table structure create karna
CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50) NOT NULL,
    Salary DECIMAL(10, 2) NOT NULL,
    Dept_ID INT,
    Manager_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

-- Dummy data insert karna (Practice ke liye duplicates aur cyclic managers ke sath)
INSERT INTO Employee (Emp_ID, Emp_Name, Salary, Dept_ID, Manager_ID) VALUES
(1, 'Amit Sharma', 85000.00, 102, NULL),  -- Top Manager
(2, 'Rahul Verma', 75000.00, 102, 1),     -- Amit is manager
(3, 'Priya Singh', 90000.00, 103, NULL),  -- Finance Head (Highest Salary)
(4, 'Neha Gupta', 60000.00, 101, 1),
(5, 'Vikram Malhotra', 75000.00, 102, 2), -- Duplicate salary for alternate/nth test
(6, 'Rohan Das', 45000.00, 104, 3),
(7, 'Ananya Ray', 60000.00, 101, 4);     -- Duplicate salary
