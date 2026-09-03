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
