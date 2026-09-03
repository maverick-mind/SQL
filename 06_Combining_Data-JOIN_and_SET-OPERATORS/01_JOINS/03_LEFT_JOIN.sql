-- type 3 : Left Join (returns All rows from left table and only matching rows from the right table)
-- here , left table is primary source of data(we need everything from the left data) , right table is secondary source of data (need additional data from right table)
SELECT *
FROM leftTableA
LEFT JOIN rightTableB
on leftTableA.key = rightTableB.key 
--## the order of the table in the sytanx is important to defie left and right table role  


-- task : get all the customers along with their orders , including those without orders 
-- we need all the data from table customers(left table) 

SELECT * 
FROM customers 
LEFT JOIN orders 
ON customers.id = orders.customer_id 
