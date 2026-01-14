
-- create database SQLPractice;

use SQLPractice

----Day 1 – Basics ----

-----  Create Table ----
Create table students (
StudentID int primary key,
name varchar(50),
age int,
department nvarchar(100)
)

----- Insert Data -----
Insert into students values 
(1,'Mini', 30,'IT' ),
(2,'Appu', 30,'IT' ),
(3,'Asmita', 30,'IT' ),
(4,'Abhi', 30,'IT' )

----- Update Table ------
update students set department = 'Medical'
where StudentID = 2

update students set department = 'Data'
where StudentID = 3

update students set department = 'Mechanical'
where StudentID = 4

update students set age = 32
where StudentID = 2

update students set age =23
where StudentID = 3

update students set age = 35
where StudentID = 4

----SELECT & WHERE ----

-- Select students with age > 25
  select * from students
  where age > 25

---- Add a column in student table name fee with values ---
 Alter Table students
 add  fee int ;

 -----update values to that column fee

update students set fee = 10000
where StudentID = 1

update students set fee = 10000
where StudentID = 2

update students set fee = 5000
where StudentID = 3

update students set fee = 50000
where StudentID = 4

-- Remove duplicate fee
select distinct fee from students 

-- students in IT with fee > 5000
select *  from students
where department = 'IT' and fee > 5000

---------------------------------------------------------------------

Create table employee (
EmpID int primary key,
Name varchar(50),
Department varchar(50),
Salary int);

INSERT INTO employee VALUES
(1, 'Alice', 'IT', 60000),
(2, 'Bob', 'HR', 45000),
(3, 'Charlie', 'IT', 50000),
(4, 'David', 'Sales', 70000),
(5, 'Eve', 'HR', 50000),
(6, 'Frank', 'IT', 60000),
(7, 'Grace', 'Sales', 40000);


