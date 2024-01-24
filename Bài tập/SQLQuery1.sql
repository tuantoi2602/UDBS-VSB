/*select *
from actor
where (last_name != 'AKROYD' OR first_name = 'KIRSTEN')
--AND actor_id BETWEEN 92 AND 100
--AND actor_id >= 92 AND actor_id <= 100
--AND actor_id = 92 AND actor_id = 97 OR actor_id = 103
AND actor_id NOT IN(92,97,103)
ORDER BY last_name  ASC
--ORDER BY first_name, last_name ASC*/

/*select *
from actor
where last_name LIKE '%AC%'*/

/*select distinct last_name --mean not the same name in last_name
from actor*/

/*select * from rental
where return_date IS NULL*/


/*--1
select email 
from customer
where active = 0*/


--2
/*select title, description from film
where rating = 'G'
ORDER by title ASC*/

--3
/*select * from payment
where payment_date < '2006' AND amount < '2'*/

--4
/*select * from film
where rating ='G' or rating = 'PG'*/

--5
/*select * from film
where rating in ('G','PG','PG-13')*/

--6
/*select description from film
where rating not in ('G','PG','PG-13')*/

--7
/*select * from film
where length > 50 
and (rental_duration = 3 or rental_duration = 5)*/

--8
/*select title from film
where length > 70 
AND (title like '%RAINBOW%' or title like 'TEXAS%')*/

--9
/*select title from film
where description IS NOT null and (length between 80 and 90) and (rental_duration %2 = 1) */

--10
/*select special_features from film
where replacement_cost BETWEEN 14 AND 16
ORDER BY special_features ASC*/

--11
/*select * from film
where rental_duration < 4 or rating = 'PG'*/

--12
/*select * from address
where postal_code IS NOT NULL*/

--13
/*select customer_id from rental
where rental_date is not null*/

--14
/*select YEAR(payment_date) AS pay_year, MONTH(payment_date) AS pay_month, DAY(payment_date) AS pay_day 
from payment*/
--15
/*select title from film
where LEN(title) != 20*/

--16
SELECT rental_id, DATEDIFF(minute, rental_date, return_date) AS duration
FROM rental


--17
/*select first_name + ' '+ last_name as full_name
from customer*/

--18
/*select coalesce(postal_code,'empty') 
from address*/

--19
/*SELECT rental_id,LEFT(rental_date,11)+  '- ' +LEFT(return_date,11) as interval 
from rental
where return_date is not null*/

--20
/*SELECT rental_id, LEFT(rental_date,11) +coalesce('-'+ left(return_date,11),'')as interval
FROM rental*/


--21
/*select count(*) from film*/
--22
/*select count (distinct rating) from film*/
--23
/*select count(address), count(postal_code),count(distinct postal_code) 
from address*/

--24
/*select min(length), max(length), avg(length)
from film*/

--25
/*select count(*),sum(amount) from payment
where year(payment_date) = '2005'*/

--26
/*select sum(len(title)) from film*/
---Lesson 2:
/*select all students together with codes of their subjects
select * from student, student_subject --All combine    
Select * from student join student_subject on student.login = student_subject.login
Select student.login,student.name,student.surname,student_subject.code from student join student_subject on student.login = student_subject.login*/
--13 --11
/*select store.store_id, store_address.address,staff.first_name,staff.last_name,staff_address.address
from store
    join staff on store.manager_staff_id = staff.staff_id
    join address store_address on store.address_id = store_address.address_id
    join address staff_address on staff.address_id = staff_address.address_id
*/
--1
select * from city 
join country on country.country_id = city.country_id
--2
/*select title from film
join language on language.language_id = film.language_id
*/
--3
/*select * from rental
join customer on customer.customer_id = rental.customer_id
where last_name like '%SIMPSON%' */
--4
/*select * from customer
join address on customer.address_id = address.address_id
where last_name like '%SIMPSON%'*/
--5
/*select first_name,last_name,address, postal_code, city from customer
join address on address.address_id = customer.address_id
join city on city.city_id = address.city_id*/
--6
/*select * from customer
join address on address.address_id = customer.address_id
join city on city.city_id = address.city_id*/
--7
/*select * from rental
join staff on staff.staff_id = rental.staff_id
join customer on customer.customer_id = rental.customer_id
join inventory on inventory.inventory_id = rental.inventory_id
join film on film.film_id = inventory.inventory_id*/
--8
/*select title from film
join film_actor on film_actor.film_id = film.film_id
join actor on actor.actor_id = film_actor.actor_id*/
--9
/*select first_name, last_name,title from actor
join film_actor on film_actor.actor_id = actor.actor_id
join film on film.film_id = film_actor.film_id*/
--10
/*
select * from film
join film_category on film_category.film_id = film.film_id
join category on category.category_id = film_category.category_id
where name like 'Horror'*/
--12
/*select * from film
join film_actor on film_actor.film_id = film.film_id
join film_category on film_category.film_id= film.film_id
order by film.film_id*/
--13
/*select * from film
join film_actor on film_actor.film_id = film.film_id
join actor on actor.actor_id = film_actor.actor_id
join film_category on film_category.film_id= film.film_id
join category on category.category_id = film_category.category_id
order by actor.actor_id*/
--14
/*select distinct film.title
from film
    join inventory on inventory.film_id = film.film_id*/
