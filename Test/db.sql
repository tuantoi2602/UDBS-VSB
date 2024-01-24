select * from test.device_event
--2
select dID, manufacturer,label,(
    select count(*)
    from test.device_event u
    where u.dID = d.dID and DATEDIFF (minute,u.startDate, u.endDate) < 30
)short,(
    select count(*)
    from test.device_event u
    where u.dID = d.dID and DATEDIFF (minute,u.startDate,u.endDate) >= 30
    and DATEDIFF (minute,u.startDate,u.endDate) < 90
) medium,(
    select count(*)
    from test.device_event u
    where u.dID = d.dID and DATEDIFF (minute,u.startDate,u.endDate) >= 90
) long
from test.device d 
where building = 'B'
--1
select d.building, e.tID,t.event_description,count(*)
from test.device d
join test.device_event e on e.dID =d.dID
join test.event_type t on e.tID = t.tID
group by d.building, e.tID, t.event_description
having count(*) >= all(
    select count(*)
    from test.device d1
    join test.device_event u1 on u1.dID = d1.dID and d1.building = d.building
    join test.event_type t on e.tID = t.tID
    group by u1.tID
)
--3
select p.pID, p.name
from test.person p
where (
select count(distinct e.tID) from test.device_event e
where p.pID = e.pID and DATEDIFF(minute, e.startDate, e.endDate) < 45) = 1


--lesson 5
--1
select film.title, (
    select count(*) from film_actor
    where film.film_id = film_actor.film_id
),(
    select count(*) from film_category
    where film.film_id = film_category.film_id
)
from film
--2
select customer.first_name,customer.last_name , (
    select count(*) from rental
    where rental.customer_id = customer.customer_id and datediff(day,rental_date,return_date) < 5),
    (select count(*) from rental
    where rental.customer_id = customer.customer_id and datediff(day,rental_date,return_date) < 7)
from customer
--3
select store.store_id ,
(
    select count(*) from inventory
    join film on film.film_id = inventory.film_id
    join [language] on [language].language_id = film.language_id
    where  inventory.store_id = store.store_id and name = 'English'),
    (
    select count(*) from inventory
    join film on film.film_id = inventory.film_id
    join [language] on [language].language_id = film.language_id
    where  inventory.store_id = store.store_id and name = 'French' 
    )
from store

--4
select film.title, (
    select count(*) from film_actor
    where film.film_id = film_actor.film_id
), (
    select count(distinct customer.customer_id) from customer
    join rental on customer.customer_id = rental.customer_id
    join inventory on inventory.inventory_id = rental.inventory_id
    where inventory.film_id = film.film_id and month(rental.rental_date) = 8
), (
    select avg(amount) from payment
    join rental on payment.rental_id= rental.rental_id
    join inventory on inventory.inventory_id = rental.inventory_id
    where film.film_id = inventory.film_id
)

from film
--5
select customer.first_name, customer.last_name from customer
where (
    select count(*) from payment
    where payment.customer_id = customer.customer_id and month(payment_date) = 6) > 5 
    and (select max(length) from film
    join inventory on inventory.film_id = film.film_id
    join rental on rental.inventory_id = inventory.inventory_id
    where customer.customer_id = rental.customer_id) >= 185

--6
select customer.first_name,customer.last_name from customer
where (
    select count(*) from payment
    where payment.customer_id = customer.customer_id and amount > 4) >
    (
    select count(*) from payment
    where payment.customer_id = customer.customer_id and amount <= 4)


--7
select actor.last_name,actor.first_name from actor
where (select count(*) from category
join film_category on film_category.category_id = category.category_id
join film on film.film_id = film_category.film_id
join film_actor on film_actor.film_id = film.film_id
where film_actor.actor_id = actor.actor_id and category.name = 'COMEDY') >
(select count(*) from category
join film_category on film_category.category_id = category.category_id
join film on film.film_id = film_category.film_id
join film_actor on film_actor.film_id = film.film_id
where film_actor.actor_id = actor.actor_id and category.name = 'HORROR' ) * 2



