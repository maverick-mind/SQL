-- FULL ANTI JOIN(all data except inner join) : return all the rows that do not matches in either table 
					i.e. : all the unmatched rows from left table and all the unmatched rows from the right table 
-- the order of table is not important in FULL ANTI JOIN 
-- FULL ANTI JOIN can be used to check the existence , so if we combine FULL JOIN with where , we can check the existence or not existence of your data in another table 

SELECT * 
FROM leftTable 
FULL JOIN rightTable 
on leftTable.key = rightTable.key 
WHERE leftTable.key IS NULL 
	  OR 
	  rightTable.key IS NULL 


-- task : find customers without orders and order without customers 
SELECT * 
FROM customers 
FULL JOIN orders 
ON customers.id = orders.customer_id
WHERE customers.id IS NULL 
	  or 
	  orders.customer_id IS NULL 


-- solve the following task without using INNER JOIN 
-- Get all customers along with their orders , but only for customers who have placed an order , Without using INNER JOIN!!

SELECT * 
FROM customers

SELECT * 
FROM orders


SELECT * 
FROM customers AS c 
LEFT JOIN orders AS o 
ON c.id = o.customer_id 
WHERE o.customer_id IS NOT NULL 
	  
-- OR 
SELECT * 
FROM customers AS c 
FULL JOIN orders AS o 
ON c.id = o.customer_id 
WHERE c.id IS NOT NULL 
	  AND
	  o.customer_id IS NOT NULL 
