
use practice

-- Create tables
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    manager_id INT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2)
);

-- Insert Employee Data (Includes an organizational hierarchy)
INSERT INTO employees VALUES 
(1, 'Alice Smith', 'Management', 150000, NULL),
(2, 'Bob Jones', 'Sales', 90000, 1),
(3, 'Charlie Brown', 'Sales', 85000, 1),
(4, 'David Miller', 'Marketing', 75000, 1),
(5, 'Emma Davis', 'Sales', 60000, 2),
(6, 'Frank Wilson', 'Marketing', 55000, 4);

-- Insert Order Data
INSERT INTO orders VALUES 
(101, 501, 2, '2026-01-10', 1200.00),
(102, 502, 2, '2026-01-12', 450.00),
(103, 501, 3, '2026-01-15', 3000.00),
(104, 503, 5, '2026-01-18', 150.00),
(105, 502, 2, '2026-02-01', 2100.00),
(106, 504, 3, '2026-02-03', 950.00),
(107, 501, 5, '2026-02-10', 800.00),
(108, 503, 6, '2026-02-14', 600.00);

-- Task 1: Write a basic CTE named SalesStaff that selects only the employee_id, name, and salary of employees who work 
-- in the 'Sales' department.Output: In your final query, select all columns from this CTE.

select e.employee_id,e.name,e.salary from employees e where department like '%Sales'

with  SalesStaff as(
    select e.employee_id,e.name,e.salary from  employees e where e.department like '%Sales')
    select * from salesStaff 


-- Task 2: 

-- Task: Create a CTE (let's name it EmployeeOrderStats) that calculates the total amount sold 
-- (SUM(total_amount)) and the total number of orders placed (COUNT(order_id)) per employee from the orders table.
select sum(total_amount) as total_amount,count(order_id) as total_emp from orders group by employee_id; 

with EmployeeOrderStats as (
select employee_id,sum(total_amount) as total_amount,count(order_id) as total_emp from orders group by employee_id 
)
select * from EmployeeOrderStats  join employees on EmployeeOrderStats.employee_id = employees.employee_id

--without CTE using subquery 

SELECT * 
FROM (

    SELECT employee_id, 
           SUM(total_amount) AS total_amount, 
           COUNT(order_id) AS total_emp 
    FROM orders 
    GROUP BY employee_id
) AS EmployeeOrderStats 
JOIN employees ON EmployeeOrderStats.employee_id = employees.employee_id;

-------------------------------

-- Task 3 : The Goal: Find the employees who have a higher salary than the average salary of their department, 
-- and also include their total sales from the orders table
-- Correlated Subquery 
select * from employees as e where salary>(select AVG(salary) from employees where department = e.department) 

--
with avgsalaryCTE as (
select department, avg(salary) as avgSalDept from employees group by department )

select e.name,a.avgSalDept  from avgsalaryCTE as a
join employees e on e.department = a.department
WHERE e.salary > a.avgSalDept; 


--



--=========================================================================================
select top 2 * from orders
select top 2 * from employees

SELECT employee_id FROM employees
UNION ALL
SELECT employee_id FROM orders;