--8
select actor.first_name,actor.last_name from actor
where (
    select count(*) from film
    join film_actor on film_actor.film_id = film.film_id
    where film_actor.actor_id = actor.actor_id and length > 150) >
    (
    select count(*) from film
    join film_actor on film_actor.film_id = film.film_id
    where film_actor.actor_id = actor.actor_id and length <= 150
    )

--9 chua hieu
select customer.customer_id from customer
where (
    select sum(amount) from payment
    where customer.customer_id = payment.customer_id) <
    (select sum(amount) from payment
    join rental on rental.rental_id = payment.rental_id
    where customer.customer_id = payment.customer_id
    and (rental.))

--10

--11 chưa hiểu lắm

select customer.first_name,customer.last_name,count(rental.rental_id) as count1 from customer
join rental on rental.customer_id = customer.customer_id
where not exists (
    select * from rental
    join inventory on inventory.inventory_id = rental.inventory_id
    join film on film.film_id = inventory.film_id
    join language on language.language_id = film.language_id
    where rental.customer_id = customer.customer_id and language.name = 'English'
)
group by customer.customer_id,first_name,last_name

--12

select customer.first_name,customer.last_name,(
    select sum(amount)
    from payment
    where payment.customer_id = customer.customer_id
) as payment1
from customer
where customer_id in (
    select customer_id from rental
    join inventory on inventory.inventory_id = rental.inventory_id
    where inventory.film_id in(
        select film_id
        from film_actor
        group by film_id
        having count(*) >= 15
    )
)


--13
select film.title from film
where length = (
    select max(length)
    from film
)

select film.title from film
where length >= ALL (
    select max(length)
    from film
)

--14
select title,rating from film f1
where length = (
    select max(length)
    from film f2
    where f1.rating = f2.rating
)
ORDER BY rating 
--15
select customer.first_name,customer.last_name,film.title from customer
join rental r1 on r1.customer_id = customer.customer_id
join inventory on inventory.inventory_id = r1.inventory_id
join film on film.film_id = inventory.film_id
where r1.rental_date = (
    select max(rental_date)
    from rental r2
    where r1.customer_id = r2.customer_id
)
order by customer.first_name, customer.last_name
--16
select actor.first_name,actor.last_name,film.title from actor
join film_actor fa1 on fa1.actor_id = actor.actor_id
join film on film.film_id = fa1.film_id
where length = (
    select max(length)
    from film
    join film_actor fa2 on fa2.film_id = film.film_id
    where fa1.actor_id = fa2.actor_id
)
--17
select film.title ,customer.last_name,customer.first_name from film
join inventory i1 on i1.film_id = film.film_id
join rental on rental.inventory_id = i1.inventory_id
join customer on customer.customer_id = rental.customer_id
where datediff(day,rental_date,return_date) >= ALL (
    select datediff(day,rental_date,return_date)
    from rental
    join inventory i2 on i2.inventory_id = rental.inventory_id
    where i1.film_id = i2.film_id 
)
--18 -- chưa làm dc
/*For each customer, select the last borrowed movie starring actor PENELOPE GUINESS. If
the customer has never rented a movie with PENELOPE GUINESS, the customer will not
be selected. Sort the result by customer ID*/
select customer.first_name,customer.last_name,film.title from customer
join rental r1 on r1.customer_id = customer.customer_id
join inventory i1 on i1.inventory_id = r1.inventory_id
join film on film.film_id = i1.film_id
where film.film_id in (
    select film_id from film_actor
    join actor on film_actor.actor_id = actor.actor_id
    where actor.first_name = 'PENELOPE' and actor.last_name = 'GUINESS'
    ) and r1.rental_date = (
        select max(rental_date) from rental r2
        join inventory i2 on i2.inventory_id = r2.inventory_id
        where r1.customer_id = r2.customer_id and i2.film_id in (
            select film_id from film_actor
            join actor on film_actor.actor_id = actor.actor_id
            where actor.first_name = 'PENELOPE' and actor.last_name = 'GUINESS'
        )
    )

