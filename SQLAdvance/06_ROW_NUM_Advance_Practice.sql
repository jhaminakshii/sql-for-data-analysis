/* =========================================================
   SQL ADVANCED PRACTICE: ROW_NUMBER() & WINDOW FUNCTIONS
   File: 06_ROW_NUM_Advance_Practice.sql
   Topics: ROW_NUMBER(), LEAD(), CTEs, DELETE, UPDATE
   Levels: Intermediate → Advanced
   Date: 21-Jan-2026
========================================================= */

---------------------------- LEVEL 2: INTERMEDIATE ----------------------------

/* 1️⃣ Remove Duplicate Records
   Table: Students(Name, Email)
   Goal: Remove duplicate emails, keep only one row per email
   Approach: ROW_NUMBER() + CTE + DELETE
*/
WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY Email ORDER BY Name) AS RN
    FROM Students
)
DELETE FROM CTE
WHERE RN > 1;

-- Explanation: Partitioned by Email, ordered by Name. Delete rows where RN > 1 to keep the first occurrence.

---------------------------------------------------

/* 2️⃣ Update Using ROW_NUMBER()
   Table: Orders(OrderID, OrderDate, OrderRank)
   Goal: Assign sequential OrderRank based on OrderDate
   Approach: ROW_NUMBER() + CTE + UPDATE
*/
WITH CTE AS (
    SELECT OrderID,
           ROW_NUMBER() OVER (ORDER BY OrderDate) AS RN
    FROM Orders
)
UPDATE O
SET O.OrderRank = C.RN
FROM Orders O
JOIN CTE C ON O.OrderID = C.OrderID;

-- Explanation: Window functions cannot be used directly in UPDATE. Compute ROW_NUMBER() in a CTE and join to update.

---------------------------------------------------

/* 3️⃣ Pagination Example
   Table: Employees(EmpID, Name, Salary)
   Goal: Fetch page 3 (page size = 10)
*/
WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY EmpID) AS RN
    FROM Employees
)
SELECT *
FROM CTE
WHERE RN BETWEEN 21 AND 30;

-- Dynamic page number
DECLARE @PageNo INT = 3,
        @PageSize INT = 10;

WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY Name, Salary) AS RN
    FROM Employees
)
SELECT *
FROM CTE
WHERE RN BETWEEN ((@PageNo - 1) * @PageSize + 1)
            AND (@PageNo * @PageSize);

-- Explanation: Use ROW_NUMBER() in CTE and calculate range using page number and size.

---------------------------------------------------

/* 4️⃣ Alternate Rows
   Goal: Fetch only even-numbered rows
*/
WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (ORDER BY EmpID, Name, Salary) AS RN
    FROM Employees
)
SELECT *
FROM CTE
WHERE RN % 2 = 0;

-- Explanation: Use modulus (%) on ROW_NUMBER() to select alternate rows.

---------------------------- LEVEL 3: ADVANCED ----------------------------

/* 5️⃣ Second Highest Salary per Department
   Table: Employees(EmpID, Name, Dept, Salary)
   Goal: Find 2nd highest salary in each department
*/
WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY Dept ORDER BY Salary DESC) AS RN
    FROM Employees
)
SELECT Dept, Salary
FROM CTE
WHERE RN = 2;

-- Note: Use DENSE_RANK() instead if you want to include ties.

---------------------------------------------------

/* 6️⃣ Delete Duplicate Records
   Table: Customers(CustomerID, MobileNo, CreatedDate)
   Goal: Keep earliest record per MobileNo, delete duplicates
*/
WITH CTE AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY MobileNo ORDER BY CreatedDate) AS RN
    FROM Customers
)
DELETE FROM CTE
WHERE RN > 1;

---------------------------------------------------

/* 7️⃣ Assign Custom Account Number
   Table: Employees(EMPID, AccountNo)
   Goal: Generate sequential account numbers like FD3Y-01-1, FD3Y-01-2
*/
DECLARE @code NVARCHAR(10) = 'FD3Y-01';

WITH CTE AS (
    SELECT EMPID,
           ROW_NUMBER() OVER (ORDER BY EMPID) AS RN
    FROM Employees
)
UPDATE e
SET e.AccountNo = @code + '-' + CAST(C.RN AS NVARCHAR(10))
FROM Employees e
JOIN CTE C ON e.EMPID = C.EMPID;

---------------------------------------------------

/* 8️⃣ Update Only NULL AccountNo Values
   Goal: Assign sequential account numbers only where AccountNo IS NULL
*/
WITH CTE AS (
    SELECT EMPID,
           ROW_NUMBER() OVER (ORDER BY EMPID) AS RN
    FROM Employees
    WHERE AccountNo IS NULL
)
UPDATE e
SET e.AccountNo = @code + '-' + CAST(C.RN AS NVARCHAR(10))
FROM Employees e
JOIN CTE C ON e.EMPID = C.EMPID;

-- Explanation: Only NULL values are selected in the CTE, then updated sequentially.

---------------------------------------------------

/* 9️⃣ Detect Gaps in Sequence Numbers
   Table: Orders(OrderID)
   Goal: Find missing order numbers
*/
USE SQLPractice;

CREATE TABLE Orders (OrderID INT);

INSERT INTO Orders
VALUES (1),(2),(4),(6),(7),(8),(9);

SELECT * FROM Orders;

WITH CTE AS (
    SELECT OrderID,
           LEAD(OrderID) OVER (ORDER BY OrderID) AS NextID
    FROM Orders
)
SELECT OrderID + 1 AS MissingData
FROM CTE
WHERE NextID IS NOT NULL
  AND NextID <> OrderID + 1;

DROP TABLE Orders;

-- Explanation: LEAD() checks next row. If next row is not consecutive, output the missing number.

---------------------------------------------------
-- END OF 06_ROW_NUM_Advance_Practice.sql
---------------------------------------------------
