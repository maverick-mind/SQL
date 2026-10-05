
UNION ALL : Returns all rows from both the queries "including duplicates".

UNION ALL is the only set operators that does not removes any duplicates.


When to use UNION vs UNION ALL ?
-> UNION ALL has way better performance and is generally faster than UNION because UNION ALL does not perform any additional steps like removing duplicates.
If you are confident that in the query there are no duplicates then use -> UNION ALL

->use UNION ALL to find duplicates and quality issues.

Task : Combine the data from employees and customers into one table , including duplicates. 

SELECT 
    FirstName , LastName 
FROM Sales.Employees 

UNION ALL 

SELECT 
    FirstName , LastName 
FROM Sales.Customers

-> The order of the queries(query regarding which table comes first or last) in a UNION ALL operation does not affect the result.