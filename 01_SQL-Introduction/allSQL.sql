
-- USE database name to change master to that database name 
-- here 
-- USE MyDatabase


-- This is an inline comment in sql 

--To comment selected line in sql : press Ctrl+K, release, then press Ctrl+C — it's a two-key chord, not simultaneous 
/* 
multi -
line 
comments
*/

-- task 1 : retrieve all customer data 
-- currently , the required data is stored inside the table called customers 
-- dbo.customers is same as customers , dbo means database owner 

/* SELECT * 
From customers */

-- task 2 : retrieve all data from table : orders 
--SELECT * From orders 


 --task 3 : retrieve each customer's name , country and score
 
 -- first see , how the table looks like , what attributes / columns / field looks like in the table 
 -- SELECT * FROM customers

 -- the order you select the column , is the order it will give you the output (country , first_name , score)
 --SELECT country , first_name ,  score FROM customers

 -- don't put comma(,) after last field name while using SELECT
 --SELECT 
	-- first_name , 
	-- country , 
	-- score 
 --FROM customers 



 ----------------------------

 -- WHERE in SQL : used to filter our data based on condition , any data that fulfill the condition is going to stay in the outut 
 
-- task : retrieve customers with a score not equals to 0 


--SELECT * 
--FROM customers 
--WHERE score != 0

-- task : retrieve customers from Germany 

-- if the value contains characters , you need to put it inside single quotes 
--SELECT * FROM customers WHERE country = 'Germany'

--SELECT first_name , country FROM customers WHERE country = 'Germany'


-------------------------------

-- ORDERBY : by default , it sorts in ascending order (low to high)
-- task : retrive all the customers data sort the results by the highest score first 

--SELECT * FROM customers ORDER BY score DESC

-- task : retrive all the customers data sort the results by the lowest score first (by default it is ascending order)
--SELECT * FROM customers ORDER BY score

--SELECT * FROM customers ORDER BY score ASC



---------------------------------

-- You can sort by multiple columns by separating them with commas in the ORDER BY clause , column order in ORDER BY is crucial , as sorting is sequential 

-- task : retrieve all customers sort the results by the country(alphabetically) and then by the highest score(descending)


--SELECT * FROM customers ORDER BY country ASC , score DESC


--------------------------

-- GROUP BY : Aggregate Your Data : The result of GROUP BY is determined by the unique values of the grouped columns 
/*
## Important Rule

When using `GROUP BY`, every column in the `SELECT` list must be **either**:

- Included in the `GROUP BY`, **or**
- Wrapped in an aggregate function.

*/

-- task : find the total score(aggregated) for each country(GROUP BY)

-- here , sum(score) , has no column name 
-- SELECT country , SUM(score) From  customers GROUP BY country 

-- to show column name in query use 'alias' in sql , an alias is a temporary name , works only for that query , this name does not work in any other query , and we are not renaing anything in the database 

--SELECT country AS "customer's country" , first_name, SUM(score) AS "sum score" FROM customers GROUP BY country , first_name


-- task : find total score and total number of customer's for each country 
-- so we need GROUP BY on country , and aggregate function (sum for score) and (count for total number of customers) 

--SELECT country , SUM(score) AS "country score" , COUNT(*) AS "customer's from each country" FROM customers GROUP BY country 


-----------------------------

-- HAVING : filter aggregated data , HAVING  is used to filter the data but after aggregation , it means we can use HAVING only after using GROUP BY 

-- if you want to filter the data before aggregation , use : WHERE 
-- if you want to filter the data after aggregation , use : HAVING 

---------- task : find the average score for each country , considering only customers with a score not equal to 0 and return only those countries with an average score greater than 430

/*
SELECT  
		country ,
        AVG(score) AS "average score" 
FROM customers
WHERE score != 0
GROUP BY country 
HAVING avg(score) > 430
*/