--15
/*select DISTINCT first_name,last_name from actor
join film_actor on film_actor.actor_id = actor.actor_id
join film on film.film_id = film_actor.film_id
join film_category on film_category.film_id = film.film_id
join category on category.category_id = film_category.category_id
where name LIKE 'Comedy'*/
--16
/*SELECT DISTINCT customer.first_name, customer.last_name
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
JOIN rental ON customer.customer_id = rental.customer_id
JOIN inventory ON rental.inventory_id = inventory.inventory_id
JOIN film ON inventory.film_id = film.film_id
WHERE country.country = 'Italy' AND film.title = 'MOTIONS DETAILS'*/
--17
/*SELECT DISTINCT customer.first_name, customer.last_name
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
JOIN film ON film_actor.film_id = film.film_id
JOIN inventory ON film.film_id = inventory.film_id
JOIN rental ON inventory.inventory_id = rental.inventory_id
JOIN customer ON rental.customer_id = customer.customer_id
WHERE actor.first_name = 'SEAN' AND actor.last_name = 'GUINESS' AND rental.return_date IS NULL*/
--18
SELECT payment.payment_id, payment.amount, rental.rental_date
FROM payment
JOIN rental ON payment.rental_id = rental.rental_id
--21
/*SELECT DISTINCT film.title
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id
LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id
LEFT JOIN customer ON customer.customer_id = rental.customer_id
WHERE (customer.first_name = 'TIM' AND customer.last_name = 'CARY') OR film.length = 48*/
--23
/*SELECT DISTINCT first_name, last_name
FROM customer
JOIN rental ON customer.customer_id = rental.customer_id
LEFT JOIN payment ON rental.rental_id = payment.rental_id
WHERE payment.payment_id IS NULL*/

--24
/*SELECT film.title, language.name
FROM film
LEFT JOIN language ON film.language_id = language.language_id AND
language.name LIKE 'I%'*/
--25
/*SELECT first_name, last_name, payment.payment_id
FROM customer
LEFT JOIN payment ON customer.customer_id = payment.customer_id AND
payment.amount > 9*/
--26
/*select rental_id,film.title,city_id,country_id from rental
left join inventory on inventory.inventory_id = rental.inventory_id
left join film on film.film_id = inventory.film_id 
left join customer on customer.customer_id = rental.customer_id
left join address on address.address_id = customer.address_id 
left join city on city.city_id = address.address_id AND address.address LIKE '%A%'
left join country on country.country_id = city.country_id
where film.title = '%U%'*/
--27
/*SELECT DISTINCT film.title, customer.last_name
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id
LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id AND
rental_date > '2006-01-01'
LEFT JOIN customer ON rental.customer_id = customer.customer_id
ORDER BY film.title*/


