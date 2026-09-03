
SELECT employee.FirstName, Departments.DepartmentName
FROM employee
    INNER JOIN Departments
    ON employee.DepartmentID = Departments.DepartmentID;
