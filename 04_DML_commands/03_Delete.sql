-- DATA MANIPULATION LANGUAGE : DELETE 
DELETE FROM table_name 
WHERE <condition>
-- ## Always use WHERE , to avoid DELETING all rows unintentionally , without WHERE , you will end up DELETING all the rows in the table 

-- task : delete all customers with (id > 5) 
DELETE FROM customers 
WHERE id > 5 ; -- without WHERE , all rows will be DELETED , check with select before deleting the wrong data 

SELECT * 
FROM customers 
WHERE id > 5 ;


-- DELETE all data from the persons table 
DELETE FROM perosons 
--OR
TRUNCATE TABLE persons 

SELECT * 
FROM persons -- will give empty persons table now 

-- **TRUNCATE TABLE table_name: clears the whole table at once without checking or logging , but after deleting all the data , the table still exists 

-- for larger tables , to delete all data at once , use truncate , because it is way faster than delete , because with deletes there are lots of things behind the scenes such as logs and protocols , but with truncate , the database is going to skip all the extra stuff , thus making TRUNCATE very fast 
