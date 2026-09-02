WITH CTE_Sequence AS (
    SELECT *, ROW_NUMBER() OVER(ORDER BY id) as row_num
    FROM employees
)
SELECT * FROM CTE_Sequence WHERE row_num % 2 <> 0;


WITH CTE_Sequence AS (
    SELECT *, ROW_NUMBER() OVER(ORDER BY id) as row_num
    FROM employees
)
SELECT * FROM CTE_Sequence WHERE row_num % 2 = 0;


-- Odd Records ?? ???
SELECT * FROM employees WHERE id % 2 <> 0;

-- Even Records ?? ???
SELECT * FROM employees WHERE id % 2 = 0;
