use hr;
-- Используйте базу данных hr;
-- Найти департамент с наибольшим количеством сотрудников(вывести название департамента и ид департамента)

SELECT
 department_name, 
 department_id
FROM departments
WHERE department_id IN (
    SELECT department_id
    FROM employees
    GROUP BY department_id
    HAVING COUNT(*) = (
        SELECT MAX(employee_count)
        FROM (
            SELECT COUNT(*) AS employee_count
            FROM employees
            GROUP BY department_id
        ) AS counts
    )
);


