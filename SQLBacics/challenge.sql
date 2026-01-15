/* =====================================================
   SQL INTERVIEW PRACTICE – DAYS 1–2
   Topics:
   - SELECT, WHERE, DISTINCT
   - ORDER BY, TOP
   - COUNT, SUM, AVG, MIN, MAX
   - GROUP BY, HAVING
   ===================================================== */

-- Assume table: Employees
-- Columns: EmpID, Name, Department, Salary

/* -------------------------------
   BASIC SELECT & WHERE
-------------------------------- */

-- 1. Display all employees whose salary is greater than 50,000.
select * from employees where salary > 50000;

-- 2. Display only unique departments from the Employees table.
select distinct(department) from employees;

-- 3. List employee names and salaries where salary is between 45,000 and 65,000.
select name,salary from employees
where salary between 45000 and 65000;

-- 4. Find employees who belong to the IT department and earn more than 55,000.
select * from employees
where department = 'IT' and salary > 55000

/* -------------------------------
   ORDER BY & TOP
-------------------------------- */

-- 5. Display the top 5 highest-paid employees.
select top 5 name,salary from employees
order by salary desc ;

-- 6. Display the lowest 3 paid employees.
select top 3 * from employees
order by salary asc ;

-- 7. Display all employees ordered by Department (ASC) 
--    and within each department by Salary (DESC).
select * from employees
order by department asc ,salary desc;


/* -------------------------------
   AGGREGATE FUNCTIONS
-------------------------------- */

-- 8. Find the total number of employees.
select count(*) as EmpNumb from employees

-- 9. Find the minimum, maximum, and average salary from the Employees table.
select min(salary) as MinSalary,
	max(salary) as MaxSalary,
	avg(salary) as AvgSalary
	from employees

/* -------------------------------
   GROUP BY
-------------------------------- */

-- 10. Count the number of employees in each department.
select department,count(*) as EmpCount
from employees
group by department;

-- 11. Find the average salary of employees in each department.
select department,AVG(salary) as AvgSalary
from employees
group by department;

-- 12. Find the total salary paid by each department.
select department,sum(salary) as TotalSalary
from employees
group by department;

/* -------------------------------
   GROUP BY + HAVING (INTERVIEW FAVORITES)
-------------------------------- */

-- 13. Display departments that have more than 2 employees.
select department,count(*) as EmpCount 
from employees
group by department
having count(*) > 2;

-- 14. Display departments where the average salary is greater than 50,000.
select department , AVG(salary) as AvgSalary
from employees
group by department
having AVG(salary) > 50000 ;

-- 15. Display departments where the total salary is greater than 120,000.
select department , SUM(salary) as TotalSalary
from employees
group by department
having SUM(salary) > 120000 ;

/* -------------------------------
   BONUS THINKING QUESTIONS
-------------------------------- */

-- 16. Count how many employees earn exactly 50,000 in each department.
select department ,  count(*) as EmpCount
from employees
where salary = 50000
group by department

-- 17. Display departments ordered by highest average salary first.
select  department,AVG(salary) as AvgSalary
from employees
group by department
order by  AVG(salary) desc ;

-- END OF PRACTICE FILE
