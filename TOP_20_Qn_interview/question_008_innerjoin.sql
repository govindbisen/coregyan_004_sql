-- inner join - basedon common and column value compatible datatype 

select * from Employee
select * from Department


SELECT E.Emp_ID, E.Emp_Name, E.Salary, D.Dept_ID, D.Dept_Name
FROM Employee E
INNER JOIN Department D
ON E.Dept_ID = D.Dept_ID;

SELECT E.Emp_Name, D.Dept_Name
FROM Employee E
LEFT JOIN Department D
ON E.Dept_ID = D.Dept_ID;

SELECT E.Emp_Name, D.Dept_Name
FROM Employee E
RIGHT JOIN Department D
ON E.Dept_ID = D.Dept_ID;


--- self join 
select * from Employee

select e.Emp_ID,e.Emp_Name,e.Manager_ID from Employee as e
join Employee m 
on e.Manager_ID = m.Emp_ID


--- level 6
WITH EmployeeHierarchy AS (
    -- Anchor Member: Find the top-level bosses (where Manager_ID is NULL)
    SELECT 
        Emp_ID, 
        Emp_Name, 
        Manager_ID, 
        1 AS Hierarchy_Level,
        CAST(Emp_Name AS VARCHAR(MAX)) AS Reporting_Line
    FROM Employee
    WHERE Manager_ID IS NULL

    UNION ALL

    -- Recursive Member: Join the table back to the CTE to find direct reports
    SELECT 
        e.Emp_ID, 
        e.Emp_Name, 
        e.Manager_ID, 
        eh.Hierarchy_Level + 1 AS Hierarchy_Level,
        CAST(eh.Reporting_Line + ' -> ' + e.Emp_Name AS VARCHAR(MAX))
    FROM Employee e
    INNER JOIN EmployeeHierarchy eh 
    ON e.Manager_ID = eh.Emp_ID
    -- Stop looking after reaching your maximum depth constraint
    WHERE eh.Hierarchy_Level < 6 
)
-- Final Select to see the sorted results
SELECT 
    Emp_ID, 
    Emp_Name, 
    Hierarchy_Level, 
    Reporting_Line
FROM EmployeeHierarchy
ORDER BY Hierarchy_Level, Manager_ID;



-- Humne ek temporary table banayi jiska naam rakha 'MyLoop'
WITH MyLoop AS (
    -- STEP 1: Pehle level ke log
    SELECT Emp_ID, Emp_Name, Manager_ID, 1 AS Level
    FROM Employee
    WHERE Manager_ID IS NULL

    UNION ALL

    -- STEP 2: Baaki ke saare levels ka loop
    SELECT e.Emp_ID, e.Emp_Name, e.Manager_ID, (eh.Level + 1) AS Level
    FROM Employee e
    INNER JOIN MyLoop eh ON e.Manager_ID = eh.Emp_ID
    WHERE eh.Level < 6 -- Yeh condition 6 level ke baad loop ko rok degi
)
-- STEP 3: Ab is temporary table se final result print karlo
SELECT * FROM MyLoop;

INSERT INTO Employee (Emp_ID, Emp_Name, Salary, Dept_ID, Manager_ID)
VALUES (8, 'Riya Sen', 50000.00, 102, 5); 
-- Manager_ID = 5 diya hai, yani yeh Vikram Malhotra ko report karegi.
