
--- last few rows 
WITH NumberedEmployees AS (
    SELECT *, 
           ROW_NUMBER() OVER (ORDER BY EmployeeID ASC) AS RowNum
    FROM Employee
)
SELECT TOP 5 *
FROM NumberedEmployees
ORDER BY RowNum DESC;
