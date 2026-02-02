# SQL for Data Analysis

This repository contains my SQL practice exercises, progressing from **basic queries** 
to **advanced SQL topics** including window functions and real-world scenarios, aimed at strengthening database querying skills for **Data Analysis** and **Data Engineering** roles.


I’m using **SQL Server (SSMS)** to practice real-world scenarios and interview-style challenges.

---

## 📌 Topics Covered (Up to Today)

### 🧰 Day 1–3 (Basics)
- `SELECT`, `WHERE`, `DISTINCT`
- `ORDER BY`, `TOP`
- Aggregations: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- `GROUP BY`, `HAVING`

### Practice File
 📄 `SQLBacics/day04_advanced_sql_challenges.sql` 
 📄 `SQLBacics/day05_basic_row_number.sql`

### 🧠 Day 4–5 (Intermediate & Advanced)
- Wildcards (`LIKE`) and pattern matching
- `IN`, `BETWEEN`
- Column Aliases
- All types of JOINs (`INNER`, `LEFT`, `RIGHT`, `FULL`)
- `UNION` vs `UNION ALL`
- `EXISTS` clause
- **ROW_NUMBER() & Window Functions**
  - Remove duplicate records using `ROW_NUMBER()`
  - Update tables sequentially using `ROW_NUMBER()`
  - Pagination
  - Alternate row selection
  - Second highest salary per department
  - Delete duplicate records keeping earliest entries
  - Generate custom account numbers
  - Update only `NULL` values sequentially
  - Detect gaps in sequence numbers using `LEAD()`

### Practice File
 📄 `SQLBacics/day04_advanced_sql_challenges.sql` 
 📄 `SQLBacics/day05_basic_row_number.sql`

### 🧠 Day (6-7) – Window Functions (Advanced SQL)
- ROW_NUMBER, RANK, DENSE_RANK
- PARTITION BY
- LAG, LEAD
- NTILE
- FIRST_VALUE
- Running totals
- Rolling averages

Skills Demonstrated:
- Analytical queries
- Department-wise analysis
- Trend and comparison logic
- Interview-level SQL problem solving

### Practice File
 📄 `SQLAdvance/06_ROW_NUM_Advance_Practice.sql` 
 📄 `SQLAdvance/07_Window_Functions_Challenges.sql`

### 🧠 Day 8 - SQL String Functions (Basic)

Practiced essential SQL string manipulation functions with real-world use cases:

### Topics Covered
- LEN(), TRIM(), LTRIM(), RTRIM()
- UPPER(), LOWER()
- SUBSTRING(), LEFT(), RIGHT()
- LIKE with wildcards
- REPLACE()
- Pattern searching
- CHARINDEX()

### Practice File
📄 `SQLBasics/08_Basic_String_Functions.sql`

These queries focus on cleaning, transforming, and validating textual data — a critical skill for Data Analysts and SQL Developers.

### 🧠 Day 9 - SQL String Functions (Advanced)

Advanced string manipulation using real-world employee and email data.

### Topics Covered
- CHARINDEX(), PATINDEX()
- SUBSTRING(), LEFT(), RIGHT()
- REVERSE()
- Email parsing & masking
- Removing extra spaces
- Detecting invalid data
- Word count logic
- Conditional string handling with CASE
- CTE + String Functions

### Practice File
📄 `SQLBasics/09_Advanced_String_Functions.sql`

These exercises focus on data cleaning, validation, and transformation — essential skills for Data Analysts, SQL Developers, and ETL roles.

### 🧠 Day 10 - SQL String Functions – Advanced Challenges 

These queries focus on complex string analysis and interview-level logic.

### Key Skills Demonstrated
- Pattern-based string comparison
- Vowel counting logic
- Email domain analysis
- Name normalization & cleansing
- Initial extraction
- Duplicate detection using strings
- Subqueries with string functions
- Real-world data validation

### Practice File
📄 `SQLAdvance/10_String_Functions_Advanced_Challenges.sql`

### 🧠 Day 11 - Subqueries in SQL

This section covers **all major types of SQL subqueries** with real-world and interview-focused examples.

### Topics Covered
- Single-row subqueries
- Multi-row subqueries (`IN`)
- Scalar subqueries
- Subqueries in `FROM` (Derived Tables)
- Correlated subqueries
- `EXISTS` vs `NOT EXISTS`
- Second highest salary
- Department-wise salary comparisons
- Real-world use cases with Orders & Employees

### Practice File
📄 `SQLAdvanced/11_Subqueries_Fundamentals.sql`

### 🧠 Day 12 – Indexes (Clustered & Non-Clustered)

Topics Covered:
- Clustered Index
- Non-Clustered Index
- Composite Index
- Covering Index
- Heap tables
- Index performance trade-offs

Hands-on:
- Created and analyzed indexes
- Practiced real interview-style challenges
- Learned when to add and remove indexes

### Practice File
📄 `SQLAdvanced/12_Indexes.sql`

---

## 💼 How to Practice

1. Clone the repo:
```bash
git clone https://github.com/jhaminakshii/sql-for-data-analysis.git
