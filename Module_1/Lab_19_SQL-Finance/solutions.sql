USE olist;
-- 1. From the order_items table, find the price of the highest priced order and lowest price order.
SELECT price FROM order_items
ORDER BY price DESC
LIMIT 1;
-- Highest price = 6735
SELECT price FROM order_items
ORDER BY price
LIMIT 1;
-- Lowest price = 0.85

-- 2. From the order_items table, what is range of the shipping_limit_date of the orders?
SELECT shipping_limit_date FROM order_items
ORDER BY shipping_limit_date
Limit 1;
-- Date is 2016-09-19
SELECT shipping_limit_date FROM order_items
ORDER BY shipping_limit_date DESC
Limit 1;
-- Date is 2020-04-10

-- 3. From the customers table, find the states with the greatest number of customers.
SELECT customer_state, count(customer_unique_id) FROM customers
GROUP BY customer_state
ORDER BY count(customer_unique_id) DESC
Limit 5;
-- 'SP','41746'
-- 'RJ','12852'
-- 'MG','11635'
-- 'RS','5466'
-- 'PR','5045'

-- 4. From the customers table, within the state with the greatest number of customers, find the cities with the greatest number of customers.
SELECT customer_state, customer_city, count(customer_unique_id) FROM customers
WHERE customer_state="SP" 
GROUP BY customer_city
ORDER BY count(customer_unique_id) DESC
Limit 5;
-- 'SP','sao paulo','15540'
-- 'SP','campinas','1444'
-- 'SP','guarulhos','1189'
-- 'SP','sao bernardo do campo','938'
-- 'SP','santo andre','796'


-- 5. From the closed_deals table, how many distinct business segments are there (not including null)?
SELECT count(DISTINCT business_segment) FROM closed_deals
WHERE business_segment<>"Null";
-- 33

-- 6. From the closed_deals table, sum the declared_monthly_revenue for duplicate row values in business_segment and find the 3 business segments with the highest declared monthly revenue (of those that declared revenue).
SELECT DISTINCT business_segment, sum(declared_monthly_revenue) FROM closed_deals
GROUP BY business_segment
ORDER BY sum(declared_monthly_revenue) DESC
LIMIT 3;
-- 'construction_tools_house_garden','50695006'
-- 'phone_mobile','8000000'
-- 'home_decor','710000'


-- 7. From the order_reviews table, find the total number of distinct review score values.
SELECT count(DISTINCT review_score) FROM order_reviews;
-- 5

-- 8. In the order_reviews table, create a new column with a description that corresponds to each number category for each review score from 1 - 5, then find the review score and category occurring most frequently in the table.
ALTER TABLE order_reviews
ADD number_cat_description varchar(255);

UPDATE order_reviews
SET number_cat_description = 'GREAT'
WHERE review_score = 5;
UPDATE order_reviews
SET number_cat_description = 'GOOD'
WHERE review_score = 4;
UPDATE order_reviews
SET number_cat_description = 'OK'
WHERE review_score = 3;
UPDATE order_reviews
SET number_cat_description = 'BAD'
WHERE review_score = 2;
UPDATE order_reviews
SET number_cat_description = 'AWFUL'
WHERE review_score = 1;

SELECT count(review_score), number_cat_description FROM order_reviews
GROUP BY number_cat_description
ORDER BY count(review_score) DESC;
-- '57420','GREAT'
-- '19200','GOOD'
-- '11858','AWFUL'
-- '8287','OK'
-- '3235','BAD'

-- 9. From the order_reviews table, find the review value occurring most frequently and how many times it occurs.
SELECT count(review_score), number_cat_description FROM order_reviews
GROUP BY number_cat_description
ORDER BY count(review_score) DESC
LIMIT 1;
-- '57420','GREAT'
