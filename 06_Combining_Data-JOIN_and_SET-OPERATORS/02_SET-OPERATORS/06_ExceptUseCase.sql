EXCEPT use cases : 

-> DELTA DETECTION 
        : Identify the differences or changes(delta) between two batches of data. 

-> DATA COMPLETENESS CHECK 
        : EXCEPT operator can be used to compare tables to detect discrepancies between databases. 

        Let us say we are doing data migration from database1 to database2 , and we copy table1 in db1 into db2 , now to check the completeness (that all the data is copied into db2) , we can use EXCEPT operator to check if there is still any data that is in db1 but not in db2 , if the result of the except is EMPTY , it means all the rows in db1 exists in db2.
        Now , to check if both tables in db1 and db2 are identical or not , do again EXCEPT on table from db2 with table from db1 and if it results in EMPTY again , it means both the tables in both the db are identical.


SET OPERATORS : SUMMARY 

-> Combine the results of multiple queries into a single result set. 

Types 
-> UNION : returns all the unique rows in both the queries 

-> UNION ALL : returns all rows from both the queries (including the duplicate rows).

-> EXCEPT : returns only the distinct rows that are present in the first query but not in the second query 

-> INTERSECT : Common rows between two queries 

Rules to use set operators : 
-> same number of columns , compatible datatypes , order of column must be same 
-> 1st query controls column name (aliases) , controls the datatypes.

USE CASES : 
-> TO COMBINE INFORMATION : (UNION + UNION ALL)
-> DELTA DETECTION : (EXCEPT)
-> DATA COMPLETENESS CHECK: (EXCEPT)