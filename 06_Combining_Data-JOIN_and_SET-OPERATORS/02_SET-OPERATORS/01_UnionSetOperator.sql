
UNION : Returns all "DISTINCT UNIQUE" rows from both the queries , 
        i.e. remove "Duplicate" rows from the result.

UNION make sure each row can appear only once.


Task : Combine the data from employees and customers into one table. 

-- first explore the data 

SELECT *
FROM Sales.Employees ; 


SELECT *
FROM Sales.Customers ;


SELECT 
    EmployeeID as ID , FirstName , LastName 
FROM Sales.Employees 

UNION

SELECT 
    CustomerID , FirstName , LastName
FROM Sales.Customers ;

-> The order of the queries(query regarding which table comes first or last) in a UNION operation does not affect the result.