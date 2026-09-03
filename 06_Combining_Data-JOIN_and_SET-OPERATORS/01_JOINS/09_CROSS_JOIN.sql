-- CROSS JOIN (ADFVANCED JOIN TYPES) : combines every row from the left with every row in the right. ALl possible combinations. Cartesian joins  

-- combines everything from leftTable to everything in rightTable 
-- if there are 2 rows in leftTable and 3 rows in rightTable 
-- if we do a cross join , then there would be total of 2 * 3 = 6 possible combinations by multiplying the number of rows between leftTable and rightTable  

-- syntax : 
SELECT * 
FROM leftTable 
CROSS JOIN rightTable 
-- no condition here in cross join 

-- task : generate all possible combnations customers and orders 
SELECT * 
FROM customers 
CROSS JOIN orders -- we will get everything with everything (5 customers * 4 orders = 20 rows in the final result) 
