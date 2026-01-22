/* =====================================================
   WINDOW FUNCTIONS – INTERVIEW CHALLENGES
   Author: Minakshi Kumari
   Level: Intermediate → Advanced
   =====================================================

   Table Assumed:
   -----------------------------------------------------
   Employees
   -----------------------------------------------------
   EmpID | Name | DepartmentID | Salary | HireDate
*/
USE SQLPractice

select * from employees

ALTER table employees
add HireDate date;

update employees set HireDate = DATEADD(YEAR,EmpID,GETDATE() )

--------------------------------------------------------
-- 1. Assign unique row number to each employee
--------------------------------------------------------
SELECT *,
		ROW_NUMBER() OVER (ORDER BY EmpID ) AS UniqueNo
FROM employees

--------------------------------------------------------
-- 2. Rank employees by salary (highest first)
--------------------------------------------------------
SELECT *,
		RANK() OVER (ORDER BY salary DESC) AS Salary_RANK
FROM employees

--------------------------------------------------------
-- 3. Dense rank employees by salary
--------------------------------------------------------
SELECT *,
		DENSE_RANK() OVER (ORDER BY salary DESC) AS Salary_RANK
FROM employees

--------------------------------------------------------
-- 4. Rank employees within each DepartmentID
--------------------------------------------------------
SELECT *,
		RANK() OVER (
		PARTITION BY DepartmentID
		 ORDER BY salary DESC
		 ) AS Dept_Rank
FROM employees ;

--------------------------------------------------------
-- 5. Top 2 highest paid employees per DepartmentID
--------------------------------------------------------
WITH CTE AS (
SELECT Name,
		DepartmentID,
		salary,
		DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY salary DESC) AS Higher_Salary_No
FROM employees)
SELECT * FROM CTE 
WHERE Higher_Salary_No <= 2 ;

--------------------------------------------------------
-- 6. DepartmentID-wise total salary 
--------------------------------------------------------
SELECT DepartmentID,SUM(salary) as Total_Salary
FROM employees
GROUP BY DepartmentID ;

------(without GROUP BY)------
SELECT  Name,
		 DepartmentID,
		 salary,
		SUM(salary) OVER (
		PARTITION BY DepartmentID
		 ) AS Total_Salary
FROM employees;

--------------------------------------------------------
-- 7. DepartmentID-wise average salary
--------------------------------------------------------
SELECT  Name,
		 DepartmentID,
		 salary,
		AVG(salary) OVER (
		PARTITION BY DepartmentID
		 ) AS Average_Salary
FROM employees

--------------------------------------------------------
-- 8. Running total of salaries (ordered by hire date)
--------------------------------------------------------
SELECT  Name,
		 DepartmentID,
		 salary,
		 SUM(salary) OVER (
		 ORDER BY HireDate
		 ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
		 )AS Running_Salary
FROM employees

--------------------------------------------------------
-- 9. Compare salary with previous employee (LAG)
--------------------------------------------------------
SELECT  Name,
		salary,
		LAG(salary) OVER (
		ORDER BY salary
		 ) AS Previous_Salary
FROM employees

--------------------------------------------------------
-- 10. Salary difference from previous employee
--------------------------------------------------------
SELECT Name,
		salary,
		salary - LAG(salary) OVER (ORDER BY EmpID) AS Salary_Diff
FROM employees;

--------------------------------------------------------
-- 11. Compare salary with next employee (LEAD)
--------------------------------------------------------
SELECT Name,
		salary,
		LEAD(salary) OVER (ORDER BY EmpID) AS Next_Salary
FROM employees;

--------------------------------------------------------
-- 12. Employees earning above DepartmentID average
--------------------------------------------------------
SELECT * FROM
(SELECT Name,
		DepartmentID,
		salary,
		AVG(salary) OVER (PARTITION BY DepartmentID) AS AVG_Salary
FROM employees) T
WHERE salary > AVG_Salary ;

--------------------------------------------------------
-- 13. Bucket employees into 4 salary groups (quartiles)
--------------------------------------------------------
SELECT Name,
		DepartmentID,
		salary,
		NTILE(4) OVER (ORDER BY salary) AS Salary_Quartile
FROM employees ;

--------------------------------------------------------
-- 14. First salary in each DepartmentID
--------------------------------------------------------

SELECT Name,
		DepartmentID,
		salary,
		FIRST_VALUE(salary) OVER (
		PARTITION BY DepartmentID
		ORDER BY salary
		 ) AS First_Salary
FROM employees 

SELECT * FROM employees
--------------------------------------------------------
-- 15. Highest salary in each DepartmentID
--------------------------------------------------------
SELECT Name,
		DepartmentID,
		salary,
		MAX(salary) OVER (
		PARTITION BY DepartmentID
		 ) AS Max_Dept_Salary
FROM employees 

--------------------------------------------------------
-- 16. Employees hired after the first hire in DepartmentID
--------------------------------------------------------
SELECT * FROM (
SELECT Name,
		DepartmentID,
		salary,
		HireDate,
		FIRST_VALUE(HireDate) OVER (
		PARTITION BY DepartmentID
		ORDER BY HireDate
		 ) AS First_HireDate
FROM employees ) T
WHERE HireDate > First_HireDate

--------------------------------------------------------
-- 17. Difference between max salary and employee salary
--------------------------------------------------------
SELECT *,
		MAX(salary) OVER () - salary AS Max_Salary_Diff 
FROM employees

--------------------------------------------------------
-- 18. Rolling 3-row salary average
--------------------------------------------------------
SELECT
    Name,
    Salary,
    AVG(Salary) OVER (
        ORDER BY HireDate
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS rolling_avg_salary
FROM Employees

--------------------------------------------------------
-- 19. Identify duplicate salaries
--------------------------------------------------------
SELECT * FROM
(SELECT Name,
		salary,
		COUNT(*) OVER (PARTITION BY salary) AS salary_count
FROM employees
) t
WHERE salary_count > 1

--------------------------------------------------------
-- 20. Remove duplicates using ROW_NUMBER
--------------------------------------------------------
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY Name, Salary
               ORDER BY EmpID
           ) AS rn
    FROM Employees
) t
WHERE rn = 1;

-- END OF WINDOW FUNCTION CHALLENGES
