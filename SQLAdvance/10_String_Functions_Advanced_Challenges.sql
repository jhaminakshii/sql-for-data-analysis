/* =====================================================
   STRING FUNCTIONS – ADVANCED CHALLENGES (Q21–Q30)
   Author: Minakshi Jha
   Focus: Interview-level SQL + real-world data cleaning
   ===================================================== */

/*
Q21. Find employees whose first name
starts AND ends with the same character
Example: Anna, AshaA
*/
SELECT Name
FROM Employees
WHERE LEFT(LTRIM(RTRIM(Name)),1) =  
SUBSTRING(LTRIM(RTRIM(Name)) ,CHARINDEX(' ',LTRIM(RTRIM(Name)))-1, CHARINDEX(' ',LTRIM(RTRIM(Name))) )

/*

Q22. Find employees whose email domain is gmail.com
*/
SELECT Name,
 Email
 FROM Employees 
 WHERE RIGHT(Email, LEN('gmail.com')) = 'gmail.com'

/*
Q23. Count vowels in employee names
*/
SELECT Name,
       LEN(Name) - LEN(REPLACE(
           REPLACE(REPLACE(REPLACE(REPLACE(
           LOWER(Name), 'a', ''), 'e', ''), 'i', ''), 'o', ''), 'u', '')
       ) AS VowelCount
FROM Employees;

/*
Q24. Reverse employee names
*/
SELECT Name,
     REVERSE(Name) AS ReverseName  
FROM Employees;

/*
Q25. Find employees with duplicate first names
*/ WITH CTE AS (
    SELECT Name,
           ROW_NUMBER() OVER (
               PARTITION BY
               CASE
                   WHEN CHARINDEX(' ', TRIM(Name)) = 0
                   THEN TRIM(Name)
                   ELSE SUBSTRING(TRIM(Name), 1, CHARINDEX(' ', TRIM(Name)) - 1)
               END
               ORDER BY Name
           ) AS rn
    FROM Employees
)
SELECT * FROM CTE
WHERE rn > 1;
/*
 Using ROW_NUMBER instead of GROUP BY
 allows identifying and deleting duplicate records if needed
*/

/*
Q26. Replace special characters in names
(keep only alphabets and spaces)
*/
SELECT Name,
        TRANSLATE(Name, '012345678@#$%&*()^' , '                    ') AS CleanName
FROM Employees;

/*
Q27. Extract initials from full name
Example: Minakshi Jha → M.J
*/
SELECT Name,
       LEFT(Name, 1) + '.' +
       LEFT(
           RIGHT(Name, CHARINDEX(' ', REVERSE(Name)) - 1),
           1
       ) AS Initials
FROM Employees
WHERE CHARINDEX(' ', Name) > 0;

/*
Q28. Find employees whose name length
is above average name length
*/
SELECT Name, LEN(Name) AS NameLength
FROM Employees
WHERE LEN(Name) >
      (SELECT AVG(LEN(Name)) FROM Employees);

/*
Q29. Identify palindromic names
Example: Nitin, Anna
*/
SELECT Name
FROM Employees
WHERE LOWER(Name) = LOWER(REVERSE(Name));

/*
Q30. Normalize email IDs
(lowercase + trimmed)
*/
SELECT Email,
       LOWER(LTRIM(RTRIM(Email))) AS NormalizedEmail
FROM Employees;
