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
CREATE OR ALTER PROCEDURE sp_GetAllEmployees
AS
BEGIN
-- Improve code readability and execution speed
    SET NOCOUNT ON;

    SELECT *
    FROM Employees;
END;
GO

EXEC sp_GetAllEmployees;
GO

--------------------------------------------------------
-- Challenge 2: Get employees by department
--------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_GetEmployeesByDepartment
    @Department VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM Employees
    WHERE Department = @Department;
END;
GO

EXEC sp_GetEmployeesByDepartment 'IT';
GO

--------------------------------------------------------
-- Challenge 3: Get employees with salary greater than input
--------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_GetEmployeesByMinSalary
    @MinSalary INT
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM Employees
    WHERE Salary > @MinSalary;
END;
GO

EXEC sp_GetEmployeesByMinSalary 50000;
GO

--------------------------------------------------------
-- Challenge 4: Optional parameters (Department + Salary)
--------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_FilterEmployees
    @Department VARCHAR(50) = NULL,
    @Salary INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM Employees
    WHERE
        (@Department IS NULL OR Department = @Department)
        AND
        (@Salary IS NULL OR Salary = @Salary);
END;
GO
-- Filter by both
EXEC sp_FilterEmployees @department = 'IT', @Salary = 55000;

-- Filter only by department
EXEC sp_FilterEmployees @department = 'HR';

-- Filter only by salary
EXEC sp_FilterEmployees @Salary = 45000;

-- No filters, return all employees
EXEC sp_FilterEmployees;

GO

--------------------------------------------------------
-- Challenge 5: Count employees per department
--------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_CountEmployeesByDepartment
    @Department VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT Department, COUNT(*) AS EmployeeCount
    FROM Employees
    WHERE Department = @Department
    GROUP BY Department;
END;
GO

EXEC sp_CountEmployeesByDepartment 'IT';
GO

--------------------------------------------------------
-- Challenge 6: Insert new employee safely
--------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_InsertEmployee
    @EmpID INT,
    @Name VARCHAR(100),
    @Department VARCHAR(50),
    @Salary INT,
    @HireDate DATE,
    @City VARCHAR(50)
AS
BEGIN
    SET NOCOUNT ON;

 -- Check if employee exists or not
    IF EXISTS (SELECT 1 FROM Employees WHERE EmpID = @EmpID)
    BEGIN
        RAISERROR ('Employee already exists.', 16, 1);
        RETURN; -- stop execution immediately
    END;

    INSERT INTO Employees (EmpID, Name, Department, Salary, HireDate, City)
    VALUES (@EmpID, @Name, @Department, @Salary, @HireDate, @City);
END;
GO

EXEC sp_InsertEmployee
    11, 'Abhini Jha', 'Sales', 90000, '2025-02-08', 'Bardibas';
GO

--------------------------------------------------------
-- Challenge 7: Update employee salary
--------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_UpdateEmployeeSalary
    @EmpID INT,
    @Salary INT
AS
BEGIN
    SET NOCOUNT ON;

 -- Check if employee exists
    IF NOT EXISTS (SELECT 1 FROM Employees WHERE EmpID = @EmpID)
    BEGIN
        RAISERROR ('Employee does not exist.', 16, 1);
        RETURN;
    END;

-- Update salary
    UPDATE Employees
    SET Salary = @Salary
    WHERE EmpID = @EmpID;
END;
GO

EXEC sp_UpdateEmployeeSalary 11, 160000;
GO

--------------------------------------------------------
-- Challenge 8: Delete employee safely
--------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_DeleteEmployee
    @EmpID INT
AS
BEGIN
    SET NOCOUNT ON;

    IF NOT EXISTS (SELECT 1 FROM Employees WHERE EmpID = @EmpID)
    BEGIN
        RAISERROR ('Employee does not exist.', 16, 1);
        RETURN;
    END;
--- Delete employee with Employee ID
    DELETE FROM Employees
    WHERE EmpID = @EmpID;

-- confirmation message
    PRINT CONCAT('Employee with ID ', @EmpID, ' deleted successfully.');
END;
GO

EXEC sp_DeleteEmployee 3;
GO

--------------------------------------------------------
-- Challenge 9: Salary statistics by department
--------------------------------------------------------
CREATE OR ALTER PROCEDURE sp_DepartmentSalaryStatistics
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        Department,
        MAX(Salary) AS MaxSalary,
        AVG(Salary) AS AvgSalary,
        MIN(Salary) AS MinSalary
    FROM Employees
    GROUP BY Department;
END;
GO

EXEC sp_DepartmentSalaryStatistics;
GO

--------------------------------------------------------
-- END OF STORED PROCEDURE CHALLENGES
--------------------------------------------------------
