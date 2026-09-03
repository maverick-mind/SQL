-- ORDERBY : by default , it sorts in ascending order (low to high)
-- task : retrive all the customers data sort the results by the highest score first 

SELECT * 
FROM customers 
ORDER BY score DESC

-- task : retrive all the customers data sort the results by the lowest score first (by default it is ascending order)
SELECT * 
FROM customers 
ORDER BY score

SELECT * 
FROM customers 
ORDER BY score ASC




-- You can sort by multiple columns by separating them with commas in the ORDER BY clause , column order in ORDER BY is crucial , as sorting is sequential 

-- task : retrieve all customers sort the results by the country(alphabetically) and then by the highest score(descending)


SELECT * 
FROM customers 
ORDER BY country ASC , score DESC

