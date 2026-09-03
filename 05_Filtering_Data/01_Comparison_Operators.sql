CHAPTER 5 : FILTERING DATA : {COMPARISON OPERATORS , LOGICAL OPERATORS , BETWEEN , IN , LIKE }

COMPARISON OPERATOR : {=,<> != , > , >= , < , <=}

--COMPARISON OPERATORS 
-- task :COMPARISON OPERATOR equal (=) retrieve all customers from Germany 
SELECT * 
FROM customers 
WHERE country = 'Germany'

-- task :COMPARISON OPERATOR not equal(<> or !=) retrieve all customers not from Germany 
SELECT * 
FROM  customers 
WHERE country <> 'Germany'

-- task :COMPARISON OPERATOR greater than(>) retrieve all customers with a score greater than 500 
SELECT * 
FROM customers 
WHERE score > 500

-- task :COMPARISON OPERATOR greater than or equals to(>=) retrieve all customers with a score of 500 or more 
SELECT * 
FROM customers 
WHERE score >= 500


-- task :COMPARISON OPERATOR less than(<) retrieve all customers with a score less than 500 
SELECT * 
FROM customers 
WHERE score < 500

-- task :COMPARISON OPERATOR less than or equals to(<=) retrieve all customers with a score of 500 or less
SELECT * 
FROM customers 
WHERE score <= 500