--19
/*select language.name,film.title
from language 
left join film on language.language_id = film.language_id;*/
--------------LESSON 3 ----------------------------------------
--1
/*select rating, count(rating) AS Rating from film
GROUP BY rating*/
--2
/*select customer_id, count(last_name) AS count from customer
GROUP BY customer_id*/
--3fail
/*select customer_id from payment
where amount is not null
group by customer_id*/
--4
/*select first_name,last_name, count(*) as count FROM actor
group by first_name,last_name
ORDER BY count DESC*/
--5
/*select sum(amount),year(payment_date) as year,month(payment_date) as month 
from payment
group by year(payment_date),month(payment_date)
order by year(payment_date),month(payment_date)*/
--6
/*select store_id, count(*)
from inventory
group by store_id
having count(*) > 2300*/
--7
/*select language_id from film
group by language_id
having min(length) < 47*/
--8
/*select year(payment_date) as year, month(payment_date) as month 
from payment
group by year(payment_date),month(payment_date)
having sum(amount) > 20000*/
--9
/*select rating from film
where length < 50
group by rating
having sum(length) > 250
order by rating ASC*/
--10
/*select language_id,count(*) from film
group by language_id*/
--11
/*select language.language_id, name, count(*) from language
join film on language.language_id = film.language_id
group by language.language_id, name*/
--12
/*select language.language_id, name, count(film_id) from language
left join film on language.language_id = film.language_id
group by language.language_id, name*/
--13
/*select customer.customer_id, first_name, last_name,
count(rental.rental_id) from customer
join rental on customer.customer_id = rental.customer_id
group by customer.customer_id, first_name, last_name*/
--14
/*select customer.customer_id, first_name, last_name,count(DISTINCT inventory.film_id) as movie_count
from customer
left join rental on rental.customer_id = customer.customer_id
left join inventory on rental.inventory_id = inventory.inventory_id
group by customer.customer_id,customer.first_name,customer.last_name*/
--15
/*SELECT actor.first_name, actor.last_name
FROM actor
JOIN film_actor ON actor.actor_id = film_actor.actor_id
GROUP BY actor.actor_id, actor.first_name, actor.last_name
HAVING COUNT(film_actor.film_id) > 20
--16
SELECT customer.customer_id, first_name, last_name,
SUM(payment.amount) AS total, MIN(payment.amount) AS minimal,
MAX(payment.amount) AS maximal, AVG(payment.amount) AS average
FROM customer
LEFT JOIN rental ON customer.customer_id = rental.customer_id
LEFT JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY customer.customer_id, first_name, last_name
--17
SELECT category.category_id, category.name,
AVG(film.length) AS average
FROM category
LEFT JOIN film_category ON category.category_id = film_category.
category_id
LEFT JOIN film ON film_category.film_id = film.film_id
GROUP BY category.category_id, category.name
--18
SELECT film.film_id, film.title, SUM(payment.amount) AS total
FROM film
LEFT JOIN inventory ON film.film_id = inventory.film_id
LEFT JOIN rental ON inventory.inventory_id = rental.inventory_id
LEFT JOIN payment ON rental.rental_id = payment.rental_id
GROUP BY film.film_id, film.title
HAVING SUM(payment.amount) > 100
*/
--19
/*select count(distinct category.category_id) as count_movie,actor.actor_id,actor.last_name,actor.first_name from category
right join film_category on film_category.category_id = category.category_id
right join film_actor on film_actor.film_id = film_category.film_id
right join actor on actor.actor_id = film_actor.actor_id
group by actor.actor_id,actor.last_name,actor.first_name*/
--20
SELECT address.address, city.city, country.country
FROM customer
JOIN address ON customer.address_id = address.address_id
JOIN city ON address.city_id = city.city_id
JOIN country ON city.country_id = country.country_id
LEFT JOIN rental ON customer.customer_id = rental.customer_id
LEFT JOIN inventory ON rental.inventory_id = inventory.inventory_id
LEFT JOIN film_actor ON inventory.film_id = film_actor.film_id
GROUP BY address.address, city.city, country.country
HAVING COUNT(DISTINCT film_actor.actor_id) >= 40

-------------------------Lesson 4-----------------------------

--1
/*select film.film_id,title from film
join film_actor on  film.film_id = film.film_id
where actor_id = 1


select film_id, title
from film
where film_id in (select film_id from film_actor where actor_id = 1)

select film_id,title
from film
where exists(select * from film_actor where film.film_id = film_actor.film_id and actor_id = 1)
*/
--2 Select IDs of the movies of actor with ID = 1.
select film.film_id from film
where film_id in (select film_id from film_actor where actor_id =1)

