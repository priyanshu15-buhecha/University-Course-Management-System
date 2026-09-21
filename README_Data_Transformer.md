# PR. 2 — Data Transformer

## Project Overview

**Data Transformer** is a PostgreSQL SQL practice project built around three related datasets:

- `customers` — customer identity, email, and registration information.
- `orders` — customer orders, dates, and total amounts.
- `employees` — employee details, departments, hire dates, and salaries.

The project demonstrates relational joins, subqueries, date functions, string functions, window functions, and `CASE` expressions. The source SQL creates the three tables, inserts sample data, displays the base tables, and then runs **17 transformation/query exercises**. fileciteturn0file0L1-L5

## Source File

**Original file:** `PR. 2 Data Transformer.sql`

The source defines the `customers`, `orders`, and `employees` tables and their sample records. The `orders.customerid` column references `customers.customerid`, establishing the customer-order relationship. fileciteturn0file0L21-L27

## Tools / SQL Concepts Used

- PostgreSQL
- `CREATE TABLE`
- `INSERT INTO`
- `SELECT`
- `INNER JOIN`
- `LEFT JOIN`
- `RIGHT JOIN`
- `FULL OUTER JOIN`
- Subqueries with `AVG()`
- `EXTRACT()`
- Date arithmetic
- `TO_CHAR()`
- `CONCAT()`
- `REPLACE()`
- `UPPER()` / `LOWER()`
- `TRIM()`
- Window functions: `SUM() OVER`, `RANK() OVER`
- `CASE WHEN`

## Database Structure

### 1. Customers

| Column | Type | Purpose |
|---|---|---|
| `customerid` | `INT` | Primary key |
| `firstname` | `VARCHAR(50)` | Customer first name |
| `lastname` | `VARCHAR(50)` | Customer last name |
| `email` | `VARCHAR(100)` | Customer email |
| `registrationdate` | `DATE` | Registration date |

The source creates `customerid` as the primary key. fileciteturn0file0L1-L6

### 2. Orders

| Column | Type | Purpose |
|---|---|---|
| `orderid` | `INT` | Primary key |
| `customerid` | `INT` | Related customer |
| `orderdate` | `DATE` | Order date |
| `totalamount` | `DECIMAL(10,2)` | Order value |

The `orders.customerid` field is defined as a foreign key referencing `customers.customerid`. fileciteturn0file0L21-L27

### 3. Employees

| Column | Type | Purpose |
|---|---|---|
| `employeeid` | `INT` | Primary key |
| `firstname` | `VARCHAR(50)` | Employee first name |
| `lastname` | `VARCHAR(50)` | Employee last name |
| `department` | `VARCHAR(50)` | Department |
| `hiredate` | `DATE` | Hiring date |
| `salary` | `DECIMAL(10,2)` | Salary |

The employee table and its salary field are defined in the source SQL. fileciteturn0file0L46-L53

## How to Run

1. Open PostgreSQL / pgAdmin.
2. Open a new SQL Query window.
3. Paste or open `PR. 2 Data Transformer.sql`.
4. Execute the table creation and insert statements first.
5. Run the base `SELECT *` statements to verify the data.
6. Run queries 1–17 individually.
7. Compare your database output with the screenshots in this package.

> **Note:** Query 8 uses `CURRENT_DATE`, so the `dayspassed` value changes with the date on which you execute the query. The included output screenshot uses **2026-09-21** as the reference execution date.

## Query-by-Query Explanation

### Query 01 — INNER JOIN

**Purpose:** Returns only customers who have matching orders.

**Concept:** `INNER JOIN` keeps rows where the join condition matches in both tables.

**Source query:** `customers` is joined to `orders` using `customerid`. fileciteturn0file0L77-L78

**Output:** `query_01_output.png`

### Query 02 — LEFT JOIN

**Purpose:** Returns every customer and any matching order.

**Concept:** A `LEFT JOIN` keeps all rows from the left table, even when no matching row exists on the right.

**Source query:** `customers` is the left table and `orders` is joined using `customerid`. fileciteturn0file0L80-L81

**Output:** `query_02_output.png`

### Query 03 — RIGHT JOIN

**Purpose:** Returns every order and the customer information that matches it.

**Concept:** A `RIGHT JOIN` keeps all rows from the right table.

**Source query:** `orders` is the right side of the join. fileciteturn0file0L83-L84

**Output:** `query_03_output.png`

### Query 04 — FULL OUTER JOIN

**Purpose:** Combines all customers and all orders, including unmatched rows.

**Concept:** `FULL OUTER JOIN` preserves rows from both sides of the join.

**Source query:** The source uses a full outer join on `customerid`. fileciteturn0file0L86-L87

**Output:** `query_04_output.png`

### Query 05 — Subquery with AVG()

**Purpose:** Finds customers associated with orders whose amount is greater than the average order amount.

**Concept:** The inner query calculates `AVG(totalamount)`, and the outer query compares each order amount against that value.

