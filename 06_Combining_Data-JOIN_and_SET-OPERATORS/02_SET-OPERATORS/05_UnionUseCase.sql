
UNION USE CASES : 

1. COMBINE INFORMATION : Combine similar information before analyzing the data.
2. Sometimes Database Developers divide the data into multiple tables to optimize performance and archive old data.


-> Orders are stored in seperate table (Orders and OrdersArchive).
   Combine all orders into one report without duplicates.

Select 
    * -- both the tables are exactly indentical (both the table has exact same column)
FROM Sales.Orders 
    
UNION 

SELECT 
    *
FROM Sales.OrdersArchive

-> Best practices : Never use astrick(*) to combine tables ; List the needed columns instead 



Select 
    [OrderId] , 
    [ProductID] ,
    [CustomerID] ,
    [SalesPersonID] ,
    [OrderDate] ,
    [ShipDate] ,
    [OrderStatus] ,
    [ShipAddress] ,
    [BillAddress] ,
    [Quantity] ,
    [Sales] ,
    [CreationTime]
FROM Sales.Orders 
    
UNION 

SELECT 
    [OrderId] , 
    [ProductID] ,
    [CustomerID] ,
    [SalesPersonID] ,
    [OrderDate] ,
    [ShipDate] ,
    [OrderStatus] ,
    [ShipAddress] ,
    [BillAddress] ,
    [Quantity] ,
    [Sales] ,
    [CreationTime]
FROM Sales.OrdersArchive


-> SOURCE FLAG : Include additional column indicate the source of each row 


Select 
'Orders' AS SourceTable ,
    [OrderId] , 
    [ProductID] ,
    [CustomerID] ,
    [SalesPersonID] ,
    [OrderDate] ,
    [ShipDate] ,
    [OrderStatus] ,
    [ShipAddress] ,
    [BillAddress] ,
    [Quantity] ,
    [Sales] ,
    [CreationTime]
FROM Sales.Orders 
    
UNION 

SELECT 
'OrdersArchive' AS SourceTable ,
    [OrderId] , 
    [ProductID] ,
    [CustomerID] ,
    [SalesPersonID] ,
    [OrderDate] ,
    [ShipDate] ,
    [OrderStatus] ,
    [ShipAddress] ,
    [BillAddress] ,
    [Quantity] ,
    [Sales] ,
    [CreationTime]
FROM Sales.OrdersArchive

ORDER BY OrderID
