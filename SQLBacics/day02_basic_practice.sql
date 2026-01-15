
---- Day2 SQL Basics Practice ----

create database SQLPractice;

use SQLPractice ;

create table employees (
	EmpID int primary key,
	Name varchar(50),
	department nvarchar(50),
	salary int 
);

Insert into employees  values 
(1,'Mini', 'IT', 25000),
(2, 'Bob', 'HR', 45000),
(3, 'Charlie', 'IT', 50000),
(4, 'David', 'Sales', 70000),
(5, 'Eve', 'HR', 50000),
(6, 'Frank', 'IT', 60000),
(7, 'Grace', 'Sales', 40000),
(8, 'Alice', 'IT', 60000),
(9,'Mini', 'IT', 25000);

select * from employees

----- Data Manupulation ----

 /* Write SQL that updates the salary column of the employees table
 by increasing each salary by 10% for
 those employees
 who have department as 'IT'
 */

 update employees set salary = salary + (salary*0.1)
 where department = 'IT'

----- Order By and TOP ---

-- Top 5 highest paid employees
select top 5 name,salary from employees
order by salary desc;

-- Order by multiple columns (Salary DESC, Name ASC)
select * from employees
order by salary desc,name;

----- Aggregates & GROUP BY ----

-- Count employees per department
select department, count(*) as EmpNumb
from employees
group by department

-- Departments with average salary > 50000
select department , AVG(salary) as AvgSalary
from employees
group by department
having AVG(salary) > 50000

-- Bonus: Maximum salary per department
select department, MAX(salary) as MaxSalary
from employees
group by department

-- Challenge 1: List employees in HR earning <= 50000
select * from employees
where department = 'HR' and salary <= 50000

-- Challenge 2: Top 3 highest salaries in Sales
select top 3 *
from employees
where department = 'Sales'
order by salary desc

-- Challenge 3: Count employees earning 50000 in each department
select department, count(*) as EmpCount 
from employees
where salary = 50000
group by department

/* 
I used WHERE to filter salary = 50000 before grouping, 
then grouped by department to count employees per department.
HAVING is only needed when filtering on aggregated values
*/


