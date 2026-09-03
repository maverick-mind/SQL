-- RIGHT ANTI JOIN : returns rows from the right table that has no match in the left table 
-- only unmatching rows in the right table , meaning rows that are present in right table but for them , the joining key is missing in left table 

here : right table --> primary table(main source of data) , left table --> lookup(filter) table (not for data , just for filter)

SELECT * 
FROM leftTable 
RIGHT JOIN rightTable 
ON rightTable.key = leftTable.key 
WHERE leftTable.key IS NULL 


-- task : get all orders without matching customers 
SELECT *
FROM customers 
RIGHT JOIN orders 
ON customers.id = orders.customer_id 
WHERE customers.id IS NULL 

-- -- task : get all orders without matching customers using LEFT ANTI JOIN 
SELECT * 
FROM orders 
LEFT JOIN customers 
ON orders.customer_id = customers.id 
WHERE customers.id IS NULL 
