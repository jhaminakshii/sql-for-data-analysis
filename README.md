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

## 🔤 SQL String Functions (Basic)

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

---

## 💼 How to Practice

1. Clone the repo:
```bash
git clone https://github.com/jhaminakshii/sql-for-data-analysis.git
