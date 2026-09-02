-- UNION 

SELECT * FROM employees

SELECT name, department FROM employees WHERE name = 'Bob Jones'
UNION ALL
SELECT name, department FROM employees WHERE name = 'Bob Jones';


SELECT name, department FROM employees WHERE name = 'Bob Jones'
UNION 
SELECT name, department FROM employees WHERE name = 'Bob Jones';

---scenario 2 see high salary and low salary employee together 

SELECT employee_id, name, salary, 'High Earner' AS Status 
FROM employees 
WHERE salary > 100000

UNION ALL

SELECT employee_id, name, salary, 'Entry Level' AS Status 
FROM employees 
WHERE salary < 60000;

