-- 1. Employees earning more than average salary
SELECT * 
FROM employees 
WHERE salary > (SELECT AVG(salary) FROM employees);

-- 2. Employees in New York departments
SELECT * 
FROM employees 
WHERE departmentID IN (
    SELECT departmentID 
    FROM department
    WHERE location = 'New York'
);

-- 3. EXISTS example
SELECT * 
FROM employees e
WHERE EXISTS (
    SELECT 1 
    FROM department d
    WHERE d.departmentID = e.departmentID
    AND d.location = 'NY'
);

-- 4. Correlated subquery
SELECT e.Name, e.department, e.salary
FROM employees e
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
);

-- 5. NOT EXISTS
SELECT * 
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1 
    FROM Orders o
    WHERE o.customerID = c.customerID
);

-- 6. Scalar subquery
SELECT e.Name, e.salary,
(
    SELECT AVG(salary)
    FROM employees
    WHERE department = e.department
) AS Dept_Avg_Salary
FROM employees e;