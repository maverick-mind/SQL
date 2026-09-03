SEARCH OPERATOR : {LIKE} 


SEARCH OPERATOR : LIKE : used to SEARCH for a pattern in the text , if you have text or characters and you are searching for a specific pattern inside the text , then use LIKE

-- LIKE OPERATOR : %(more flixible) or _(rigid) 
-- %(ANYTHING (0 , 1 , MANY)) --> %char(the last character should be char , we don't care about all other characters ,
--       char%(the first character should be char , we don't about all other characters , 
--       %char%(char could be present at any position inside the word)
-- _(underscore)(Exact 1) : 


-- task : Find all the customers whose first name starts with 'M'

SELECT * 
FROM customers 
WHERE first_name LIKE 'M%'

-- task : Find all the customers whose first name ends with 'n'

SELECT * 
FROM customers 
WHERE first_name LIKE '%n'


-- task : Find all the customers whose name contains 'r'
SELECT * 
FROM customers 
WHERE first_name LIKE '%r%'

-- task : Find all the customers whose first name has 'r' in the third position 

SELECT * 
FROM customers 
WHERE first_name LIKE '__r%'


-- task : Find all the customers whose first name has 'r' in the third position , 'i' in the fourth position 
SELECT * 
FROM customers 
WHERE first_name LIKE '__ri%'

-- task : Find all the customers whose first name has 't' in the last third position , 

SELECT * 
FROM customers 
WHERE first_name LIKE '%t__'

