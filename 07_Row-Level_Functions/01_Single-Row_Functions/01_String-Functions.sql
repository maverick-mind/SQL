
String Functions :  1. Manipulation (group of functions that can manipulate the string values)
                    1.1. CONCAT 
                    1.2. UPPER 
                    1.3. LOWER 
                    1.4. TRIM 
                    1.5. REPLACE 

                    2. Calculation (calculations on the string values)
                    2.1 Len  

                    3. String Extraction 
                    3.1 Left  
                    3.2 Right  
                    3.3 Substring 



1. Manipulation :
    1.1 CONCAT : Combines multiple strings into one 

Task : Concatenate first name and country into one column 

SELECT 
    first_name , country 
FROM customers

SELECT 
    first_name , country ,
    CONCAT(first_name , ' space ' , country) AS 'Name-with-Country as column name'
FROM customers



1.2 UPPER : Converts all characters to UPPERCASE     
1.3 LOWER : Converts all characters to LOWERCASE   


-> Task : Convert the first name of customers to lowercase 

SELECT 
    lower(first_name) AS 'lowercase first name'
FROM customers 
    

-> Task : Convert the first name of customers to uppercase 

SELECT 
    UPPER(first_name) AS 'uppercase first name'
FROM customers 



1.4 Trim : Removes Leading and Trailing spaces


-> Task : Remove the leading or Trailing spaces from the first_name of the customers 
SELECT 
    first_name , 
    TRIM(first_name) Trimed_whiteSpace, 
    LEN(first_name) length_name , 
    LEN(TRIM(first_name)) length_trim_name , 
    LEN(first_name) - LEN(TRIM(first_name)) AS difference_flag
FROM customers 



-> Task : find the customers whose first name contains Leading or Trailing spaces 

SELECT 
    first_name ,
    LEN(first_name) length_name , 
    LEN(TRIM(first_name)) length_trim_name
FROM customers 
WHERE first_name != TRIM(first_name)
-- or 
-- WHERE LEN(first_name) != LEN(TRIM(first_name))


1.5 REPLACE : Replaces a specific character with a new character 
              REPLACE old-value (for ex. '-') with a new-value (for ex. '/')

    SYNTAX : REPLACE(STRING , OLD-CHAR , NEW-CHAR)


-> Task : Remove dashes (-) from a phone number (STATIC VALUE)

SELECT 
    '123-456-789' AS phone ,
REPLACE('123-456-789' , '-' , '') AS clean_phone; 


-> REPLACE dashes (-) from a phone number (STATIC VALUE) with ('/')

SELECT 
    '123-456-7890' ,
REPLACE('123-456-7890' , '-' , '/') 


-> Another use case of replace function : 

-> TASK : Replace file extension from txt to csv

SELECT 
 'file_name.txt' AS '.txt file' ,
 REPLACE('file_name.txt' , '.txt' , '.csv') AS '.csv file';



STRING FUNCTIONS : 2. CALCULATIONS 
                   2.1 LEN (only one function in the calculations)

LEN : Counts how many characters in one value 

-> Task : calculate the length of each customer first name 

SELECT 
    first_name ,
    LEN(first_name) AS 'length of first name'
FROM customers 



STRING FUNCTIONS : 3. String Extraction
                   3.1 LEFT : Extract specific number of characters from the start
                       LEFT( value , No. of characters)
                   3.2 RIGHT  : Extract specific number of characters from the end
                       RIGHT( value , No. of characters)
                   3.3 SUBSTRING(value , starting index , number of characters)


-> TASK : Retrieve the first two characters of each first name 
-> TASK : Retrieve the last two characters of each first name 


SELECT 
    first_name , 
    LEFT(first_name , 2) AS 'first 2 characters from the left' , 
     RIGHT(first_name , 2) AS 'first 2 characters from the left'
FROM customers 


SELECT 
    first_name , 
    LEFT(TRIM(first_name) , 2) AS 'first 2 characters from the left' , -- because john has leading space
     RIGHT(first_name , 2) AS 'first 2 characters from the right'
FROM customers 


-> 3.3 SUBSTRIRNG(value , starting index , number of characters) : Extract a part of string at a apecified position 
-> Ater the 2nd character , extract 3 characters 

SELECT 
    first_name , 
    SUBSTRING(first_name , 2 , 3) AS 'substring'
FROM customers 


-> TASK : Ater the 2nd character , extract everything

SELECT 
    first_name , 
    SUBSTRING(first_name , 2 , LEN(first_name) - 2 + 1) AS 'substring'
FROM customers 

-> TASK : Retrieve a list of customers first name after removing the first CHARACTER 

SELECT 
    first_name ,
    SUBSTRING(TRIM(first_name) , 2 , LEN(first_name) - 2 + 1) AS 'name without 1st char'
FROM customers 