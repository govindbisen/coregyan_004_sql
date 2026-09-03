/* =========================================================
   CONSTRAINTS

   PRIMARY KEY : Each row must be unique and NOT NULL.
   FOREIGN KEY : Links two tables; value must exist in parent table.
   NOT NULL     : Column cannot contain NULL.
   UNIQUE       : Duplicate values are not allowed.
   CHECK        : Value must satisfy a condition.
   DEFAULT      : Value is automatically assigned if not provided.
   ========================================================= */
-- Create practice database
CREATE DATABASE SQLPractice;
GO

-- Use practice database
USE SQLPractice;
GO

CREATE TABLE Users
(
    UserID INT PRIMARY KEY,
    -- PRIMARY KEY: unique + NOT NULL

    UserName NVARCHAR(50) NOT NULL,
    -- NOT NULL: value is mandatory

    Email NVARCHAR(100) UNIQUE,
    -- UNIQUE: duplicate emails are not allowed

    Age INT CHECK (Age >= 18),
    -- CHECK: Age must be 18 or above

    Country NVARCHAR(50) DEFAULT 'Unknown'
    -- DEFAULT: used when Country is not provided
);


-- Valid insert
INSERT INTO Users
    (UserID, UserName, Email, Age, Country)
VALUES
    (1, 'Alice', 'alice@example.com', 25, 'USA');


-- DEFAULT example: Country is not provided
-- SQL Server will store 'Unknown'
INSERT INTO Users
    (UserID, UserName, Email, Age)
VALUES
    (2, 'Bob', 'bob@example.com', 30);


SELECT *
FROM Users;


-- CHECK violation: Age < 18 → ERROR
INSERT INTO Users
    (UserID, UserName, Email, Age, Country)
VALUES
    (3, 'Charlie', 'charlie@example.com', 16, 'Canada');


-- UNIQUE violation: Email already exists → ERROR
-- INSERT INTO Users
--     (UserID, UserName, Email, Age)
-- VALUES
--     (3, 'Charlie', 'alice@example.com', 25);


-- NOT NULL violation: UserName cannot be NULL → ERROR
-- INSERT INTO Users
--     (UserID, UserName, Email, Age)
-- VALUES
--     (3, NULL, 'charlie@example.com', 25);


-- PRIMARY KEY violation: UserID 1 already exists → ERROR
-- INSERT INTO Users
--     (UserID, UserName, Email, Age)
-- VALUES
--     (1, 'David', 'david@example.com', 25);

/* =========================================================
   FOREIGN KEY

   FOREIGN KEY links a child table with a parent table.
   The value must exist in the parent table.
   ========================================================= */


CREATE TABLE Departments
(
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50)
);


INSERT INTO Departments
VALUES
    (1, 'IT'),
    (2, 'HR');


CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,
    EmployeeName NVARCHAR(50),

    DepartmentID INT,

    FOREIGN KEY (DepartmentID)
        REFERENCES Departments(DepartmentID)
);


-- Valid: DepartmentID 1 exists
INSERT INTO Employees
VALUES
    (101, 'Alice', 1);


-- ERROR: DepartmentID 99 does not exist
-- INSERT INTO Employees
-- VALUES
--     (102, 'Bob', 99);


SELECT *
FROM Employees;


DELETE FROM Users;
TRUNCATE TABLE Users;
DROP TABLE Users;
DROP DATABASE SQLPractice;


USE master;
GO

DROP DATABASE SQLPractice;
GO