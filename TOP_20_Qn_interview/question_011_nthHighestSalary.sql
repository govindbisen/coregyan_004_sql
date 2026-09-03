-- nth highest salary 

select * from Employee 
--1
with CTE as (
select salary,Emp_Name, DENSE_RANK() over(order by salary) as rnksalary from Employee 
)
select * from cte where rnksalary = 5


--2
SELECT DISTINCT Salary
FROM Employee
ORDER BY Salary DESC
OFFSET 2 ROWS FETCH NEXT 1 ROWS ONLY;
