-- type 5 : FULL Join (returns All rows from left table and along with that all rows from the right table)

-- the order of the table in inner join or full join does not matter 

-- task : get all the customers and all the orders , even if there is no match 

SELECT * 
FROM customers 
FULL JOIN orders 
ON customers.id = orders.customer_id 

