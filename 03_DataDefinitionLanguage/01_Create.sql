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
