-- Lab 7 | SQL Join (Part I)

use sakila;

-- Instructions
-- 1) How many films are there for each of the categories in the category table. Use appropriate join to write this query.

-- first check what tabs can be usefull for this information, i need all the films and categories
select * from film; 
select * from category; -- have the category name
select * from film_category; -- this have almost all the info just need the category name

-- i need all the movies so will have to make a left join

select count(f.film_id) as film_count, c.name as cagetory_name
from film_category as f
left join category as c
on f.category_id = c.category_id
group by c.name;

-- 2) Display the total amount rung up by each staff member in August of 2005.

-- dont understand the meaning of "amount rung up"

-- 3) Which actor has appeared in the most films?

-- what i need? -- i need actor name and films apperances 

select * from actor; 
select * from film_actor; 

select count(f.actor_id) as total_apperance, a.first_name, a.last_name
from film_actor as f
left join actor as a
on f.actor_id = a.actor_id
group by f.actor_id;

-- Gina Degener 42 films

-- 4) Most active customer (the customer that has rented the most number of films)

-- i need id of the costumer and total rent per costumer 

select * from rental; 
select * from customer;

select count(r.customer_id) as total_rent, c.first_name, c.last_name
from rental as r
left join customer as c
on r.customer_id = c.customer_id
group by r.customer_id
ORDER BY total_rent DESC;

-- Elenor Hunt : 46 movies. 

-- 5) Display the first and last names, as well as the address, of each staff member.

-- everything is in staff exept the address

select s.first_name, s.last_name, a.address
from staff as s
join address as a
on s.address_id = a.address_id;

-- 6) List each film and the number of actors who are listed for that film.

select f.title as film_title, count(fa.actor_id) as number_of_actors
from film_actor as fa
left join film as f
on fa.film_id = f.film_id
group by f.title;

-- 7) Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

select * from payment;
select * from customer;

select sum(p.amount) as total_paids, c.first_name, c.last_name
from payment as p
join customer as c
on p.customer_id = c.customer_id
group by p.customer_id
order by c.last_name asc;


-- 8) List number of films per category.


