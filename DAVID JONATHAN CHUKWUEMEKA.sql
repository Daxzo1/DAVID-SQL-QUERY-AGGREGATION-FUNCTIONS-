-- This is to show all the columns in our database
SELECT * FROM artisan_coffee_sales;

--selecting product_name and total_amount to check financial performance.
SELECT product_name,total_amount FROM artisan_coffee_sales;

SELECT customer_name,country FROM artisan_coffee_sales;

SELECT order_date,customer_rating FROM artisan_coffee_sales;

-- AS
SELECT total_amount AS revenue FROM artisan_coffee_sales;

SELECT customer_name AS buyer_name FROM artisan_coffee_sales;

-- WHERE
SELECT * FROM artisan_coffee_sales
WHERE category= 'Whole Bean';
SELECT * FROM artisan_coffee_sales
WHERE total_amount > 50;
SELECT * FROM artisan_coffee_sales
WHERE customer_rating=5;

--AND
SELECT * FROM artisan_coffee_sales
WHERE category= 'Equipment' AND price > 100;

--OR 
SELECT * FROM artisan_coffee_sales 
WHERE roast_level = 'Light' OR roast_level = 'Medium';

SELECT * FROM artisan_coffee_sales
WHERE country = 'Canada' OR country = 'USA';

SELECT * FROM artisan_coffee_sales 
WHERE category = 'Merch' OR category = 'Equipment';

SELECT * FROM artisan_coffee_sales
WHERE customer_rating =1 OR customer_rating =2;

--LIKE
SELECT * FROM artisan_coffee_sales
WHERE product_name LIKE 'Espresso';

SELECT * FROM artisan_coffee_sales
WHERE customer_name LIKE 'A%';

SELECT * FROM artisan_coffee_sales
WHERE product_name LIKE '%Blend%';

SELECT * FROM artisan_coffee_sales
WHERE customer_name LIKE 'Smith%';


--BETWEEN
SELECT  * FROM artisan_coffee_sales 
WHERE order_date BETWEEN '2023-01-01' AND '2023-03-31';

SELECT * FROM artisan_coffee_sales 
WHERE total_amount BETWEEN 30 AND 60;

SELECT * FROM artisan_coffee_sales
WHERE price BETWEEN 15 AND 25;

SELECT * FROM artisan_coffee_sales
WHERE quantity BETWEEN 3 AND 5;


-- AGGREGATIONS 
-----COUNT()
SELECT COUNT (order_id) AS total_transaction FROM artisan_coffee_sales;

SELECT COUNT (order_id) AS Canadian_orders FROM artisan_coffee_sales 
WHERE country = 'Canada';
SELECT COUNT (order_id) AS total_transaction FROM artisan_coffee_sales 
WHERE customer_rating = 5;

SELECT COUNT (order_id) AS whole_bean_sales FROM artisan_coffee_sales
WHERE category = 'Whole Bean';

--SUM
SELECT SUM (total_amount) AS total_life_revenue FROM artisan_coffee_sales;

SELECT SUM (quantity) AS total_quantity FROM artisan_coffee_sales; 

SELECT SUM (total_amount) AS total_revenue FROM artisan_coffee_sales
WHERE category = 'Equipment';

SELECT SUM(quantity) AS dark_roast_volume
FROM artisan_coffee_sales
WHERE roast_level='Dark';

--AVG
SELECT AVG(total_amount) AS average_order_value FROM artisan_coffee_sales;

SELECT AVG(customer_rating) AS average_rating FROM artisan_coffee_sales;

SELECT AVG(quantity) AS average_bean_quantity FROM artisan_coffee_sales
WHERE category = 'Whole Bean';

--MIN
SELECT MIN(price) AS cheapest_price FROM artisan_coffee_sales;

SELECT MIN(total_amount) AS total_equipment_amount FROM artisan_coffee_sales;

--MAX
SELECT MAX(price) AS most_expensive FROM artisan_coffee_sales;

SELECT MAX(quantity) AS largest_subscription_quantity FROM artisan_coffee_sales 
WHERE category = 'Subscription';
--GROUP BY
SELECT category,SUM(total_amount) AS total_revenue FROM artisan_coffee_sales
GROUP BY category;

SELECT country, COUNT (order_id) AS total_orders FROM artisan_coffee_sales
GROUP BY country;

SELECT order_date, SUM (quantity) AS total_volume FROM artisan_coffee_sales
GROUP BY order_date;

--HAVING 
SELECT category,SUM(total_amount) AS total_revenue FROM artisan_coffee_sales
GROUP BY category
HAVING SUM(total_amount) > 1000;


SELECT roast_level,AVG(customer_rating) AS average_customer_rating FROM artisan_coffee_sales
GROUP BY roast_level
HAVING AVG(customer_rating) >= 4.5;

SELECT order_date, SUM(quantity) AS total_items
FROM artisan_coffee_sales
GROUP BY order_date
HAVING SUM(quantity) > 50;