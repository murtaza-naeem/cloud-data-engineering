Create database BikeStores;

-- Column filteration (Select)

select * from sales.customers;

select * from production.categories;

-- Row filteration (Where)

select * from production.categories
where category_id = 6;

select * from production.stocks;

select * from production.stocks
where store_id = 3;

select product_id,quantity from production.stocks;

select state, zip_code from sales.customers;

select state from sales.customers
where state = 'CA';

select * from sales.customers
where street = '107 River Dr.';

select * from sales.customers
where city = 'New York';

select * from sales.customers
where state = 'NY';

-- Order By [ ASC | DESC ]

select first_name,last_name from sales.customers
order by first_name; -- > By Default ASC 

select first_name,last_name from sales.customers
order by first_name ASC;

select first_name,last_name from sales.customers
order by first_name DESC;

select * from production.products
order by list_price;

select * from production.products
order by list_price desc;

select * from sales.orders
order by order_date;

-- order by multiple column

select * from production.products
order by   model_year desc,list_price asc;





-- limiting rows
-- top n

select top 10 * from production.products
order by list_price desc;

select top 10 * from production.products
order by list_price asc;

select top 10	
	product_id,product_name,list_price
from production.products
order by list_price desc;

select top 10	
	product_id,product_name,list_price
from production.products
order by product_name asc, list_price desc;

-- total records in products table 321
-- 1 % 3.21
-- round upto 4

select top 1 percent
	* 
from production.products
order by list_price desc;

-- OFFSET AND FETCH

SELECT 
	*
FROM production.products
ORDER BY list_price DESC
OFFSET 5 ROWS
FETCH NEXT 5 ROWS ONLY;

-- DISTINCT
-- QUERY WILL RETURN UNIQUE VALUES

-- SYNTAX

-- SELECT DISTINCT COLUMN_NAME
	-- FROM TABLE_NAME

SELECT CITY
FROM SALES.customers
ORDER BY CITY;

SELECT DISTINCT CITY -- UNIQUE CITY
FROM SALES.customers
ORDER BY CITY;

SELECT DISTINCT STATE 
FROM SALES.customers
ORDER BY STATE;

SELECT DISTINCT MODEL_YEAR
FROM production.products;

-- MUTIPLE COLUMN RETURN UNIQUE COMBINATION

SELECT DISTINCT CITY, STATE
FROM SALES.customers;

SELECT DISTINCT STATE,CITY
FROM SALES.customers;

SELECT PHONE
FROM SALES.customers;

SELECT DISTINCT PHONE
FROM SALES.customers
ORDER BY PHONE;

-- LOGICAL OPERATORS
-- AND | OR

-- TRUE

-- CONDITION 1 TRUE | CONDITION 2 TRUE --> AND = TRUE
-- IK BHEE FALSE THEN AND = FALSE

-- OR

-- ATLEAST 1 CONDITION IS TURE -- OR = TRUE


SELECT * FROM production.products
WHERE 
	list_price > 400
ORDER BY list_price DESC;

SELECT * FROM production.products
WHERE 
	category_id = 1 AND list_price > 400
ORDER BY list_price;


SELECT * FROM production.products
WHERE 
	category_id = 1 OR list_price > 400
ORDER BY list_price DESC;


SELECT * FROM production.products
WHERE 
	model_year = 2018 AND list_price > 300
ORDER BY list_price;


SELECT * FROM production.products
WHERE 
	model_year = 2018 OR list_price > 300
ORDER BY list_price;


SELECT * FROM production.products
WHERE 
	list_price > 1000 AND (brand_id = 1 OR brand_id = 2);

/* Task 1: production.products table se un products ke product_name aur
list_price nikaalein jin ka model_year 2017 hai aur list_price 500 se zyada hai.
Result ko price ke hisaab se DESC order mein set karein.*/

SELECT product_name,list_price,model_year FROM production.products
WHERE model_year = 2017 AND list_price > 500
ORDER BY list_price DESC;

/*Task 2: sales.customers table se top 5 unique (distinct) city ke naam nikaalein jo
alphabetically (A to Z) sorted hon.*/

SELECT DISTINCT TOP 5  CITY FROM sales.customers
ORDER BY CITY;

-- Yeh nicha standard SQL hai aur bari datasets mein pagination ke liye zyada flexible mana jata hai.

SELECT DISTINCT city 
FROM sales.customers 
ORDER BY city 
OFFSET 0 ROWS FETCH NEXT 5 ROWS ONLY;

/*production.products table se top 3 products nikaalein jin ki 
list_price sab se zyada ho, magar model_year 2018 na ho.*/

SELECT TOP 3 product_name, list_price, model_year FROM production.products
WHERE model_year != 2018
ORDER BY list_price DESC;

