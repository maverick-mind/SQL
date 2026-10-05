EXCEPT : also called minus in other databases 

EXCEPT : Table A - (Table A intersection Table B) 

EXCEPT : Returns all the "DISTINCT ROWS"(non-duplicates) from the "FIRST QUERY" that are not found in the second query.

It is the only set operator where the order of queries affects the final result.


-> Task : Find employees(first table) who are not customers(second table) at the same time 

SELECT 
    FirstName , LastName 
FROM Sales.employees 

EXCEPT 

SELECT 
    FirstName , LastName
From Sales.Customers

-> The order of queries(query regarding which table comes first or last) in a EXCEPT does affect the results!!

SELECT 
    FirstName , LastName
From Sales.Customers

EXCEPT 

SELECT 
    FirstName , LastName 
FROM Sales.employees 
