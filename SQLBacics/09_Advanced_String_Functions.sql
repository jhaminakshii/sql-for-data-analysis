/* =====================================================
   ADVANCED STRING FUNCTIONS PRACTICE (Q11–Q20)
   Author: Minakshi Jha
   Purpose: Real-world string parsing & validation
   ===================================================== */

/*
Q11. Extract First Name from Full Name
Handles single-word and multi-word names safely
*/
SELECT Name,
       CASE
           WHEN CHARINDEX(' ', Name) = 0 THEN Name
           ELSE SUBSTRING(Name, 1, CHARINDEX(' ', Name) - 1)
       END AS FirstName
FROM Employees;

/*
Q12. Extract Last Name from Full Name
*/
SELECT Name,
       CASE
           WHEN CHARINDEX(' ', Name) = 0 THEN Name
           ELSE RIGHT(
               LTRIM(RTRIM(Name)),
               CHARINDEX(' ', REVERSE(LTRIM(RTRIM(Name)))) - 1
           )
       END AS LastName
FROM Employees;

/*
Q13. Split Email into Username and Domain
*/
SELECT Email,
       SUBSTRING(Email, 1, CHARINDEX('@', Email) - 1) AS UserName,
       SUBSTRING(Email, CHARINDEX('@', Email) + 1, LEN(Email)) AS Domain
FROM Employees;

/*
Q14. Find Invalid Email IDs (missing '@')
*/
SELECT Email
FROM Employees
WHERE Email NOT LIKE '%@%';

/*
Q15. Replace multiple spaces with a single space
*/
SELECT Name,
       LTRIM(RTRIM(
           REPLACE(REPLACE(REPLACE(Name, '  ', ' '), '  ', ' '), '  ', ' ')
       )) AS CleanedName
FROM Employees;

/*
Q16. Mask Email IDs
Example: minakshi@gmail.com → min****@gmail.com
*/
SELECT Email,
       SUBSTRING(Email, 1, 3) + '****' +
       SUBSTRING(Email, CHARINDEX('@', Email), LEN(Email)) AS MaskedEmail
FROM Employees;

/*
Q17. Find names containing numeric characters
*/
SELECT Name
FROM Employees
WHERE Name LIKE '%[0-9]%';

/*
Q18. Extract Last Name length = exactly 3 characters
*/
WITH CTE AS (
    SELECT Name,
           CASE
               WHEN CHARINDEX(' ', Name) = 0 THEN Name
               ELSE RIGHT(
                   LTRIM(RTRIM(Name)),
                   CHARINDEX(' ', REVERSE(LTRIM(RTRIM(Name)))) - 1
               )
           END AS LastName
    FROM Employees
)
SELECT *
FROM CTE
WHERE LEN(LastName) = 3;

/*
Q19. Count number of words in employee names
*/
SELECT Name,
       LEN(Name) - LEN(REPLACE(Name,' ',''))+1 AS WordCount
FROM Employees;

/*
Q20. Normalize Names (Uppercase + Trimmed)
Useful before comparisons or joins
*/
SELECT Name,
       UPPER(LTRIM(RTRIM(Name))) AS NormalizedName
FROM Employees;
