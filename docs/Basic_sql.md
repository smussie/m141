# New Clauses and Operators in SQL
## Filtering
- Reduce the number of records you retrive
- Increase query performance
- Reduce the strain on the client applications
- Governance limitations

### WHERE
Syntax :
```sql
SELECT column_name, column_name, FROM table_name WHERE column_name  opetator value ;
```
**Operators** : =,<>(exclude),>,<,>=,<=,BETWEEN 15 AND 80, IS NULL
**NULL** → Means there is actually no data in this column.

Difference between use of the IN and BETWEEN operators
### IN
spceifies a range of conditions, comma delimited list of values
enclosed in ()
- Executes faster the OR
- Can contain another SELECT
- long list of options
- don't have to think about the order with IN as with OR
### OR
DBMS will not evaluate the second conditions in a WHERE clause if the first condition is met
WHERE (Name = "Vacume" OR "Legume") AND UnitPrice > 15;
SQL processes AND before OR

### NOT
Is a way to exclude eg. WHERE NOT City='london' And NOT city="Seattle";
### Wildcards
use %
%word ends with word
word% anything after the word
%word% grabs anything before and after word
e.g t%@gmail.com or %@gmail.com
wildcard will not much nullvalues
_ Wild card eg. _pizy → spizy or mpizy
Bracker [] wildcard : doesn't work with SQlite, but is used to specify a set of characters in a specific location.
Sorting data
### LIKE
**ORDERED BY**
Takes the name of one or more columns separated by comma. Can sort by a column not retrived, and must always be the last clause in a select statement.
**DESC** descending order
**ASC** ascending order
**GROUP BY; HAVING**
**GROUP BY** clauses can contain multiple columns.
- Every column is your SELECT statement must be present in a GROUP BY clauses, except for aggregated calculations.
- NULLs will be greouped together if your GROUP BY column contains NULLs.
- **WHERE** does not work for groups because it filters on rows,it filters before data is grouped. Instead use HAVING clause to filter for groups, it filters after data is grouped. But rows eliminated by the WHERE clause will not be included in the group.
```sql
SELECT CustomerID, COUNT (*) AS orders FROM Orders GROUP BY CustomerID GROUP BY SupplierID HAVING COUNT (*) >=2;
```
## Math operators
### Aggregate math functions
With aggregate functions if the word DISTINCT is not specified, ALL is assumed. We cannot use DISTINCT on COUNT(*). And there is no value to use with

+ **MIN** -  is used to find the minimum value or lowest value of a column or expression.
+ **MAX** -  is used to find the maximum value or highest value of a certain column or expression
+ **AVERAGE** -  calculates the average value of a column of numeric type. It returns the average of all non NULL values.
+ **COUNT** -  returns the number of rows in a table satisfying the criteria specified in the WHERE clause. It sets the number of rows or non NULL column values.
    SQL SYNTAX: COUNT(*), COUNT([ALL|DISTINCT] expression)

```sql
SELECT COUNT (*) AS total_customers FROM Customers ;
COUNT(*) - This counst all the rows in a table containing values or NULL vaulues.
SELECT COUNT(CustomersID) AS total_customers FROM Customers ;
Count(column) - This counts all the rows ina specific column ignoring the NULL values.
MAX and MIN Functions
NULL values are ignored by these functions.
SELECT MAX(UnitPrice) AS max_prod_price, MIN(UnitPrice) AS min_prod_price FROM Products
SUM
SELECT SUM(UnitPrice*UnitsInStock) AS total_price FROM products WHERE SupplierID = 23
```

# Subqueries and Joins
## Subqueries
Queries embedded into other queries
Relational databases store data in multiple tables
Subqueries merge data from multiple sources together
Helps getting information from multiple tables.
```sql
SELECT customerID, companyName, Region FROM Customers
WHERE customerID in (SELECT customerID FROM Orders WHERE
Freight > 100) ;
```
* Always perform the innermost SELECT portion first.
* There is no limit to the number of subqueries you can have, but performance slows when you nest too deeply.
* Subqueries selects can only retrieve a single column.
www.poorsql.com
```sql
SELECT COUNT (*) AS orders FROM Orders
WHERE customer_id = '143569' ;
SELECT customer_name
	,customer_state
	(SELECT COUNT (*) AS orders
	FROM Orders
	WHERE Orders.customer_id = Customer.customer_id) AS orders
FROM customers
ORDER BY Customers_name
```

## Joins
Benefits of Breaking Data into tables
- Efficient Storage
- Easier manipulation
- Greater scalability
- Logically models a process
- Tables are related through common values (keys)
Joins associate correct records from each table on the fly.
It allows data retrieval from multiple tables in one query.
Joins are not physical – they persist for the duration of the query execution.

### Cartesian joins (Cross joins)
Joins each row from the first table joins with all the rows of another table.
__Syntax :__
SELECT product_name, unitPrice, CompanyName FROM suppliers CROSS JOIN products ;
The output will be the number of joins in the first table multiplied by the number of rows in the second table.

