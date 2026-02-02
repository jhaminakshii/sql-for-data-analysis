/* =====================================================
   SQL INDEX PRACTICE – CLUSTERED & NON-CLUSTERED
   Author: Minakshi Kumari
   Level: Interview / Real-world
   ===================================================== */

USE SQLPractice;
GO

/* -----------------------------------------------------
   Table Assumed:
   Employees
   -----------------------------------------------------
   EmpID (INT)
   Name (VARCHAR)
   Department (VARCHAR)
   Salary (INT)
   HireDate (DATE)
----------------------------------------------------- */

SELECT * FROM Employees;

---- Adding City COLUMN to my existing table - employees
Alter table Employees 
ADD City nvarchar(50);

--- updating Values
update employees set City = 'kathmandu' where EmpID in (1,3)
update employees set City = 'Pokhara' where EmpID in (2,6)
update employees set City = 'Janakpur' where EmpID in (4,5)

-- 🔹 Challenge 1: Identify Current Indexes on Employees Table
EXEC sp_helpindex 'Employees';
-- I check existing one before creating new one

--🔹 Challenge 2: Create Clustered Index on EmpID
CREATE CLUSTERED INDEX idx_EmpId
ON Employees(EmpId);
--- Only one clustered index and Data is physically sorted

-- 🔹 Challenge 3: Create Non-Clustered Index on Salary
CREATE NONCLUSTERED INDEX idx_salary
ON Employees(Salary);
--- Faster Salary-based searches and Separate structure from table

-- 🔹 Challenge 4: Query That Uses Salary Index
SELECT Salary  FROM employees
where salary = 55000;
--- This query will use INDEX SEEK on non-clustered index.

-- 🔹 Challenge 5: Composite Non-Clustered Index
CREATE NONCLUSTERED INDEX idx_dept_salary
ON Employees(department,salary);
-- Useed when both columns are filtered and order matters.

-- 🔹 Challenge 6: Query Using Composite Index
SELECT * FROM employees
where department = 'IT' and salary > 50000
-- SQL Server can efficiently filter using composite index.

-- 🔹 Challenge 7: Covering Index (ADVANCED ⭐)
CREATE NONCLUSTERED INDEX idx_covering_dept
ON Employees (department) 
INCLUDE(Name, salary);

SELECT Name,salary FROM employees
where department = 'IT'
--This is a covering index — query runs without key lookup

--🔹 Challenge 8: Index on City (Low Selectivity Test)
CREATE NONCLUSTERED INDEX idx_city
ON employees (City);
-- City has low selectivity so Index may or may not be useful.
-- Useful only when filtered with other columns

-- Challenge 9: Drop Unused Index
DROP INDEX idx_city ON Employees;
-- Unused Index slow down INSERT/UPDATE.

-- 🔹 Challenge 10: Heap Table Example
DROP INDEX idx_dept_salary ON Employees;
DROP INDEX idx_salary ON  Employees;
-- DROP INDEX PK__employee__AF2DBA7925099BA8 ON  Employees; -- Cannot DROP
-- Cannot DROP an index directly if it is used by a PRIMARY KEY or UNIQUE constraint.

-- Correct way - drop the CONSTRAINT, not the index
ALTER TABLE Employees 
DROP CONSTRAINT PK__employee__AF2DBA7925099BA8 ;

--Table without Indexes = HEAP, Data unordered, slower reads

-- 🔹 Challenge 11: Primary Key as NON-CLUSTERED
ALTER TABLE Employees
ADD CONSTRAINT pk_employees 
PRIMARY KEY
NONCLUSTERED(EmpID);
-- Primary key does NOT have to be clustered.

-- 🔹 Challenge 12: Compare Index vs No Index (Thinking)
 -- With clustered index → Index Seek
 --	Without → Table Scan



