------------------------------
/*
-- DISTINCT : remove duplicates 
-- Don't use DISTINCT  unless necessary , it can slow down your query. for example id(primary key) are always unique , there is no point to apply DISTINCT over there , it will put extra work for the sql   
-- task : return unique list of all the countries 

SELECT DISTINCT country 
FROM customers 
*/

------------------------------
/*
-- TOP n rows (TOP has nothing to do with id's or id number , it just returns first n rows)

-- task : retrieve only 3 customers 
SELECT TOP 3 *
FROM customers 


-- task : retrieve top 3 customers with the highest score(ORDER BY)

SELECT TOP 3 *
FROM customers 
ORDER BY score DESC


-- task : retrieve the lowest 2 customers based on the score 
SELECT TOP 2 * 
FROM customers 
ORDER BY score ASC 



-- task : get the two most recent orders from the orders table  
SELECT * FROM orders

SELECT TOP 2 *
FROM orders 
ORDER BY order_date DESC



-------------------------------------------------------
-- execution order vs coding order 
-- CODING ORDER of query  : SELECT --> DISTINCT --> TOP N --> col1 , SUM(col2) --> FROM table --> WHERE col = 10 --> GROUP BY COL1 --> HAVING SUM(col2) > 30 --> ORDERED BY col1 ASC  

-- EXECUTION ORDER OF SQL : FROM TABLE(1) --> WHERE(2) --> GROUP BY(3) --> HAVING(4) --> (SELECT , DISTINCT)(5) --> ORDER BY(6) --> TOP N (ALWAYS LAST TO BE EXECUTED) 

-------------------------------------------------------

-- COOL SQL QUERIES 
-- Multi-Queries : In - SQL we can have multiple queries and multiple results in one go  
-- The results will be splitted into multiple window depending upon the number of queries 

SELECT * 
FROM customers ;

SELECT * 
FROM orders ;

*/

------------------------------------------

--- COOL SQL Techniques 
-- STATIC (FIXED) VALUES : WHAT IF , we don't want to query data inside our tables , we would like to show static value from us , from the one that is writing the query 
/*
SELECT 123 AS "static_value1" , 
789 AS "static values from user , not from the table" ; -- static value


SELECT 'hello' AS "static string" 



SELECT  
id , 
first_name ,
'new customer' AS "customer type"
FROM customers




-- cool sql techniques
-- Highlight & Execute : sometimes we don't want to execute the whole query , we just want to execute a part of the query , and for the same query , we may be want to execute the whole query 
-- for executing overall query : highlight it with covering it with your mouse cursor 
-- if we highlight the part of a query , using cursor of our mouse , sql will only execute that highlighted part , and leave all other non-highlighted part 

SELECT * 
FROM customers 
WHERE country = 'Germany'

-- just highlight the below query of orders , the above query of customers will not get executed 
SELECT * FROM orders 



----------------------------------------------------------------------------------------------------
-- CHAPTER 3 : DATA DEFINITION LANGUAGE (DDL) : CREATE , ALTER , DROP 
-- for empty database , at first we need to go and define the structure of the data 
-- so inside an empty database , one of the first things to do is to : create a new table 
-- by using command : CREATE , we can create a new object inside the database , and initially the table will be empty without any data 

-- task : create a new table called persons with columns : id , person_name , birth_date and phone

-- if we lost this script of the create table , right click on persons table in the left sidebar , 
-- click on "script table as" then "CREATE To" then --> New Query Editor Window , doing this we can get the metadata about the persons table 

CREATE TABLE persons(

-- column name : datatype : constraint
	id           INT        NOT NULL , -- we cannot have person without an id ,so NOT NULL is used here
	person_name  VARCHAR(50) NOT NULL , -- NOT NULL means the entry is must to be filled 
	birth_date    DATE  , 
	phone        VARCHAR(15) NOT NULL ,

	CONSTRAINT primary_keyNameOnlyUsedForTheDatabaseInternally Primary key (id) -- here , we are making id as our primary key 
)
-- the last thing to check while creating a table is : primary key , in order to make sure this table has an integrity and may be as well connectable to other tables
-- so give a primary key name , and this is only going to be visible to the database 

-- for DDL commands , you will not get any result or data in the output , all what you will get is a message from the database , and the message could be anything like : the command completed successfully , with the completion time  



SELECT * FROM persons




--------------------------------------
-- ALTER( edit or change ) : Data Definition Language 

-- to add a new column , use alter(to edit the definition/structure of the table)


-- task : add a new column : email to the persons table 

-- new columns are append at the end of the table by default(it will become right most table)
-- if we want to add a new column in-between the other pre-existing columns of the table , we have to completely delete and drop the table and create it from the scratch using CREATE  command 
ALTER TABLE persons 
ADD email VARCHAR(50) NOT NULL -- column name : email , datatype : VARCHAR(length) , constraints : NOT NULL 

SELECT * FROM persons 



-- task : remove the column phone from the persons table 
ALTER TABLE persons 
DROP COLUMN  phone 

SELECT * FROM persons 



--------------------------------------
-- DROP(to remove the table completly from the database) : Data Definition Language 

-- task : delete the table persons from the database 
DROP TABLE persons

*/


