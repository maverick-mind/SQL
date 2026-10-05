-- CHAPTER 6(COMBINING DATA) PART 2 : SET Operators 
-- UNION , UNION ALL , EXCEPT , INTERSECT 

-- If we want to combine the columns : use JOINS 
-- iF want to combine the rows : use SET Operators 


-- 
For set operators, the two SELECT statements must have:

->Same number of columns
->Corresponding columns must have compatible data types
->Column order matters
-- 

JOIN = combine related tables side-by-side
SET OPERATOR = combine/compare query results on top of each other

-- 
rules of the SET Operators : 
 rule 1 : SQL CLAUSES : In each individual SELECT statements , SET Operators can be used almost in all clauses like WHERE , JOIN , GROUP BY , HAVING but there is only one EXCEPTION : ORDER BY 


ORDER BY is allowed only once at the end of the query : can be used only at the end to sort the final result 
we cannot use ORDER BY in each SELECT statements or in each query , we can use it only once and only at the end of the ENTIRE QUERY 
-- 

-- 
rule 2 : The number of columns in EACH query (SELECT STATEMENTS) must be SAME 
-- 

SELECT 
	FirstName , -- 2 columns here FirstName and LastName in the first SELECT query
	LastName 
From Sales.Customers 

UNION

SELECT 
	FirstName , -- 2 columns here FirstName and LastName in the second SELECT query
	LastName 
From Sales.Employees 



-- 
rule 3 : Data Types of columns in each query must be compatible (i.e. Corresponding columns must have compatible data types)
-- 

SELECT 
	CustomerID , -- int datatype
	LastName -- varchar datatype
From Sales.Customers 

UNION

SELECT 
	EmployeeID , -- int datatype
	LastName -- varchar datatype
From Sales.Employees 



-- 
rule 4 : The ORDER of COLUMNS in each query must be same 
-- 

SELECT 
	LastName -- varchar datatype
	CustomerID , -- int datatype
From Sales.Customers 

UNION

SELECT 
	EmployeeID , -- int datatype
	LastName -- varchar datatype
From Sales.Employees -- the order of columns in above SELECT query and below SELECT query are not same , and it will give error**


-- 
rule 5 : Column Name Prefrence Priority : 
The first query(SELECT statement) will control the naming of the columns in the output , so if you want to give aliases to the column name , igve it to the first query(select statement) i.e. 
The column name in the result set are determined by the column names specified in the first query.

SELECT 
	CustomerID ID ,
	LastName
FROM Sales.Customers

UNION

SELECT 
	EmployeeID ,
	LastName AS aliasNotWorkInSecondQuery
FROm Sales.Employees



-- 
Rule 6 : SQL cannot detect Logical Errors in column selection :
Even If all rules are met and SQL shows no errors , the result may be incorrect.
Incorrect column selection leads to inacurate results. 
-- 

SELECT 
	FirstName ,
	LastName
From Sales.Customers

UNION

SELECT 
	LastName ,
	FirstName -- order of the columns is different than the first query , but as daatype is same , so sql will not give error , but it is logically incorrect.
From Sales.Employees


-- 
Rules of set operators : summary 
1. ORDER BY can be used only once.
2. all the query must have "same number of columns".
3. Corresponding columns must have compatible data types (matching data types)
4. Same order of columns.
5. First query control aliases (or column name in the output)
6. columns must be mapped correctly.