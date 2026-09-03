ADVANCED JOIN TYPES : LEFT-ANTI JOIN : (RETURNS row from the left table , that has no match in the RIGHT table , also in the right table we do not want any data) , we are just joining the data to do a check , to filter the data.

LEFT ANTI JOIN :  used to check non-existence of rows of left table in the right table 
here : left table --> primary table(main source of data) , right table --> lookup(filter) table (not for data , just for filter)

SELECT * 
FROM tableA
LEFT JOIN tableB
ON tableA.key = tableB.key 
WHERE tableB.key IS NULL 

-- task : Get all customers , who have not placed any order 
SELECT * 
FROM customers 
LEFT JOIN orders 
on customers.id = orders.customer_id 
WHERE orders.customer_id IS NULL -- the rows in customers table for whom , there is no customer_id in the table orders 

