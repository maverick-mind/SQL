-- DISTINCT : remove duplicates 
-- Don't use DISTINCT  unless necessary , it can slow down your query. for example id(primary key) are always unique , there is no point to apply DISTINCT over there , it will put extra work for the sql   
-- task : return unique list of all the countries 

SELECT DISTINCT country 
FROM customers 