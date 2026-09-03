LOGICAL OPERATORS : {AND , OR , NOT} 

-- LOGICAL OPERATORS(AND , OR , NOT)
-- AND : all conditions must be true in the WHERE clause , in order to keep the row in the result.

-- task : retrieve all the customers , who are from USA AND have score greater than 500 
SELECT * 
FROM customers 
WHERE country = 'USA' AND score > 500

-- LOGICAL OR : at least one of the conditions must be true in the WHERE clause , in order to keep the row in the result.

-- task : retrieve all the customers , who are EITHER from USA OR have score greater than 500 
SELECT * 
FROM  customers   
WHERE country = 'USA' OR score > '500' 

-- LOGICAL NOT : (REVERSE) Excludes matching values : If the condition if fullfilled , it must be removed from the final result 


-- task : retrieve all the customers with a score NOT less than 500
SELECT * 
FROM customers 
WHERE NOT score < 500 

