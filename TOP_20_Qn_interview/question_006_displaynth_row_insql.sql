-- display nth row in sql 

-- 1. display 5th row
SELECT * 
FROM employees
ORDER BY employee_id                  
OFFSET 4 ROWS             
FETCH NEXT 1 ROWS ONLY;        

-- 2 display 5th row 

with SequencedEmployees  as (
select *, ROW_NUMBER() over(order by employee_id) as rn from employees)
select * from SequencedEmployees 
where rn = 5