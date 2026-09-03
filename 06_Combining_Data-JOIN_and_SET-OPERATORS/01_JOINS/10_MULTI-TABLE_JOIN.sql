-- Multi-Table JOIN (ADVANCED JOIN TYPE) 

-- way 1 : always start from main or master table , and master table will be our left table and all other tables will be instances of right table 

-- way 2 : don't consider any table as master table , treat all table equally , and then put JOIN accordingly 


-- Using SalesDB , Retrieve a list of all orders , along with the related customer , product and employee detals 
-- for each order , display : 
/* orderID 
   Customer's name 
   Product name 
   Sales amount 
   Product Price 
   SalesPerson's name
*/

SELECT * 
FROM Sales.Orders 

SELECT * 
FROM Sales.Customers 

SELECT * 
FROM Sales.Products 

SELECT * 
FROM Sales.Employees


SELECT ord.OrderID , ord.Sales ,
       cst.FirstName AS CustomerFirstName,
       cst.LastName  AS CustomerLastName ,
	   prd.Product , prd.Price ,
	   emp.FirstName AS EmployeeFirstName,
       emp.LastName  AS EmployeeLastName
	   
FROM Sales.Orders AS ord
INNER JOIN Sales.Customers AS cst ON ord.CustomerId = cst.CustomerID 
INNER JOIN Sales.Products AS prd ON ord.ProductID = prd.ProductID 
INNER JOIN Sales.Employees AS emp ON ord.SalesPersonID = emp.EmployeeID

-- the task is focusing on the table orders. so , we need all the orders , we cannot miss any order here , so here orders can be treated as main table , along with that we need other informations , which means the other tables are not that important like the orders. so this gives hint that orders is the main table , and it is going to be our starting point 

SELECT 
	ord.OrderID , ord.Sales , 
	cst.FirstName AS CustomerFirstName,
    cst.LastName  AS CustomerLastName ,
	prd.Product , prd.Price ,
	emp.FirstName AS EmployeeFirstName,
    emp.LastName  AS EmployeeLastName
FROM Sales.Orders AS ord
LEFT JOIN Sales.Customers AS cst ON cst.CustomerID = ord.CustomerID
LEFT JOIN Sales.Products AS prd ON ord.ProductID = prd.ProductID 
LEFT JOIN Sales.Employees AS emp ON ord.SalesPersonID = emp.EmployeeID

