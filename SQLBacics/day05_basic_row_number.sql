
-------------- ROW_NUMBER() BASIC PRACTICE (Warm-up) -------------------

/* 
1️. Assign Row Numbers
Question:
From a table Employees(EmpID, Name, Salary), assign a row number to each employee.
*/
select EmpID,
 Name, 
 Salary,
 ROW_NUMBER() OVER (
 ORDER BY EmpID) AS RowNumb
 from Employees

/* 
2. Order by Salary
Question:
Assign row numbers ordered by Salary DESC.
*/
select EmpID,
 Name, 
 Salary,
 ROW_NUMBER() OVER (
 ORDER BY Salary DESC) AS RowNumb
 from Employees

 -- Q3. Fetch only the TOP 5 highest-paid employees using ROW_NUMBER()
 select TOP 5 EmpID,
 Name,
 Salary,
 ROW_NUMBER() OVER(ORDER BY Salary DESC) AS RowNumb
 from Employees

/* 
 4️. Reset Row Number
Question:
Assign row numbers but restart numbering for each department.
(Table: Employees(EmpID, Name, Dept, Salary))
*/
select EmpID,
 Name,
 Dept,
 Salary,
 ROW_NUMBER() OVER(
 PARTITION BY DEPT ORDER BY Salary DESC) AS RowNumb
 from Employees
