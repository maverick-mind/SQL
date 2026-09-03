-- CHAPTER 6(COMBINING DATA) PART 2 : SET Operators 
-- UNION , UNION ALL , EXCEPT , INTERSECT 

-- If we want to combine the columns : use JOINS 
-- iF want to combine the rows : use SET Operators 

-- rules of the SET Operators : 
-- rule 1 : SQL CLAUSES : SET Operators can be used almost in all clauses like WHERE , JOIN , GROUP BY , HAVING but there is only one EXCEPTION : ORDER BY 

-- ORDER BY is allowed only once at the end of the query : can be used only at the end to sort the final result 
-- we cannot use ORDER BY in each SELECT statements or in each query , we can use it only once and only at the end of the ENTIRE QUERY 


-- rule 2 : The number of columns in EACH query must be SAME 

SELECT 
	FirstName , -- 2 columns here FirstName and LastName in the first SELECT query
	LastName 
From Sales.Customers 

UNION

SELECT 
	FirstName , -- 2 columns here FirstName and LastName in the second SELECT query
	LastName 
From Sales.Employees 



-- rule 3 : Data Types of columns in each query must be compatible (i.e. data types of columns in each query must match  


SELECT 
	CustomerID , -- int datatype
	LastName -- varchar datatype
From Sales.Customers 

UNION

SELECT 
	EmployeeID , -- int datatype
	LastName -- varchar datatype
From Sales.Employees 



-- rule 4 : the ORDER of COLUMNS  in each query must be same 


SELECT 
	LastName -- varchar datatype
	CustomerID , -- int datatype
From Sales.Customers 

UNION

SELECT 
	EmployeeID , -- int datatype
	LastName -- varchar datatype
From Sales.Employees -- the order of columns in above SELECT query and below SELECT query are not same , and it will give error**