----------------------------------------------------------------------------------------------
/*
 CHAPTER 4 : DATA MANIPULATION LANGUAGE (DML COMMANDS) (INSERT , UPDATE , DELETE)
 Modify and manipulate the data in the databse 
 INSERT : to add new rows in the table 
 in order to insert new data to the target table , there are 2 methods : 
 1. Manual Entry(values) classical way to insert new data , use INSERT command and manually specify the values , that should be inserted to the table 
 INSERT INTO table_name (column1 , column2 , column3 , ....)
 VALUES (value1 , value2 , value3 , ....) ,
        (value1 , value2 , value3 , ....) <-- multiple rows insertion are possible in one go 

2. Insert from another table (SELECT) : insert data from another table using SELECT statement , this is useful when you want to copy data from one table to another

-- ## columns and values must be in the same order 
-- you can skip columns if you insert values in every column 

 **OPTIONAL : if no columns are specified , SQL expects values for all columns
 RULE for insert statements : THE number of columns should match the number of values 
 */


 -- 1. Manual Entry(values) classical way to insert new data , use INSERT command and manually specify the values , that should be inserted to the table 
 -- task : insert a new customer manually
INSERT INTO customers (id , first_name , country , score) 
VALUES (10 , 'Bruce' , 'UK' , 300 ) ;

 INSERT INTO customers (id , first_name , country , score) 
 VALUES (6 , 'Mike' , 'USA' , 0 ) ;

 INSERT INTO customers (id , first_name , country , score) 
 VALUES (7 , 'STEVE' , 'USA' , NULL ) ;

 DELETE FROM customers WHERE id = 6 or id = 7 or id = 10 ; 

 -- INSERT multiple rows at a time 
INSERT INTO customers (id , first_name , country , score) 
VALUES (6 , 'ANNA' , 'USA' , NULL) , 
(7 , 'SAM' , 'NULL' , 100) , 
		(8 , 'Bruce' , 'UK' , 300 ) ;

-- you can skip columns if you insert values in every column 
-- but still , always list columns for clarity and maintainability 
 INSERT INTO customers  
 VALUES (9 , 'MAX' , 'SA' , 121 ) , 
        (10 , 'JUSTIN' , 'UK' , NULL)  

-- insert into specific columns(primary key is must) --> be careful , you are not allowed to skip a column that is not allowed to be NULL 
-- ## columns not included in INSERT become NULL (unless a default or constraint exists) 
INSERT INTO customers (id , first_name) 
VALUES (11 , 'Andre') ;

 SELECT * FROM customers


