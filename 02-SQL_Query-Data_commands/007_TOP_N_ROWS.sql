-- TOP n rows (TOP has nothing to do with id's or id number , it just returns first n rows)

-- task : retrieve only 3 customers 
SELECT TOP 3 *
FROM customers 


-- task : retrieve top 3 customers with the highest score(ORDER BY)

SELECT TOP 3 *
FROM customers 
ORDER BY score DESC


-- task : retrieve the lowest 2 customers based on the score 
SELECT TOP 2 * 
FROM customers 
ORDER BY score ASC 



-- task : get the two most recent orders from the orders table  
SELECT * FROM orders

SELECT TOP 2 *
FROM orders 
ORDER BY order_date DESC
