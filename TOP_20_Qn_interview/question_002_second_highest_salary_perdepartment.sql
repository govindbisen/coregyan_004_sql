-- highest paid employee in each department


-- 1 (this can not give other details)
select * from Employee
select Dept_ID,MAX(Salary) from Employee group by Dept_ID

-- 2 dense rank
-- DENSE_RANK() Returns BOTH rows Both get Rank 1.
WITH RankedEmployees AS(
select *, 
DENSE_RANK() OVER(PARTITION BY Dept_ID ORDER BY Salary DESC) AS salary_rank
FROM Employee
)
SELECT * 
FROM RankedEmployees 
WHERE salary_rank = 1;

-- 3 subquery 
SELECT * 
FROM Employee 
WHERE (Dept_ID, Salary) IN (
    SELECT Dept_ID, MAX(Salary) 
    FROM Employee 
    GROUP BY Dept_ID
);

--4 Where we do not have window fn then?
SELECT e.*
FROM Employee e
INNER JOIN (
    SELECT Dept_ID, MAX(Salary) AS MaxSalary
    FROM Employee
    GROUP BY Dept_ID
) m ON e.Dept_ID = m.Dept_ID AND e.Salary = m.MaxSalary;


-- extra 
-- improve performance
CREATE INDEX idx_emp_dept_salary ON Employee(Dept_ID, Salary DESC);






---------------------------------------------------------------------------
-- 2 number of emp in each dept 
select count(Salary) as nemp,Dept_ID from Employee group by Dept_ID


/**
Behavior if 2 employees have the same Max SalaryWhich one does it choose?

DENSE_RANK() Returns BOTH rows Both get Rank 1.
JOIN with Derived TableReturns BOTH rowsBoth match the Max Salary value.
CROSS APPLY Returns ONLY ONE rowWhichever row the database scans first.
ROW_NUMBER()Returns ONLY ONE rowIt forces unique sequential numbering (1 and 2).
*/