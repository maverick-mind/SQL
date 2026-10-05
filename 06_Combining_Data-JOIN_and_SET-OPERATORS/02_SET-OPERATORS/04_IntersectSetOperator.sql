
INTERSECT : Returns only the rows that are common in both the queries.

INTERSECT : Returns common rows between two tables.

-> Task : find the employees who are also customers 

SELECT 
    FirstName , LastName 
FROM Sales.Employees

INTERSECT 

SELECT 
    FirstName , LastName 
FROM Sales.Customers

-> The order of the queries(query regarding which table comes first or last) does not matter 