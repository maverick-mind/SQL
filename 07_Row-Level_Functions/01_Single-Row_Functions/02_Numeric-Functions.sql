
NUMERIC-FUNCTIONS : To manipulate the numeric values 

-> ROUND Function : round of after decimal places 

SELECT 3.526 ,
    ROUND(3.526 , 2) AS round_2 , -- 2 decimal places 
    ROUND(3.526 , 1) AS round_1 ,-- 1 decimal places 
    ROUND(3.526 , 0) AS round_0 -- 1 decimal places 


-> ABS : Convert any negative number to positive 

SELECT 
    -10 ,
    ABS(-10),
    ABS(10)
