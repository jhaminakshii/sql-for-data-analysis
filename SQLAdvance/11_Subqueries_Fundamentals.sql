/* =====================================================
   SUBQUERY TYPES – With Examples
   Author: Minakshi Jha
   Focus: Interview-level + Real-world SQL Practice
   ===================================================== */

USE SQLPractice;

/* -----------------------------------------------------
1. Single-Row Subquery
Question: Find employees earning more than the average salary.
----------------------------------------------------- */
SELECT Name, Salary
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);

/* -----------------------------------------------------
2. Multi-Row Subquery (IN)
Question: Find employees working in departments 
that have more than 2 employees.
----------------------------------------------------- */
SELECT Name, Department
FROM Employees
WHERE Department IN (
    SELECT Department
    FROM Employees
    GROUP BY Department
    HAVING COUNT(*) > 2
);

/* -----------------------------------------------------
3. Subquery in SELECT (Scalar Subquery)
Question: Show employee name along with total employee count.
----------------------------------------------------- */
SELECT Name,
       (SELECT COUNT(*) FROM Employees) AS TotalEmployees
FROM Employees;

/* -----------------------------------------------------
4. Subquery in FROM (Derived Table)
Question: Find departments with average salary > 50,000.
----------------------------------------------------- */
SELECT Department, AvgSalary
FROM (
    SELECT Department, AVG(Salary) AS AvgSalary
    FROM Employees
    GROUP BY Department
) AS DeptAvg
WHERE AvgSalary > 50000;

/* -----------------------------------------------------
5. Correlated Subquery (INTERVIEW FAVORITE)
Question: Find employees earning more than 
the average salary of their department.
----------------------------------------------------- */
SELECT Name, Department, Salary
FROM Employees e
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE Department = e.Department
);

/* -----------------------------------------------------
6. Employees earning less than the maximum salary
----------------------------------------------------- */
SELECT Name, Salary
FROM Employees
WHERE Salary < (
    SELECT MAX(Salary)
    FROM Employees
);

/* -----------------------------------------------------
7. Find employees earning the second highest salary
----------------------------------------------------- */
SELECT MAX(Salary) AS SecondHighestSalary
FROM Employees
WHERE Salary < (
    SELECT MAX(Salary)
    FROM Employees
);

/* -----------------------------------------------------
8. Find employees earning more than 
their department average (correlated)
----------------------------------------------------- */
SELECT Name, Department, Salary
FROM Employees e
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE Department = e.Department
);

/* -----------------------------------------------------
9. Find employees who never placed an order
----------------------------------------------------- */
SELECT Name
FROM Employees e
WHERE NOT EXISTS (
    SELECT 1
    FROM Orders o
    WHERE o.EmployeeId = e.EmployeeId
);

/* -----------------------------------------------------
10. EXISTS vs NOT EXISTS Notes
-----------------------------------------------------
- NOT IN fails when subquery returns NULL
- NOT EXISTS is NULL-safe and preferred
----------------------------------------------------- */
