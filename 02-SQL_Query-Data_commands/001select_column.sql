
USE database name to change master to that database name 
here --> USE MyDatabase


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

 SELECT * 
From customers

-- task 2 : retrieve all data from table : orders 
SELECT * From orders 


 --task 3 : retrieve each customer's name , country and score
 
 -- first see , how the table looks like , what attributes / columns / field looks like in the table 
 SELECT * FROM customers

 -- the order you select the column , is the order it will give you the output (country , first_name , score)
 SELECT country , first_name ,  score FROM customers

 -- don't put comma(,) after last field name while using SELECT
 SELECT 
	first_name , 
	country , 
	score 
 FROM customers 

