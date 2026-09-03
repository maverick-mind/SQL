-- HAVING : filter aggregated data , HAVING  is used to filter the data but after aggregation , it means we can use HAVING only after using GROUP BY 

-- if you want to filter the data before aggregation , use : WHERE 
-- if you want to filter the data after aggregation , use : HAVING 

---------- task : find the average score for each country , considering only customers with a score not equal to 0 and return only those countries with an average score greater than 430


SELECT  
    country ,
    AVG(score) AS "average score" 
FROM customers
WHERE score != 0
GROUP BY country 
HAVING avg(score) > 430