--19
select customer.first_name,customer.last_name
from customer
where customer_id in (
    select rental.customer_id from rental
    join inventory on inventory.inventory_id = rental.inventory_id
    join film on film.film_id = inventory.film_id
    where film.length = (select max(length) from film)
) and customer_id in (
    select rental.customer_id from rental
    join inventory on inventory.inventory_id = rental.inventory_id
    join film on film.film_id = inventory.film_id
    where film.length = (select min(length) from film)
)

--20
select actor.first_name, actor.last_name from actor
join film_actor on film_actor.actor_id = actor.actor_id
join film on film.film_id = film_actor.film_id
where length = (select max(length) from film)
group by actor.first_name, actor.last_name
having count(film.film_id) >= 2

--21


-- tức là nếu có số lượng để đếm thì đi luôn có group by đi kèm having count
-- để đếm số lượng


--DDL DML-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--1
--a
insert into actor (first_name, last_name)
values ('Arnold', 'Schwarznegger');
--b
insert into film (title, description, language_id, rental_duration,
rental_rate, length)
values ('Terminator','A human soldier is sent from 2029 to 1984 to stop an almost indestructible cyborg killing machine, sent from the same year, which has been programmed to execute a young woman whose unborn son is the key to humanitys future salvation.',1,3,1.99,107)

select * from film
where title = 'Terminator'
select * from category
select category_id
from category 
where name = 'Action' or name = 'Sci-Fi'

--c
select * from film_actor 
where actor_id = (
    select actor_id from actor where first_name = 'Arnold' and last_name = 'Schwarznegger')

insert into film_actor (film_id, actor_id) values (1008, 202);
--d
select * from category

select * from film_category
select * from film_category
where film_id = (
    select film_id from film where film_id = 1008)
insert into film_category (film_id, category_id) values (1008, 14);
insert into film_category (film_id, category_id) values (1008, 1);
select * from film_category
where film_id = 1008
--e
insert into film_category (film_id, category_id) values (1008, 5);
--f
update film set rental_rate = 2.99,  last_update = CURRENT_TIMESTAMP
 where title = 'Terminator'

 --2
 --a
 select * from staff
 where first_name = 'Tuan'
 select * from address
where city_id = 604
 select * from city
 where city = 'Ostrava'
insert into address(address,district,city_id,phone) values('1770/1 Studentska', 'Poruba-Ostrava',604,0939875873)

 select * from country

insert into city (city,country_id) values ('Ostrava',26);

--b
insert into address(address,district,city_id,phone)
values ('17. listopadu 2172/15','Poruba-Ostrava', 604,597326001);

--c
select * from store
insert into store (manager_staff_id, address_id)
values (3, 606);

--3
update film set rental_rate = (rental_rate + (rental_rate * 0.1))
where film_id in (
select film_id from film

where film_id in (
select film_id from film_actor
join actor on film_actor.actor_id = actor.actor_id
where first_name = 'Schwarzenegger' and last_name = 'Arnold'
)
);

select *  from actor
--4
update film set original_language_id = NULL
where film_id in (
select film_id from film 
where original_language_id = 4
)

select * from film
where original_language_id =4
--5
insert into inventory (film_id,store_id)
select film_id,2
from film_actor
join actor on actor.actor_id = film_actor.actor_id
where first_name = 'Schwarzenegger' and last_name = 'Arnold'



select * from inventory
--6
delete from language where language_id = 4

select * from [language]
where [language]
--7
delete from film where title = 'Terminator'

delete
from film_actor
where film_id = (
    select film_id from film where film_id = 1008)

delete
from film_category
where film_id = (
    select film_id from film where film_id = 1008)

--8
select * from customer
select * from payment
select * from rental

delete
from customer
where active = 0