**Source:** fileciteturn0file0L89-L94

**Output:** `query_05_output.png`

### Query 06 — Above-Average Salary

**Purpose:** Finds employees whose salary is greater than the average employee salary.

**Concept:** A subquery calculates the average salary and the outer query filters employees above it.

**Source:** fileciteturn0file0L96-L97

**Output:** `query_06_output.png`

### Query 07 — EXTRACT()

**Purpose:** Separates the year and month from each order date.

**Concept:** `EXTRACT()` retrieves date components such as year and month.

**Source:** fileciteturn0file0L99-L100

**Output:** `query_07_output.png`

### Query 08 — Date Arithmetic

**Purpose:** Calculates the number of days passed between each order date and the current date.

**Concept:** PostgreSQL date subtraction returns the elapsed number of days between two dates.

**Source:** fileciteturn0file0L102-L103

**Output:** `query_08_output.png`

### Query 09 — TO_CHAR()

**Purpose:** Converts order dates into a formatted text representation.

**Concept:** `TO_CHAR()` formats date values according to a supplied pattern.

**Source:** fileciteturn0file0L105-L106

**Output:** `query_09_output.png`

### Query 10 — CONCAT()

**Purpose:** Creates a full name by combining first name and last name.

**Concept:** `CONCAT()` combines multiple values into one string.

**Source:** fileciteturn0file0L108-L109

**Output:** `query_10_output.png`

### Query 11 — REPLACE()

**Purpose:** Replaces the employee first name `krish` with `krishna` in the query result.

**Concept:** `REPLACE()` substitutes one string with another.

**Source:** fileciteturn0file0L111-L112

**Output:** `query_11_output.png`

### Query 12 — UPPER() and LOWER()

**Purpose:** Displays employee first names in uppercase and last names in lowercase.

**Concept:** `UPPER()` converts text to uppercase; `LOWER()` converts text to lowercase.

**Source:** fileciteturn0file0L114-L115

**Output:** `query_12_output.png`

### Query 13 — TRIM()

**Purpose:** Removes leading and trailing spaces from email values.

**Concept:** `TRIM()` removes surrounding whitespace from a string.

**Source:** fileciteturn0file0L117-L118

**Output:** `query_13_output.png`

### Query 14 — Running Total

**Purpose:** Calculates a cumulative total of order amounts in order-date sequence.

**Concept:** `SUM(totalamount) OVER (ORDER BY orderdate)` is a window-function pattern for a running total.

**Source:** fileciteturn0file0L120-L121

**Output:** `query_14_output.png`

### Query 15 — RANK()

**Purpose:** Assigns a rank to orders based on order date.

**Concept:** `RANK() OVER (ORDER BY orderdate)` generates ranking values according to the specified ordering.

**Source:** fileciteturn0file0L123-L124

**Output:** `query_15_output.png`

### Query 16 — CASE Discount Logic

**Purpose:** Categorises orders into discount levels based on their amount.

**Rules in the source:**

- Above `1000` → `10% discount`
- Above `500` → `5% discount`
- Otherwise → `no discount`

**Source:** fileciteturn0file0L126-L128

**Output:** `query_16_output.png`

### Query 17 — CASE Salary Categories

**Purpose:** Categorises employees according to salary.

**Rules in the source:**

- Salary `>= 80000` → `High`
- Salary `>= 60000` → `Medium`
- Otherwise → `Low`

**Source:** fileciteturn0file0L130-L131

**Output:** `query_17_output.png`

## Output Screenshot Naming

All output screenshots use a consistent, submission-friendly naming format:

```text
query_01_output.png
query_02_output.png
query_03_output.png
query_04_output.png
query_05_output.png
query_06_output.png
query_07_output.png
query_08_output.png
query_09_output.png
query_10_output.png
query_11_output.png
query_12_output.png
query_13_output.png
query_14_output.png
query_15_output.png
query_16_output.png
query_17_output.png
```

## Base Data Verification

The source also includes three simple verification queries:

```sql
SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM employees;
```

These are included in the uploaded SQL before the numbered exercises. fileciteturn0file0L70-L74

## Learning Outcome

After completing this project, the main demonstrated skills are:

1. Creating relational tables.
2. Working with primary and foreign keys.
3. Joining related tables.
4. Filtering with subqueries and aggregate values.
5. Extracting and formatting dates.
6. Manipulating strings.
7. Creating running totals and ranks with window functions.
8. Applying conditional business logic using `CASE`.

## Project Files

| File | Description |
|---|---|
| `PR. 2 Data Transformer.sql` | Original SQL project |
| `README.md` | Detailed project explanation and query guide |
| `README.pdf` | PDF version of this README |
| `query_01_output.png` – `query_17_output.png` | Numbered query output screenshots |

---
**Project:** PR. 2 — Data Transformer  
**Database:** PostgreSQL  
**Queries:** 17  
**Prepared from the uploaded SQL source**
