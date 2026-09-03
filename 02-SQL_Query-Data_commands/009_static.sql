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

