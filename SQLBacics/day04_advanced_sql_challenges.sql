/* =====================================================
   ADVANCED SQL PRACTICE
   Topics Covered:
   - LIKE (Wildcards)
   - IN, BETWEEN
   - Aliases
   - ALL JOINs
   - UNION vs UNION ALL
   - GROUP BY + HAVING
   - EXISTS
   ===================================================== */

   ---------- Table Assumes ---------
   /* 
   1.tableName - Employees
     EmpID, Name, DepartmentID, Salary, City

	2.tableName - Departments
    DepartmentID, DepartmentName
   */

--------------------------------------------------------
-- WILDCARDS (LIKE)
--------------------------------------------------------

-- 1. Find employees whose name starts with 'A'
select * from employees
where name like 'A%'

-- 2. Find employees whose name ends with 'a'
select * from employees
where name like '%a'

-- 3. Find employees whose name contains 'an'
select * from employees
where name like '%an%'

--------------------------------------------------------
-- IN & BETWEEN
--------------------------------------------------------

-- 4. Find employees working in IT, HR, or Sales
select e.* 
from employees e
join Departments d
on e.DepartmentID = d.DepartmentID
where d.DepartmentName in ('IT', 'HR', 'Sales')

-- 5. Find employees earning between 40,000 and 70,000
select * from employees
where Salary between 40000 and 70000 ;

--------------------------------------------------------
-- ALIASES
--------------------------------------------------------

-- 6. Display employee name as EmployeeName and salary as MonthlySalary
select name as EmployeeName , salary as MonthlySalary
from employees ;

--------------------------------------------------------
-- JOINs (ALL TYPES)
--------------------------------------------------------

-- 7. INNER JOIN – employee name with department name
select e.name , d.DepartmentName
from Employees e
inner join Departments d
on e.DepartmentID = d.DepartmentID ;

-- 8. LEFT JOIN – all employees even if no department
select e.name , d.DepartmentName
from Employees e
left join Departments d
on e.DepartmentID = d.DepartmentID ;

-- 9. RIGHT JOIN – all departments even if no employees
select d.DepartmentName, e.name 
from Employees e
right join Departments d
on e.DepartmentID = d.DepartmentID ;

-- 10. FULL JOIN – all employees and all departments
select e.name , d.DepartmentName
from Employees e
full join Departments d
on e.DepartmentID = d.DepartmentID ;

--------------------------------------------------------
-- UNION & UNION ALL
--------------------------------------------------------

-- 11. Combine employees from Kathmandu and Pokhara (remove duplicates)
select Name, City from employees
where city = 'Kathmandu'
union
select * from employees
where city = 'Pokhara'

-- 12. Combine employees from Kathmandu and Pokhara (keep duplicates)
select Name, City from employees
where city = 'Kathmandu'
union all
select Name, City from employees
where city = 'Pokhara'

--------------------------------------------------------
-- GROUP BY & HAVING
--------------------------------------------------------

-- 13. Count employees in each department
select DepartmentID,count(*) 
from employees
group by DepartmentID

-- 14. Departments having more than 2 employees
select DepartmentID,count(*) 
from employees
group by DepartmentID
having count(EmpID) > 2

-- 15. Departments with average salary > 50,000
select DepartmentID,AVG(salary) 
from employees
group by DepartmentID
having AVG(salary) > 50000

--------------------------------------------------------
-- EXISTS (VERY IMPORTANT FOR INTERVIEWS)
--------------------------------------------------------

-- 16. Find departments that have at least one employee
select * from departments d
where exists (select 1 from employees e
where e.DepartmentID = d.DepartmentID)

-- 17. Find employees who belong to an existing department
select * from employees e
where exists (select 1 from departments d
where e.DepartmentID = d.DepartmentID)

-- END OF ADVANCED PRACTICE
