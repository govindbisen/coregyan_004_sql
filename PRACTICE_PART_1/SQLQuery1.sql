CREATE DATABASE pr_1;
GO

USE pr_1;
GO


CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    manager_id INT
);

INSERT INTO Employees (emp_id, name, department, salary, manager_id) VALUES
(107, 'Vikram', 'Engineering', 95000, 105),   -- Duplicate highest salary (Aarav ke barabar)
(108, 'Ananya', 'Engineering', 82000, 101),   -- Aarav ke under kaam karti hai (2nd level hierarchy)
(109, 'Dev', 'Engineering', 60000, 101),
(110, 'Priya', 'Sales', 88000, 106),          -- Duplicate salary (Neha ke barabar)
(111, 'Karan', 'Sales', 55000, 104),          -- Isha ke under kaam karta hai
(112, 'Simran', 'HR', 78000, NULL),           -- HR Department Head
(113, 'Arjun', 'HR', 62000, 112),
(114, 'Pooja', 'HR', 62000, 112),             -- Duplicate salary in HR
(115, 'Rahul', 'Marketing', 85000, NULL),     -- Marketing Department Head
(116, 'Sneha', 'Marketing', 70000, 115),
(117, 'Amit', 'Marketing', 68000, 115),
(118, 'Nidhi', 'Finance', 91000, NULL),       -- Finance Department Head
(119, 'Varun', 'Finance', 75000, 118),
(120, 'Tanya', 'Finance', 72000, 118),        -- Duplicate salary across departments (Meera ke barabar)
(121, 'Yash', 'Engineering', 72000, 105);     -- Duplicate salary in same department



--
-- 1 .  Write a query to display all Engineering employees ordered by salary from highest to lowest?
select * from Employees order by salary desc

---2 Write a query to find the number of employees in each department?
select department,count(*) from Employees group by department

---3 Write a query to find the second-highest distinct salary?
SELECT MAX(salary) AS second_highest_salary
FROM Employees
WHERE salary < ( SELECT MAX(salary) FROM Employees );

---4 Write a query to find the second-highest distinct salary with employee name?
select name,salary from employees where
salary = (SELECT MAX(salary) AS second_highest_salary
FROM Employees
WHERE salary < ( SELECT MAX(salary) FROM Employees ));

---5 Write a query to find employees earning more than the company average salary?
 select * from Employees where salary > (select avg(salary) from Employees)

---6 Write a query to find the highest salary in each department?
select max(salary) as highest_salary, department from Employees
group by department

---7 Write a query to find employees whose salary is higher than their manager's salary?

-- using cross join actual logic 
select 
e.emp_id,e.name,e.department,e.salary,e.manager_id, 
m.emp_id,m.name,m.department,m.salary,m.manager_id 
from 
Employees as e , Employees as m
where e.salary > m.salary AND e.manager_id = m.emp_id;

-- 
-- 7.1  Write a query to find employees whose salary is higher than their manager's salary
SELECT 
    e.emp_id,
    e.name AS employee_name,
    e.department,
    e.salary AS employee_salary,
    m.name AS manager_name,
    m.salary AS manager_salary
FROM Employees e
INNER JOIN Employees m 
    ON e.manager_id = m.emp_id
WHERE e.salary > m.salary;

------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

-- 1. Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    signup_date DATE
);

INSERT INTO Customers (customer_id, customer_name, city, signup_date) VALUES
(1, 'Aditi Sharma', 'Delhi', '2025-01-10'),
(2, 'Rahul Verma', 'Mumbai', '2025-01-15'),
(3, 'Simran Kaur', 'Chandigarh', '2025-02-01'),
(4, 'Arjun Nair', 'Bengaluru', '2025-02-12'),     -- Koi order nahi kiya (LEFT JOIN practice ke liye)
(5, 'Vikram Rathore', 'Delhi', '2025-02-20'),
(6, 'Neha Kapoor', 'Mumbai', '2025-03-05'),
(7, 'Karan Malhotra', 'Bengaluru', '2025-03-18'),
(8, 'Pooja Joshi', 'Pune', '2025-04-02'),          -- Koi order nahi kiya
(9, 'Rohan Das', 'Delhi', '2025-04-15'),
(10, 'Meera Iyer', 'Chennai', '2025-05-01');

-- 2. Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    amount INT,
    status VARCHAR(20),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Orders (order_id, customer_id, order_date, amount, status) VALUES
(501, 1, '2025-01-12', 2400, 'Delivered'),
(502, 1, '2025-02-14', 3200, 'Delivered'),
(503, 1, '2025-03-20', 5500, 'Delivered'),         -- Aditi: High-value repeat customer (3 delivered orders)
(504, 2, '2025-01-18', 1800, 'Delivered'),
(505, 2, '2025-02-25', 4100, 'Pending'),
(506, 2, '2025-04-10', 2900, 'Delivered'),
(507, 3, '2025-02-05', 950, 'Cancelled'),          -- Simran: Sirf ek order aur woh bhi Cancelled
(508, 5, '2025-02-22', 6200, 'Delivered'),
(509, 5, '2025-03-15', 1500, 'Cancelled'),
(510, 5, '2025-05-02', 4800, 'Delivered'),
(511, 6, '2025-03-08', 3200, 'Delivered'),         -- Duplicate amount (3200)
(512, 6, '2025-04-19', 3200, 'Delivered'),         -- Same customer, same amount (DENSE_RANK vs ROW_NUMBER)
(513, 7, '2025-03-25', 8500, 'Delivered'),         -- Highest single order
(514, 7, '2025-04-28', 2100, 'Pending'),
(515, 9, '2025-04-18', 1200, 'Delivered'),
(516, 10, '2025-05-05', 4500, 'Delivered'),
(517, 10, '2025-05-12', 1900, 'Pending');


-- 8 Write a query to display each order with the customer name?
SELECT 
    o.order_id,
    c.customer_name,
    o.amount,
    o.status
FROM Orders o
INNER JOIN Customers c 
    ON o.customer_id = c.customer_id;


-- 9 Write a query to find customers who have never placed an order?

SELECT 
   
    c.customer_name,
    o.order_id

FROM Customers c
LEFT JOIN  Orders o 
    ON c.customer_id = o.customer_id
    where order_id  IS NULL 
