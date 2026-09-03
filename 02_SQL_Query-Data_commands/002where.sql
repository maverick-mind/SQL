
 -- WHERE in SQL : used to filter our data based on condition , any data that fulfill the condition is going to stay in the outut 
 
-- task : retrieve customers with a score not equals to 0 

SELECT * 
FROM customers 
WHERE score != 0

-- task : retrieve customers from Germany 

-- if the value contains characters , you need to put it inside single quotes 
SELECT * 
FROM customers 
WHERE country = 'Germany'

SELECT 
    first_name , 
    country
FROM customers 
WHERE country = 'Germany'

