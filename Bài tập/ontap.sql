--Bài 1--
--1
select email
from customer
where active = 0;
--2
select title,description
from film
where rating = 'G'
ORDER BY title ASC
--3
select * 
from payment
where payment_date >= '2006-01-01' and amount < 2
--4
select *
from film
where rating = 'G'or rating ='PG'
--5
select *
from film
where rating in ('G','PG','PG-13')
--6
select title, rating
from film
where rating not in ('G','PG','PG-13')
--7
select * 
from film
where length > 50 and (rental_duration = 3 or rental_duration = 5)
--8
select title
from film
where length > 70 and (title LIKE '%RAINBOW%' or title LIKE 'TEXAS%' )
--9
select title, [description]
from film
where description is not null and (length between 80 and 90) and (rental_duration %2=1)
--10
select special_features from film
where replacement_cost BETWEEN 14 AND 16
ORDER BY special_features ASC
---bài 3---
--1
select rating, count(rating) AS Rating from film
GROUP BY rating
--2
select customer_id,count(last_name) as count
from customer
group by customer_id
--3
select customer_id
from payment
group by customer_id
order by sum(amount)
--4
select first_name,last_name, count(*) as count FROM actor
group by first_name,last_name
ORDER BY count DESC
--5
select sum(amount) as sum ,year(payment_date) as year,month(payment_date) as month 
from payment
group by year(payment_date),month(payment_date)
order by year(payment_date),month(payment_date)
--6
select store_id,count(*)
from inventory
group by store_id
having count(*) > 2300;
--7
select language_id 
from film
group by language_id
having min(length) < 47
--8
select year(payment_date) as year, month(payment_date) as month 
from payment
group by year(payment_date),month(payment_date)
having sum(amount) > 20000
--9
select rating from film
where length < 50
group by rating
having sum(length) > 250
order by rating ASC
--10
select language_id,count(*) as movies_count
from film
group by language_id
--11
select language.language_id, name, count(*) from language
join film on language.language_id = film.language_id
group by language.language_id, name
--12
select language.language_id, name, count(film_id) from language
left join film on language.language_id = film.language_id
group by language.language_id, name
--13
select customer.customer_id, first_name, last_name,
count(rental.rental_id) from customer
join rental on customer.customer_id = rental.customer_id
group by customer.customer_id, first_name, last_name
--14
select customer.customer_id, first_name, last_name,count(DISTINCT inventory.film_id) as movie_count
from customer
left join rental on rental.customer_id = customer.customer_id
left join inventory on rental.inventory_id = inventory.inventory_id
group by customer.customer_id,customer.first_name,customer.last_name
--15

SELECT DISTINCT p1.name
FROM test.person p1
 JOIN test.device_event ON p1.pID = test.device_event.pID
 JOIN test.event_type ON test.device_event.tID = test.event_type.tID AND importance = 0
WHERE p1.pID not IN (SELECT p2.pID
							FROM test.person p2
							 JOIN test.device_event ON p2.pID = test.device_event.pID
							JOIN test.event_type ON test.device_event.tID = test.event_type.tID AND importance = 0
							WHERE datediff(minute, startDate, endDate) > 100 AND p1.pID = p2.pID
						)