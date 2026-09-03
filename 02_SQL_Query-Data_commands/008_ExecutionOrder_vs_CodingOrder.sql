
-------------------------------------------------------
-- execution order vs coding order 
-- CODING ORDER of query  : SELECT --> DISTINCT --> TOP N --> col1 , SUM(col2) --> FROM table --> WHERE col = 10 --> GROUP BY COL1 --> HAVING SUM(col2) > 30 --> ORDERED BY col1 ASC  

-- EXECUTION ORDER OF SQL : FROM TABLE(1) --> WHERE(2) --> GROUP BY(3) --> HAVING(4) --> (SELECT , DISTINCT)(5) --> ORDER BY(6) --> TOP N (ALWAYS LAST TO BE EXECUTED) 

-------------------------------------------------------



-- COOL SQL QUERIES 
-- Multi-Queries : In - SQL we can have multiple queries and multiple results in one go  
-- The results will be splitted into multiple window depending upon the number of queries 

SELECT * 
FROM customers ;

SELECT * 
FROM orders ;


--- COOL SQL Techniques 
-- STATIC (FIXED) VALUES : WHAT IF , we don't want to query data inside our tables , we would like to show static value from us , from the one that is writing the query 

SELECT 
    123 AS "static_value1" , 
    789 AS "static values from user , not from the table" ; -- static value


SELECT 
    'hello' AS "static string" 



SELECT  
    id , 
    first_name ,
    'new customer' AS "customer type"
FROM customers







-- cool sql techniques
-- Highlight & Execute : sometimes we don't want to execute the whole query , we just want to execute a part of the query , and for the same query , we may be want to execute the whole query 
-- for executing overall query : highlight it with covering it with your mouse cursor 
-- if we highlight the part of a query , using cursor of our mouse , sql will only execute that highlighted part , and leave all other non-highlighted part 

SELECT * 
FROM customers 
WHERE country = 'Germany'

-- just highlight the below query of orders , the above query of customers will not get executed 
SELECT * 
FROM orders 


