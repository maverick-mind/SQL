-- type 2 : INNER JOIN (ONLY MATCHING) : only the matching rows from both the tables 
SELECT * 
FROM leftTable 
INNER JOIN rightTable 
on <join_condition>

-- by default a join is inner 
SELECT * 
FROM leftTable 
JOIN rightTable  -- it is inner join
on <join_condition>

<join_condition> could be like : A.key = B.key ; -- A is left table and B is right table 
                              --the key from the table A must be equal to the key from the table B

-- task : get all customers along with their orders , but only for customers who have placed an order 

-- for this task , the customer who have placed an order , should have customer_id in the table orders , and we have id in the table customers 
SELECT * 
FROM customers 
INNER JOIN orders 
ON customers.id = orders.customer_id

-- OR 
SELECT * 
FROM customers 
INNER JOIN orders 
ON id = customer_id -- to avoid Column Ambiguity : Add the table name before the column to avoid confusion in joins with same named-columns  

-- if we want only some specific columns from both the tables 
SELECT 
 -- to avoid Column Ambiguity : Add the table name before the column to avoid confusion in joins with same named-columns  
	customers.id , customers.first_name , -- some columns from the first table  
	orders.order_id , sales  -- some columns from the second table  
FROM customers 
INNER JOIN orders 
ON customers.id = orders.customer_id


- we can also give ALIAS name to table also , sometimes when the table name is too large , we can use short alias name for our comfort 

SELECT 
	c.id , c.first_name , -- some columns from the first table  
	o.order_id , o.sales  -- some columns from the second table  
FROM customers AS c
INNER JOIN orders AS o
ON c.id = o.customer_id