### Inner join
Selects records that have matching values in both tables
```sql
SELECT suppliers.CompanyName, ProductName, UnitPrice
FROM Suppliers INNER JOIN Products ON Suppliers.supplierid = Products.supplierid
```
- It is in the FROM clause and uses the ON clause
- Joining more tables together affects overall database performance
- You can join multiple tables (NO LIMIT)
- List all tables the define conditions
```sql
SELECT o.OrderID, c.CompanyName, e.LastName
FROM ((Orders o INNER JOIN Customers c ON o.CustomerID = c.CustomerID)
INNER JOIN Employees e ON o.EmployeeID = e.EmployeeID);
```
**BEST PRACTICE**
- make sure you are pre-qualifying names
- Do not make unnecessary joins
- Think about the type of join you are making
- How are you connecting records?


### Left and Right joins
The table you list first is acted upon by the type of join you use.
Left joins can be turned into right joins by reversing the order of the tables
#### Left Join
Returns  all records from the left table, and the matched records from the right table.
The result is null from the right side if there in no match.
#### Right Join
Returns  all records from the right table, and the matched records from the left table.
The result is null from the left side if there in no match.

Full Outer joins (Give me everything)
Return all records when there is a match in either leftor right table records.

### Self joins
Join the original table  to itself.
Take the table and treat it like two separate tables.
Match customers from the same city
SELECT  column_name(s) FROM table1 T1, table2 T2 WHERE condition;
## Union
It is used to combine the result-set of two or more SELECT statments
Each SELECT statement within UNION must have the same number of columns
Columns must have similar data types.
The columns in each SELECT statement must be in the same order.
```sql
SELECT  column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;
eg
SELECT City, Country FROM Customers
WHERE Country='Germany'
UNION
SELECT City, Country FROM Suppliers
WHERE Country='Germany ORDER BY city ;
```
## Aliases
An alias give a column a temporary name. It only exists for the duration of the query.
SELECT column_name FROM table_name AS alias_name

- Check for duplicates
- Check the number of records each time you make a new join
- Are you gettin gthe results you expected ?
- Start small : one table at a time
- "Slowly do" think through what you are doing.

# Working with Text Strings
String functions : Concatenate, Substring, Trim , Upper, Lower
## Concatenations
SQL server supports + instead of ||
```sql
SELECT CompanyName || ' ('|| ContactName||')' FROM customers
```

### Trimming Strings
Trims the leading or trailing space from a string
TRIM
RTRIM → right TRIM
LTRIM → left TRIM
SELECT TRIM ("  You are the best.   ") AS TrimmedString

### Substring
Returns the specified number of characters from a particular position of a given string.

SUBSTR(string name, string position, number of characters to be returned) ;
```sql
SELECT first_name, SUBSTR (first_name,2,3)
FROM employees
WHERE department_id=60 ;
```
### UPPER and LOWER
```sql
SELECT UPPER(column_name) FROM table_name ;
SELECT LOWER(column_name) FROM table_name ;
SELECT UCASE(column_name) FROM table_name ;
```

### Date and Time
As long as your data contains only the date portion, your queries will work as expected. However, if a time portion is involved, it gets more complicated.
The most difficut part when working with dates is to be sure that the format of the date you are trying to insert, matches the format of the date column in the database.
Dates are stored as datetypes
+ **DATE**
Format YYYY-MM-DD
+ **DATETIME**
Format : YYYY-MM-DD HH:MI:SS
+ **TIMESTAMP**
Format : YYYY-MM-DD HH:MI:SS

+ **STRFTIME Function**
```sql
SELECT Birthday,
STRFTIME('%Y', Birthdate) AS Year
, STRFTIME('%m', Birthdate) AS Month
,STRFTIMe('%d', Birthdate) AS Day
,DATE(('now')- Birthdate) AS Age
FROM employees
```

+ **NOW Function**
```sql
SELECT DATE('now') → computes current date
SELECT STRFTIME('%Y%m%d', 'now')
```
# CASE STATEMENT
Mimics if-then-else statement .
Can be used to SELECT, INSERT, UPDATE, and DELETE statements
```sql
CASE
WHEN c1 THEN E1
WHEN c2 THEN E2
…
ELSE [result else]
END

CASE input_expression
	WHEN when_expression THEN result_expression [...n]
	[ ELSE else_expression ]
END
```

## Views
A stored query. Can add or remove columns without changing schema.
Use it to encapsulate queries.
The view will be removed after database connection has ended.
```sql
CREATE [TEMP] VIEW [IF NOT EXISTS]
view_name(column-name-list)
AS
select-statement ;
```
```sql
CREATE VIEW my_view AS SELECT r.regiondescription, t.territorydescription,
e.Lastname, e.Firstname, e.Hiredate, e.Reportsto FROM Region r
INNER JOIN Territories t on r.regionid  = t.regionid
INNER JOIN Emplyeeterritories et on t.TerritoryID = et.TerritoryID
INNER JOIN Employees e on et.employeeid = e.EmployeeID
```
To actually see the data you will need to run
```sql
SELECT * FROM my_view
DROP VIEW my_view ;
```
