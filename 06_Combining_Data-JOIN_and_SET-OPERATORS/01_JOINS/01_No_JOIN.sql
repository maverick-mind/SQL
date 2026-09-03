-- Basic Join

-- type 1 : No Join : to get all the data without joining tables : two results : returns data from the table without combining them 
-- we want to see two tables A and B , and there is no need to combine them 

-- syntax
SELECT * 
FROM LeftTable ; 

SELECT * 
FROM RightTable ;

-- task : retrieve all the data from customerds and orders as seperate results 

SELECT * 
FROM customers ; 

SELECT * 
FROM orders ; 

