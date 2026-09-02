--top 20 

-- second higest salary

select * from employees

-- 1 with offset and limit(mysql) 
select  salary from employees order by salary desc 
OFFSET 1 ROWS 
FETCH NEXT 1 ROWS ONLY

-- 2 with window function row_number, dense_rank

--step 1 
select name,department,salary,ROW_NUMBER() OVER(order by salary desc) as salary_rank   
from employees 

--step 2 -- 

WITH RankedSalaries AS(
select name,department,salary,ROW_NUMBER() OVER(order by salary desc) as salary_rank   
from employees )
select  distinct salary from RankedSalaries where salary_rank = 2 

WITH RankedSalaries AS(
select name,department,salary,DENSE_RANK() OVER(order by salary desc) as salary_rank   
from employees )
select  distinct salary from RankedSalaries where salary_rank = 2 

-- 3 MAX MIN keywords standard subquery 

select MAX(SALARY) AS SECOND_HIGHEST FROM employees 
WHERE SALARY <(select MAX(salary) from employees)

-- 4 top
SELECT TOP 1 salary 
FROM (
    SELECT DISTINCT TOP 2 salary 
    FROM Employee 
    ORDER BY salary DESC
) AS Temp
ORDER BY salary ASC;