delete
from payment
where customer_id in (
    select customer_id from customer where active = 0
)

delete
from rental
where customer_id in (
    select customer_id from customer where active = 0
)
--9
alter table film
add inventory_count integer

update film set inventory_count =(
    select count(*) from inventory
    where film.film_id = inventory.film_id
)
--10
alter table category
alter column name varchar(50)
--11
alter table customer
add phone varchar(20)
update customer
set phone = (
    select phone
    from address
    where address.address_id = customer.address_id
)
alter table customer
alter column phone varchar(20) not null
select * from customer

--12
alter table rental
add create_table1  varchar(20) not null default CURRENT_TIMESTAMP

ALTER TABLE rental
ADD create_date2 DATETIME NOT NULL
CONSTRAINT DF_rental_create_date DEFAULT CURRENT_TIMESTAMP;

--13
alter table rental
drop column create_table1
ALTER TABLE rental
DROP CONSTRAINT DF__rental__create_t__1EA48E88;

ALTER TABLE rental
DROP CONSTRAINT DF_rental_create_date;

select * from rental
--14
ALTER TABLE film
ADD creator_staff_id TINYINT NULL

ALTER TABLE film
ADD FOREIGN KEY (creator_staff_id) REFERENCES staff (staff_id);

ALTER TABLE film
ADD CONSTRAINT FK_film_staff FOREIGN KEY (creator_staff_id) REFERENCES
staff (staff_id);

select * from staff
--15
alter table staff
add constraint check_email check (email like '%@%.%')
--16
alter table staff
drop constraint check_email
--17
alter table rental
add constraint check_loan check (return_date > rental_date)
--18
create table reservation(
    reservation_id tinyint PRIMARY KEY identity not null,
    reservation_date date not null,
    end_date date not null,
    customer_id int constraint fk_reser_cus foreign key 
    REFERENCES customer (customer_id),
    film_id int constraint fk_reser_film foreign key 
    references film(film_id),
    staff_id int constraint fk_reser_staff foreign KEY
    REFERENCES staff(staff_id)

);
--19
insert into reservation(reservation_date,
end_date,customer_id,film_id,staff_id)
values ('2015-05-05', '2015-06-05',25,15,2);

insert into reservation(reservation_date,
end_date,customer_id,film_id,staff_id)
values ('2015-07-05', '2015-08-05',32,16,1);

delete from reservation 
where reservatoin_id = 1
select * from reservation
--20
--a
create table review(
    film_id int constraint fk_re_film foreign key references film (film_id) on delete cascade,
    customer_id int constraint fk_re_cus foreign key references customer(customer_id) on delete cascade,
    primary key (film_id,customer_id),
    stars int constraint DP_star check (stars >= 1 and stars <= 5),
    actor_id int constraint fk_re_actor foreign key references actor(actor_id) on delete set null
)
--b
insert into review(film_id,customer_id,stars,actor_id)
values (40,318,4,null)

insert into review(film_id,customer_id,stars,actor_id)
values (41,59,5,202)

select * from film
where title = 'ARSENIC INDEPENDENCE'

select * from review
select * from customer
where first_name = 'CHERYL'
select * from actor
where first_name = 'ARNOLD'
--c
delete from customer
where first_name = 'BRIAN' and last_name = 'WYMAN'

select * from payment
delete from actor
where first_name = 'EMILY' and last_name = 'DEE'

delete
from payment
where customer_id in (
    select customer_id from customer where first_name = 'BRIAN' and last_name = 'WYMAN'
)

delete
from rental
where customer_id in (
    select customer_id from customer where first_name = 'BRIAN' and last_name = 'WYMAN'
)

delete
from film_actor
where actor_id = (
    select actor_id from actor where first_name = 'ARNOLD' and last_name = 'Schwarznegger')

delete from actor
where first_name = 'ARNOLD' and last_name = 'Schwarznegger'

DELETE FROM customer
WHERE customer_id = 318