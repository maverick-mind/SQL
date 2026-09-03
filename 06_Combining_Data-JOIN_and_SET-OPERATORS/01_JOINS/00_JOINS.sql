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