-- 2. Insert from another table (SELECT) : insert data from another table using SELECT statement , this is useful when you want to copy data from one table to another
-- INSERT USING SELECT , suppose we have 2 table source_table(from where we will extract data) and other we have target_table(to where we will be inserting those data) 
-- from source table extract data using SELECT , then INSERT those data to the target table 

-- task : copy data from 'customers' table to 'persons'

INSERT INTO persons (id , person_name , birth_date , phone)
SELECT -- write a query from the source table in order to collect the data that you need , and then you can insert it into the target table 
id , 
first_name , 
NULL , -- since we don't have anything like birthdate in customers table , and this field can be NULL in the persons table
'Unknown' --since we don't have phone number data , but it is a non-null field
FROM customers

SELECT * 
FROM persons


---------------------------------------------------------------------------------------------
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
SeT score = 0 
WHERE score IS NULL ; 

SELECT *
FROM customers 

------------------------------------------------------------------------------------------------
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


--------------------------------------------------------------------------------------------
CHAPTER 5 : FILTERING DATA : {COMPARISON OPERATORS , LOGICAL OPERATORS , BETWEEN , IN , LIKE }

COMPARISON OPERATOR : {=,<> != , > , >= , < , <=}
LOGICAL OPERATORS : {AND , OR , NOT} 
RANGE OPERATORS : {BETWEEN} 
MEMBERSHIP OPERATORS : {IN , NOT IN}
SEARCH OPERATOR : {LIKE} 


--COMPARISON OPERATORS 
-- task :COMPARISON OPERATOR equal (=) retrieve all customers from Germany 
SELECT * 
FROM customers 
WHERE country = 'Germany'

-- task :COMPARISON OPERATOR not equal(<> or !=) retrieve all customers not from Germany 
SELECT * 
FROM  customers 
WHERE country <> 'Germany'

-- task :COMPARISON OPERATOR greater than(>) retrieve all customers with a score greater than 500 
SELECT * 
FROM customers 
WHERE score > 500

-- task :COMPARISON OPERATOR greater than or equals to(>=) retrieve all customers with a score of 500 or more 
SELECT * 
FROM customers 
WHERE score >= 500


-- task :COMPARISON OPERATOR less than(<) retrieve all customers with a score less than 500 
SELECT * 
FROM customers 
WHERE score < 500

-- task :COMPARISON OPERATOR less than or equals to(<=) retrieve all customers with a score of 500 or less
SELECT * 
FROM customers 
WHERE score <= 500


-------------------------------------
-- LOGICAL OPERATORS(AND , OR , NOT)
-- AND : all conditions must be true in the WHERE clause , in order to keep the row in the result.

-- task : retrieve all the customers , who are from USA AND have score greater than 500 
SELECT * 
FROM customers 
WHERE country = 'USA' AND score > 500

-- LOGICAL OR : at least one of the conditions must be true in the WHERE clause , in order to keep the row in the result.

-- task : retrieve all the customers , who are EITHER from USA OR have score greater than 500 
SELECT * 
FROM  customers   
WHERE country = 'USA' OR score > '500' 

-- LOGICAL NOT : (REVERSE) Excludes matching values : If the condition if fullfilled , it must be removed from the final result 


-- task : retrieve all the customers with a score NOT less than 500
SELECT * 
FROM customers 
WHERE NOT score < 500 


--------------------------------
-- RANGE OPERATORS : BETWEEN(The Boundaries are inclusive) : If a value falls between a specific range 
-- SYNTAX : BETWEEN LOWER_BOUNDARY  AND  UPPER_BOUNDARY 

-- task : retrieve all the customers whose score falls in the range between 100 and 500
SELECT *
FROM customers 
WHERE score BETWEEN 100 AND 500

-- or
SELECT *
FROM customers 
WHERE score >= 100 AND SCORE <= 500 -- explicit comparison clearly show that both boundaries are inclusive or exclusive 


