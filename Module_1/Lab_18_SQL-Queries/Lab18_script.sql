SELECT * from ironhack_example.applestore;
-- 1. What are the different genres?
SELECT DISTINCT prime_genre from ironhack_example.applestore;
-- 2. Which is the genre with the most apps rated?
SELECT prime_genre, sum(rating_count_tot) as sum FROM ironhack_example.applestore
GROUP BY prime_genre
ORDER BY sum DESC;
-- 3. Which is the genre with most apps?
SELECT prime_genre, count(DISTINCT track_name) as count_app FROM ironhack_example.applestore
GROUP BY prime_genre
ORDER BY count_app DESC
limit 1;
-- 4. Which is the one with least?
SELECT prime_genre, count(DISTINCT track_name) as count_app FROM ironhack_example.applestore
GROUP BY prime_genre
ORDER BY count_app
limit 1;
-- 5. Find the top 10 apps most rated.
SELECT DISTINCT track_name, sum(DISTINCT rating_count_tot) as sum_of_ratings FROM ironhack_example.applestore
GROUP BY track_name
ORDER BY sum_of_ratings DESC
limit 10;
-- 6. Find the top 10 apps best rated by users.
SELECT DISTINCT track_name, prime_genre, user_rating as best_rating FROM ironhack_example.applestore
ORDER BY best_rating DESC
limit 10;
SELECT sum(DISTINCT rating_count_tot) as total_ratings FROM ironhack_example.applestore;
SELECT DISTINCT track_name, user_rating_ver, rating_count_tot
FROM ironhack_example.applestore
ORDER BY user_rating_ver DESC
limit 10;
-- 10. How could you take the top 3 regarding both user ratings and number of votes?
SELECT DISTINCT track_name, user_rating, rating_count_tot FROM ironhack_example.applestore
ORDER BY user_rating DESC, rating_count_tot DESC
limit 3;
-- 11. Do people care about the price of an app? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?
-- Average rating per price
SELECT DISTINCT price, avg(user_rating) as avg_user_rating
FROM ironhack_example.applestore
GROUP BY price
ORDER BY avg_user_rating DESC;
-- Average price per rating
SELECT DISTINCT user_rating, avg(price) as avg_price
FROM ironhack_example.applestore
GROUP BY user_rating
ORDER BY avg_price DESC;