select film.film_id from film
where exists (select * from film_actor where film.film_id = film_actor.film_id and actor_id =1)
--3
select title from film
where film_id in (select film_id from film_actor where actor_id = 1) and 
film_id in (select film_id from film_actor where actor_id = 10)

select title from film
where exists (select * from film_actor where film.film_id = film_actor.film_id and actor_id =1)
AND exists (select * from film_actor where film.film_id = film_actor.film_id  and actor_id = 10)
--4
select title from film
where film_id in (select film_id from film_actor where actor_id = 1) 
OR
film_id in (select film_id from film_actor where actor_id = 10)

select title from film
where exists (select * from film_actor where film.film_id = film_actor.film_id and actor_id = 1) 
OR
exists (select * from film_actor where film.film_id = film_actor.film_id and actor_id = 10)
--5
select film_id from film
where film_id not in (select film_id from film_actor where actor_id = 1)

select film_id from film
where not exists (select * from film_actor where film.film_id = film_actor.film_id and actor_id = 1)
--6 Select IDs and titles of the movies in which plays actor with ID = 1 or actor with ID = 10, but not both together.
/*select film.film_id, title from film
where film_id in (select film_id from film_actor where actor_id = 1 or actor_id = 10)
and not (film_id in (select film_id from film_actor where actor_id = 1)
and film_id in (select film_id from film_actor where actor_id = 10))*/
--7
select film.film_id, title from film
where film_id in (select film_id from film_actor join actor
on actor.actor_id = film_actor.actor_id
where actor.first_name = 'PENELOPE' and actor.last_name = 'GUINESS')
AND film_id in (select film_id from film_actor join actor
on actor.actor_id = film_actor.actor_id
where actor.first_name = 'CHRISTIAN' and actor.last_name = 'GABLE')

select film.film_id, title from film
where exists (select * from film_actor where film.film_id = film_actor.film_id and
join actor on actor.actor_id = film_actor.actor_id
and actor.first_name = 'PENELOPE' and actor.last_name = 'GUINESS')
and exists (select * from film_actor join actor on actor.actor_id = film_actor.actor_id
where actor.first_name = 'CHRISTIAN' and actor.last_name = 'GABLE')
--8
select film.film_id, title from film
where film_id not in (select film_id from film_actor join actor
on actor.actor_id = film_actor.actor_id
where actor.first_name = 'PENELOPE' and actor.last_name = 'GUINESS')
--9
--11


select first_name,last_name from customer
where last_name in (select last_name from actor)

select first_name, last_name from customer
where exists (select * from actor where actor.last_name = customer.last_name)
--12
select title from film f1
where length in (select length from film f2 where f1.film_id != f2.film_id)

select title from film f1
where exists (select * from film f2 where f1.length = f2.length and f1.film_id != f2.film_id)



--13
select title from film
where length < ANY (select length from actor
join film_actor on actor.actor_id = film_actor.actor_id
join film on film.film_id = film_actor.film_id
where actor.first_name = 'BURT' and actor.last_name ='POSEY')

select title from film
where length < ANY (select length from actor
join film_actor on actor.actor_id = film_actor.actor_id
join film on film.film_id = film_actor.film_id
where actor.first_name = 'BURT' and actor.last_name = 'POSEY' )
--14
select actor.first_name,actor.last_name from actor
where 50 > ANY (select length from film
join film_actor on actor.actor_id = film_actor.actor_id
where film_actor.actor_id = actor.actor_id)

--16
SELECT DISTINCT f1.title
FROM
rental r1
JOIN inventory i1 ON r1.inventory_id = i1.inventory_id
JOIN film f1 ON i1.film_id = f1.film_id
WHERE EXISTS (
SELECT *
FROM
rental r2
JOIN inventory i2 ON r2.inventory_id = i2.inventory_id
WHERE i2.film_id = i1.film_id AND r1.customer_id != r2.customer_id)

select title from film f1
where length in (select length from film f2 where f1.film_id != f2.film_id)