------------------------------------------------------
MEMBERSHIP OPERATOR : IN , NOT IN 

IN : checks if a value exists in a LIST or not 
-- for this , first make a list of values 
-- so , let's say we have list , where we have specified 2 values Germany and USA , so these 2 are the members of this list , by using IN operator , sql is going to check the values of the countries whether it is in the list or not.

-- NOT IN : searching for the values , that are NOT IN the list 


-- task : retrieve all the customers from either Germany Or USA 
SELECT * 
FROM customers 
WHERE country = 'USA' or country = 'Germany'

-- ## use IN instead of OR for multiple values in the same column to simplify SQL
SELECT * 
FROM customers 
WHERE country IN ('USA' , 'Germany') 

-- task : retrieve all the customers , those are not from either Germany Or USA 

SELECT * 
FROM customers 
WHERE country NOT IN ('USA' , 'Germany')


---------------------------------------------------

SEARCH OPERATOR : LIKE : used to SEARCH for a pattern in the text , if you have text or characters and you are searching for a specific pattern inside the text , then use LIKE

-- LIKE OPERATOR : %(more flixible) or _(rigid) 
-- %(ANYTHING (0 , 1 , MANY)) --> %char(the last character should be char , we don't care about all other characters ,
--       char%(the first character should be char , we don't about all other characters , 
--       %char%(char could be present at any position inside the word)
-- _(underscore)(Exact 1) : 


-- task : Find all the customers whose first name starts with 'M'

SELECT * 
FROM customers 
WHERE first_name LIKE 'M%'

-- task : Find all the customers whose first name ends with 'n'

SELECT * 
FROM customers 
WHERE first_name LIKE '%n'


-- task : Find all the customers whose name contains 'r'
SELECT * 
FROM customers 
WHERE first_name LIKE '%r%'

-- task : Find all the customers whose first name has 'r' in the third position 

SELECT * 
FROM customers 
WHERE first_name LIKE '__r%'


-- task : Find all the customers whose first name has 'r' in the third position , 'i' in the fourth position 
SELECT * 
FROM customers 
WHERE first_name LIKE '__ri%'

-- task : Find all the customers whose first name has 't' in the last third position , 

SELECT * 
FROM customers 
WHERE first_name LIKE '%t__'



----------------------------------------------------------------------------------------------
CHAPTER 6 : COMBINING DATA : JOINS(Joining data) and SET OPERATORS 

-- JOINING DATA : JOINS is used to combine columns 
-- Left table : The table from where we started 
-- Right table : the table to which we join


-- If both of the tables A and B have same columns , and we want to combine rows 
-- then we use SET OPERATORS (here is no left or right)


-- JOINS -- table is going to be wider 
-- syntax : 
SELECT * 
FROM leftTable 
join_type_name JOIN rightTable 
on <join_condition> 
-- if you don't mention the join type name , by default it is inner join 

-- SET OPERATORS : table is going to be longer 


-- key : a column that exist on the left and on the right sides(in other words , common column)

-- JOINS :  in order to join tables , we need to define key column between them
-- 4 basic main types : 
-- INNER JOINS , FULL JOINS , LEFT JOINS , RIGHT JOINS 

-- in SET OPERATORS : the table in our query should have exact same number of columns , but here we don't need anything like key in order to combine the tables    

-- SET OPERATORS :
-- UNION 
-- UNION ALL 
-- EXCEPT (minus) 
-- INTERSECTION


-- WHy do we need JOINS 
-- to recombine data from multiple tables 
-- Data Enrichment : "Getting Extra Info from another table"
-- CHECK the existence OR non-existence of specific data in aother table(just lookups) , JOIN a table with another table just to do a check the existence or non-existence of your records in another table 

-- JOIN TYPES 

-- BASIC JOINS : Left table(A) , Right Table(B)
1. No-Join : without using the keyword JOIN : to get all the data without joining tables 
2. Inner Join (intersection of table A and B)
3. Left Join : (All the data present in left table A)
4. Right Join : (All the data present in right table B)
5. FULL JOIN : (all the data from both the tables A and B) 

--Advanced JOINS 
1. Left-Anti JOIN : data present in A but not in B (A - (A INTERSECTION B))
2. Right-Antii JOIN : data present in B but not in A ( B - (B INTERSECTION A))
3. Full-Anti JOIN : all the data that are not common between A and B (A - (A INTERSECTION B)) union ( B - (B INTERSECTION A))
4. Cross JOIN : 


-- Basic Join

-- type 1 : No Join : to get all the data without joining tables : two results : returns data from the table without combining them 
-- we want to see two tables A and B , and there is no need to combine them 

-- syntax
SELECT * 
FROM LeftTable ; 

SELECT * 
FROM RightTable ;

-- task : retrieve all the data from customerds and orders as seperate results 

SELECT * 
FROM customers ; 

SELECT * 
FROM orders ; 


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


------------------------------
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

------------------------------
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




------------------------------
-- type 5 : FULL Join (returns All rows from left table and along with that all rows from the right table)

-- the order of the table in inner join or full join does not matter 

-- task : get all the customers and all the orders , even if there is no match 

SELECT * 
FROM customers 
FULL JOIN orders 
ON customers.id = orders.customer_id 



--------------------------------------
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


-----------------------------------------
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


-----------------------------------------
-- FULL ANTI JOIN(all data except inner join) : return all the rows that do not matches in either table 
					i.e. : all the unmatched rows from left table and all the unmatched rows from the right table 
-- the order of table is not important in FULL ANTI JOIN 
-- FULL ANTI JOIN can be used to check the existence , so if we combine FULL JOIN with where , we can check the existence or not existence of your data in another table 

SELECT * 
FROM leftTable 
FULL JOIN rightTable 
on leftTable.key = rightTable.key 
WHERE leftTable.key IS NULL 
	  OR 
	  rightTable.key IS NULL 


-- task : find customers without orders and order without customers 
SELECT * 
FROM customers 
FULL JOIN orders 
ON customers.id = orders.customer_id
WHERE customers.id IS NULL 
	  or 
	  orders.customer_id IS NULL 


-- solve the following task without using INNER JOIN 
-- Get all customers along with their orders , but only for customers who have placed an order , Without using INNER JOIN!!

SELECT * 
FROM customers

SELECT * 
FROM orders


SELECT * 
FROM customers AS c 
LEFT JOIN orders AS o 
ON c.id = o.customer_id 
WHERE o.customer_id IS NOT NULL 
	  
-- OR 
SELECT * 
FROM customers AS c 
FULL JOIN orders AS o 
ON c.id = o.customer_id 
WHERE c.id IS NOT NULL 
	  AND
	  o.customer_id IS NOT NULL 


--------------------------------------
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

---------------------------------------
-- How to choose between JOIN types ? DECSION TREE 

-- 1. only matching data required --> INNER JOIN 
-- 2. ALL ROWS (2 CASES): ONE SIDE(MASTER TABLE) is more important than others
				   	      --> LEFT JOINN or RIGHT JOIN 
--                      : BOTH SIDES(BOTH IMPORTANT) --> FULL JOIN 
-- 3. Only Unmatching : CASE 1(ONE SIDE) : if unmatching data from one table is important 
-- so , we want to see unmatching data from one table and use other table only for CHECK
--                      (i.e. ONE SIDE(MASTER TABLE)) --> USE LEFT ANTI JOIN
--                                                    --> or RIGHT ANTI JOIN 
--						CASE 2(BOTH SIDE) : if both of the tables are important , then
--                                          we will use FULL-ANTI JOIN


----------------------------------------------
-- Multi-Table JOIN (ADVANCED JOIN TYPE) 

-- way 1 : always start from main or master table , and master table will be our left table and all other tables will be instances of right table 

-- way 2 : don't consider any table as master table , treat all table equally , and then put JOIN accordingly 


-- Using SalesDB , Retrieve a list of all orders , along with the related customer , product and employee detals 
-- for each order , display : 
/* orderID 
   Customer's name 
   Product name 
   Sales amount 
   Product Price 
   SalesPerson's name
*/

SELECT * 
FROM Sales.Orders 

SELECT * 
FROM Sales.Customers 

SELECT * 
FROM Sales.Products 

SELECT * 
FROM Sales.Employees


SELECT ord.OrderID , ord.Sales ,
       cst.FirstName AS CustomerFirstName,
       cst.LastName  AS CustomerLastName ,
	   prd.Product , prd.Price ,
	   emp.FirstName AS EmployeeFirstName,
       emp.LastName  AS EmployeeLastName
	   
FROM Sales.Orders AS ord
INNER JOIN Sales.Customers AS cst ON ord.CustomerId = cst.CustomerID 
INNER JOIN Sales.Products AS prd ON ord.ProductID = prd.ProductID 
INNER JOIN Sales.Employees AS emp ON ord.SalesPersonID = emp.EmployeeID

-- the task is focusing on the table orders. so , we need all the orders , we cannot miss any order here , so here orders can be treated as main table , along with that we need other informations , which means the other tables are not that important like the orders. so this gives hint that orders is the main table , and it is going to be our starting point 

SELECT 
	ord.OrderID , ord.Sales , 
	cst.FirstName AS CustomerFirstName,
    cst.LastName  AS CustomerLastName ,
	prd.Product , prd.Price ,
	emp.FirstName AS EmployeeFirstName,
    emp.LastName  AS EmployeeLastName
FROM Sales.Orders AS ord
LEFT JOIN Sales.Customers AS cst ON cst.CustomerID = ord.CustomerID
LEFT JOIN Sales.Products AS prd ON ord.ProductID = prd.ProductID 
LEFT JOIN Sales.Employees AS emp ON ord.SalesPersonID = emp.EmployeeID






----------------------------------------------------------------------------------------
-- CHAPTER 6(COMBINING DATA) PART 2 : SET Operators 
-- UNION , UNION ALL , EXCEPT , INTERSECT 

-- If we want to combine the columns : use JOINS 
-- iF want to combine the rows : use SET Operators 

-- rules of the SET Operators : 
-- rule 1 : SQL CLAUSES : SET Operators can be used almost in all clauses like WHERE , JOIN , GROUP BY , HAVING but there is only one EXCEPTION : ORDER BY 

-- ORDER BY is allowed only once at the end of the query : can be used only at the end to sort the final result 
-- we cannot use ORDER BY in each SELECT statements or in each query , we can use it only once and only at the end of the ENTIRE QUERY 


-- rule 2 : The number of columns in EACH query must be SAME 

SELECT 
	FirstName , -- 2 columns here FirstName and LastName in the first SELECT query
	LastName 
From Sales.Customers 

UNION

SELECT 
	FirstName , -- 2 columns here FirstName and LastName in the second SELECT query
	LastName 
From Sales.Employees 



-- rule 3 : Data Types of columns in each query must be compatible (i.e. data types of columns in each query must match  


SELECT 
	CustomerID , -- int datatype
	LastName -- varchar datatype
From Sales.Customers 

UNION

SELECT 
	EmployeeID , -- int datatype
	LastName -- varchar datatype
From Sales.Employees 



-- rule 4 : the ORDER of COLUMNS  in each query must be same 


SELECT 
	LastName -- varchar datatype
	CustomerID , -- int datatype
From Sales.Customers 

UNION

SELECT 
	EmployeeID , -- int datatype
	LastName -- varchar datatype
From Sales.Employees -- the order of columns in above SELECT query and below SELECT query are not same , and it will give error**












































