
SELECT *
FROM employee
WHERE Salary > 65000;

SELECT *
FROM employee
ORDER BY Salary DESC;



UPDATE employee
SET Salary = 8000
WHERE EmployeeID = 2;

DELETE FROM employee 
WHERE EmployeeId = 5

SELECT UPPER(FirstName)
FROM employee;

SELECT SUM(Salary)
FROM employee;
SELECT AVG(Salary)
FROM employee;
