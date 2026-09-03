-- DATA MANIPULATION LANGUAGE : UPDATE 
-- UPDATE : when we want to change(modify) the content of the already existing rows 

UPDATE table_name 
	SET column1 = value1 , 
	    column2 = value2 
	WHERE <condition> 
-- ## ALWAYS use WHERE to avoid UPDATING all rows unintentionally

-- task : change the score of customers with (id : 6) to 0 




UPDATE customers
	SET score = 0
	WHERE id = 6 ; -- without WHERE all rows will be updated (all rows score would become 0 without WHERE)
-- check with SELECT , before running update , to avoid updating the wrong data  

SELECT * 
FROM customers 


-- task : change the score of customer with (id : 9) to 0 and update the country to 'UK'

UPDATE customers
SET score = 0 , country = 'UK' 
WHERE id = 9 ;

SELECT *
FROM customers 


-- task : update all customers with a NULL score by setting their score to 0 

UPDATE customers 
SET score = 0 
WHERE score IS NULL ; 

SELECT *
FROM customer