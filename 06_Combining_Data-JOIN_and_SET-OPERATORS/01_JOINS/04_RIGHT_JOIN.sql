-- type 4 : Right Join (returns All rows from Right table and only matching rows from the left table)
-- here , Right table is primary source of data(we need everything from the right data) , left table is secondary source of data (need additional data from left table)


-- task : get all the customers along with their orders , including orders without matching customers 

-- we can use left join by making order as left table (but here , orders column appears before the columns of the customers)
-- or 
-- we can use right join by making order as right table (here , customers column appears before the columns of the orders)


SELECT * 
FROM customers  
RIGHT JOIN orders 
on customers.id = orders.customer_id


-- task : get all the customers along with their orders , including orders without matching customers  (Using LEFT JOIN)
SELECT * 
FROM orders 
LEFT JOIN customers 
on customers.id = orders.customer_id

