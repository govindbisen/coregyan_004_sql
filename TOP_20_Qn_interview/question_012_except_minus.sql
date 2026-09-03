-- except 
SELECT [Emp_Name], [Salary],[Dept_ID],[Manager_ID] 
FROM Employee
EXCEPT
SELECT [Emp_Name], [Salary],[Dept_ID] ,[Manager_ID]
FROM Employee where Manager_ID is null
