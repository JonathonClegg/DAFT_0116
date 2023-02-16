USE sakila;

-- Q1. 1. find the running total of rental payments for each customer in the payment table, ordered by payment date. By selecting the customer_id, payment_date, and amount columns from the payment table, and then applying the SUM function to the amount column within each customer_id partition, ordering by payment_date.
SELECT 
    customer_id, 
    payment_date, 
    amount, 
    SUM(amount) OVER (PARTITION BY customer_id ORDER BY payment_date) AS running_total 
FROM payment;

-- Q2. 2.  find the rank and dense rank of each payment amount within each payment date by selecting the payment_date and amount columns from the payment table, and then applying the RANK and DENSE_RANK functions to the amount column within each payment_date partition, ordering by amount in descending order.


SELECT 
    DATE(payment_date) AS date,
    amount, 
    DENSE_RANK() OVER (PARTITION BY DATE(payment_date) ORDER BY amount DESC) AS transaction_dense_rank,
    RANK() OVER (PARTITION BY DATE(payment_date) ORDER BY amount DESC) AS transaction_rank
FROM payment;

-- Q3. Find the ranking of each film based on its rental rate, within its respective category. 
SELECT 
	category.name,
	film.title, 
    film.rental_rate,
	DENSE_RANK() OVER (PARTITION BY category.name ORDER BY film.rental_rate DESC) AS film_rental_rate_rank
FROM film
JOIN film_category USING(film_id)
JOIN category USING(category_id)
ORDER BY category.name, film.rental_rate DESC, film.title;

-- Q4. (OPTIONAL) update the previous query from above to retrieve only the top 5 films within each category

SELECT * FROM
(
SELECT 
	category.name,
	film.title, 
    film.rental_rate,
	DENSE_RANK() OVER (PARTITION BY category.name ORDER BY film.rental_rate DESC, film.title) AS film_rental_rate_rank,
	ROW_NUMBER() OVER (PARTITION BY category.name ORDER BY film.rental_rate DESC, film.title) AS row_num
FROM film
JOIN film_category USING(film_id)
JOIN category USING(category_id)
ORDER BY category.name, row_num
) AS sub_tab
WHERE row_num <=5;

-- Q5. find the difference between the current and previous payment amount and the difference between the current and next payment amount, for each customer in the payment table

SELECT
	payment_id
    customer_id, 
    amount,
	payment_date, 
(amount - LAG(amount) OVER (PARTITION BY customer_id ORDER BY DATE(payment_date))) AS chg,
(LEAD(amount)  OVER (PARTITION BY customer_id ORDER BY DATE(payment_date)) - amount) AS diff
FROM payment
ORDER BY customer_id;
