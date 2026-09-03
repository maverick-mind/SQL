-- GROUP BY : Aggregate Your Data : The result of GROUP BY is determined by the unique values of the grouped columns 

## Important Rule

When using `GROUP BY`, every column in the `SELECT` list must be **either**:

- Included in the `GROUP BY`, **or**
- Wrapped in an aggregate function.





-- task : find the total score(aggregated) for each country(GROUP BY)

-- here , sum(score) , has no column name 
SELECT 
    country , 
    SUM(score) 
From  customers 
GROUP BY country 


-- to show column name in query use 'alias' in sql , an alias is a temporary name , works only for that query , this name does not work in any other query , and we are not renaing anything in the database 

SELECT 
    country AS "customer's country" , 
    first_name, 
    SUM(score) AS "sum score" 
FROM customers 
GROUP BY country , first_name


-- task : find total score and total number of customer's for each country 
-- so we need GROUP BY on country , and aggregate function (sum for score) and (count for total number of customers) 

SELECT 
    country , 
    SUM(score) AS "country score" , 
    COUNT(*) AS "customer's from each country" 
FROM customers 
GROUP BY country 
