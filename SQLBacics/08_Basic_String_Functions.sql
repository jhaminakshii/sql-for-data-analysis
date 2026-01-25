/* =====================================================
   BASIC STRING FUNCTIONS PRACTICE (Q1–Q10)
   Author: Minakshi Jha
   Purpose: SQL String Manipulation Fundamentals
   ===================================================== */

/*
Q1. Find length of employee names
*/
SELECT Name, LEN(Name) AS NameLength
FROM Employees;

/*
Q2. Convert employee names to uppercase
*/
UPDATE Employees
SET Name = UPPER(Name);

/*
Q3. Extract first 3 characters of employee name
*/
SELECT Name,
       SUBSTRING(Name, 1, 3) AS First3Chars
FROM Employees;

-- Alternative
SELECT Name,
       LEFT(Name, 3) AS First3Chars
FROM Employees;

/*
Q4. Extract last 4 characters of employee name
*/
SELECT Name,
       RIGHT(Name, 4) AS Last4Chars
FROM Employees;

/*
Q5. Remove leading and trailing spaces from names
*/
SELECT Name,
       LTRIM(RTRIM(Name)) AS TrimmedName
FROM Employees;

/*
Q6. Replace spaces with underscore
*/
SELECT Name,
       REPLACE(Name, ' ', '_') AS ModifiedName
FROM Employees;

/*
Q7. Find names starting with letter 'A'
*/
SELECT Name
FROM Employees
WHERE Name LIKE 'A%';

/*
Q8. Find names containing 'ra'
*/
SELECT Name
FROM Employees
WHERE Name LIKE '%ra%';

/*
Q9. Find names longer than 10 characters
*/
SELECT Name
FROM Employees
WHERE LEN(Name) > 10;

/*
Q10. Count characters in email after trimming spaces
*/
SELECT EmailID,
       LEN(TRIM(EmailID)) AS EmailCharCount
FROM Employees;
