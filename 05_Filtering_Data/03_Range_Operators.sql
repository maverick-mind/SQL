RANGE OPERATORS : {BETWEEN} 

-- RANGE OPERATORS : BETWEEN(The Boundaries are inclusive) : If a value falls between a specific range 
-- SYNTAX : BETWEEN LOWER_BOUNDARY  AND  UPPER_BOUNDARY 

-- task : retrieve all the customers whose score falls in the range between 100 and 500
SELECT *
FROM customers 
WHERE score BETWEEN 100 AND 500

-- or
SELECT *
FROM customers 
WHERE score >= 100 AND SCORE <= 500 -- explicit comparison clearly show that both boundaries are inclusive or exclusive 



