USE sakila;

SELECT 
    MAX(length) AS max_duration,
    MIN(length) AS min_duration
FROM film;

SELECT 
    FLOOR(AVG(length)/60) AS avg_hours,
    ROUND(AVG(length) % 60) AS avg_minutes
FROM film;

SELECT 
    DATEDIFF
    (MAX(rental_date), MIN(rental_date)) AS operating_days
FROM rental;

SELECT 
    rental_id,
    rental_date,
    MONTH(rental_date) AS rental_month,
    DAYNAME(rental_date) AS rental_weekday
FROM rental
LIMIT 20;

SELECT 
    rental_id,
    rental_date,
    CASE 
        WHEN DAYOFWEEK(rental_date) IN (1,7) THEN 'weekend'
        ELSE 'workday'
    END AS DAY_TYPE
FROM rental
LIMIT 20;

SELECT 
    title,
    IFNULL(length, 'Not Available') AS rental_duration
FROM film
ORDER BY title ASC;


SELECT COUNT(*) AS total_films 
FROM
film;

SELECT
rating,
COUNT(*) AS num_films
FROM film
GROUP BY rating;

SELECT
rating,
COUNT(*) AS num_films
FROM film
GROUP BY rating
ORDER BY num_films DESC;

SELECT rating, ROUND(AVG(length),2) AS avg_duration
FROM film
GROUP BY rating
ORDER BY avg_duration DESC;

SELECT
rating,
ROUND(AVG(length),2) AS avg_duration
FROM film
GROUP BY rating
HAVING AVG(length) > 120;




