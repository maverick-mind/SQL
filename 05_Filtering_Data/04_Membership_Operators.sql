MEMBERSHIP OPERATOR : IN , NOT IN 

IN : checks if a value exists in a LIST or not 
-- for this , first make a list of values 
-- so , let's say we have list , where we have specified 2 values Germany and USA , so these 2 are the members of this list , by using IN operator , sql is going to check the values of the countries whether it is in the list or not.

-- NOT IN : searching for the values , that are NOT IN the list 


-- task : retrieve all the customers from either Germany Or USA 
SELECT * 
FROM customers 
WHERE country = 'USA' or country = 'Germany'

-- ## use IN instead of OR for multiple values in the same column to simplify SQL
SELECT * 
FROM customers 
WHERE country IN ('USA' , 'Germany') 

-- task : retrieve all the customers , those are not from either Germany Or USA 

SELECT * 
FROM customers 
WHERE country NOT IN ('USA' , 'Germany')

