select * from Employee
select * from Department

select e.Emp_Name,e.Salary,e.Manager_ID,d.Dept_Name,d.Dept_ID from Employee e
full join Department d
on e.Dept_ID = d.Dept_Id


select e.Emp_Name,e.Salary,e.Manager_ID,d.Dept_Name,d.Dept_ID from Employee e
cross join Department d