select distinct title from film f1
join inventory i1 on f1.film_id = i1.film_id
join rental r1 on r1.rental_id = i1.rental_id
where i1.film_id in (select i2.film_id from inventory i2 where )

select title from film
join inventory on inventory.film_id = film.film_id
join rental on rental.inventory_id = inventory.inventory_id
group by film.film_id, film.title
having count( distinct rental.customer_id) > 1

--20
select actor.first_name,actor.last_name from actor
where 180 > ALL (select length from film
join film_actor on actor.actor_id = film_actor.actor_id where film_actor.actor_id = actor.actor_id)
AND actor_id IN (SELECT actor_id FROM film_actor)

select actor.first_name,actor.last_name
from actor
where 180 > all (select length from film join film_actor on film.film_id = film_actor.film_id
where film_actor.actor_id = actor.actor_id)
and actor_id in (select actor_id from film_actor)
--19
select title from film
where length < ALL (select length from actor
join film_actor on actor.actor_id = film_actor.actor_id
join film on film.film_id = film_actor.film_id
where actor.first_name = 'BURT' and actor.last_name ='POSEY')
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------LESSON 5 --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--1
Select film.film_id, film.title, count(DISTINCT actor_id) as actors,
count(DISTINCT category_id) as categories
from film


select film.film_id,film.title,(select count(*) from film_actor where film_actor.film_id = film.film_id) as actors,
(select count(*) from film_category where film_category.film_id = film.film_id) as categories from film

--2
select first_name, last_name,
(select count(distinct rental_id)
from rental
where rental.customer_id = customer.customer_id
and datediff(day, rental_date, return_date) < 5
) as less_5,
(select count(distinct rental_id) 
from rental
where rental.customer_id = customer.customer_id
and datediff(day, rental_date, return_date) < 7
) as less_7
from customer
--cte 
WITH
table_5 AS
(
SELECT customer.customer_id, customer.first_name, customer.last_name,
COUNT(rental.rental_id) AS less_5
FROM
customer
LEFT JOIN rental ON customer.customer_id = rental.customer_id
AND DATEDIFF(day, rental_date, return_date) < 5
GROUP BY customer.customer_id, customer.first_name, customer.last_name
),
table_7 AS
(
SELECT customer.customer_id, customer.first_name, customer.last_name,
COUNT(rental.rental_id) AS less_7
FROM
customer
LEFT JOIN rental ON customer.customer_id = rental.customer_id
AND DATEDIFF(day, rental_date, return_date) < 7
GROUP BY customer.customer_id, customer.first_name, customer.last_name
)
SELECT table_5.first_name, table_5.last_name, less_5, less_7
FROM table_5 JOIN table_7 ON table_5.customer_id = table_7.customer_id;
--5
select customer_id, first_name, last_name
from customer
where (select count(payment_id) from payment
where month(payment_date) = 6
and payment.customer_id = customer.customer_id 
) > 5  and
(select max(length)
from film
join inventory on film.film_id = inventory.film_id
join rental on inventory.inventory_id = rental.inventory_id
where rental.customer_id = customer.customer_id
) >= 185

--6
select customer_id,first_name, last_name
from customer
where(
select count(payment_id)
from payment
where payment.customer_id = customer.customer_id and amount > 4
) >
(
select count(payment_id)
from payment
where payment.customer_id = customer.customer_id and amount <= 4
)
--13
select title
from film
where length = (
select MAX(length)
from film)

select title
from film
where length >= ALL (select length from film)

select title
from film f1
where not exists(select * from film f2 where f2.length > f1.length)

insert into actor(last_name,first_name)
values ('Arnold', 'Schwarzenegger');

insert into film(title,description,length,language_id,rental_duration,replacement_cost)
values ('Terminator','A human soldier is sent from 2029 to 1984 to stop an almost indestructible cyborg killing machine, sent from the same year, which has been programmed to execute a young woman whose unborn son is the key to humanitys future salvation.',107,1,3,1.99);

update actor set last_name = 'Arnold'
update actor set first_name = 'Schwarzenegger'
select * from film
join actor_id on actor_
where title LIKE 'Terminator'
select * from actor
where last_name = 'Arnold'