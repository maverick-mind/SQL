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

