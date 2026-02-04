/* =====================================================
   STORED PROCEDURE – PRACTICE & INTERVIEW CHALLENGES
   Author: Minakshi Kumari
   Level: Beginner → Advanced
   Database: SQL Server (SSMS)
   ===================================================== */

USE SQLPractice;
GO

/* -----------------------------------------------------
   Table Used:
   Employees
   -----------------------------------------------------
   EmpID INT
   Name VARCHAR(100)
   Department VARCHAR(50)
   Salary INT
   City VARCHAR(50)
   HireDate DATE
----------------------------------------------------- */

--------------------------------------------------------
-- Challenge 1: Get all employees
--------------------------------------------------------
CREATE PROCEDURE sp_GetAllEmployees
AS 
BEGIN
SELECT * FROM employees
END;
EXEC sp_GetAllEmployees ;

--------------------------------------------------------
-- Challenge 2: Get employees by department
--------------------------------------------------------
CREATE PROCEDURE sp_EmpByDept
@Department nvarchar(50)
AS 
BEGIN
SELECT * FROM employees 
WHERE department = @Department 
END;
EXEC sp_EmpByDept  @Department = 'IT';

--------------------------------------------------------
-- Challenge 3: Get employees with salary greater than input
--------------------------------------------------------
CREATE PROCEDURE sp_EmpBySalary
@Salary INT
AS
BEGIN
SELECT * FROM employees
WHERE salary > @Salary
END;
EXEC sp_EmpBySalary @Salary = 50000 ;