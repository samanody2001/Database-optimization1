Query 1:
select
    category.name,
    count(category.name) category_count
from
    public.category
left join public.film_category on
    category.category_id = film_category.category_id
left join public.film on
    film_category.film_id = film.film_id
where film.title like 'A%'	
group by
    category.name
order by
    category_count desc;




Query 2: 

 select
    actor.first_name,
    actor.last_name,
    count(actor.first_name) featured_count
from
    public.actor
left join public.film_actor on
    actor.actor_id = film_actor.actor_id
where actor.last_name like 'D%'	
group by
    actor.first_name,
    actor.last_name
order by
    featured_count desc;


Query 3: 
 select
    actor.first_name,
    actor.last_name,
    count(actor.first_name) featured_count
from
    public.actor
left join public.film_actor on
    actor.actor_id = film_actor.actor_id
where actor.last_name like '%a%'	
group by
    actor.first_name,
    actor.last_name
order by
    featured_count desc;


Query 4:
select
    first_name,
    last_name
from
    public.customer
where
    active = 1
order by first_name asc;


Query 5: 

select
    first_name,
    last_name
from
    public.customer
where
    active = 1 and last_name like 'A%'
order by first_name asc;


Query 6:  

 select
    customer.first_name,
    customer.last_name,
    count(customer.first_name) rentals_count
from
    public.customer
left join public.rental on
    customer.customer_id = rental.customer_id
where customer.last_name like 'A%'	
group by
    customer.first_name,
    customer.last_name
order by rentals_count desc;

Query 7: 

 select
    customer.first_name,
    customer.last_name,
    count(customer.first_name) rentals_count
from
    public.customer
left join public.rental on
    customer.customer_id = rental.customer_id
where customer.last_name not like 'A%'	
group by
    customer.first_name,
    customer.last_name
order by rentals_count desc;



Query 8:

select
    store.store_id,
    sum(payment.amount) as "total revenue"
from
    public.store
left join public.inventory on
    inventory.store_id = store.store_id
left join public.rental on
    rental.inventory_id = inventory.inventory_id
left join public.payment on
    payment.rental_id = rental.rental_id
where
    payment.amount is not null
group by
    store.store_id
order by
    sum(payment.amount) desc;

Query 9: 

 select
    category.name,
    film.title,
    sum(payment.amount) as "gross revenue"
from
    public.film
left join public.film_category on
    film_category.film_id = film.film_id
left join public.category on
    film_category.category_id = category.category_id
left join public.inventory on
    inventory.film_id = film.film_id
left join public.rental on
    rental.inventory_id = inventory.inventory_id
left join public.payment
    on payment.rental_id = rental.rental_id
where
    payment.amount is not null and film.title like '%A'
group by
    category.name,
    film.title
order by
    sum(payment.amount) desc;

Query 10: 

select
    film.title,
    film.description
from
    public.film
where
    to_tsvector(film.description) @@ to_tsquery('documentary & robot');


Query 11: 

SELECT f.title, c.name, COUNT(r.rental_id)
FROM public.film_category fc
JOIN public.category c
ON c.category_id = fc.category_id
JOIN public.film f
ON f.film_id = fc.film_id
JOIN public.inventory i
ON i.film_id = f.film_id
JOIN public.rental r 
ON r.inventory_id = i.inventory_id
WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
GROUP BY 1, 2
ORDER BY 2, 1


Query 12: 

SELECT last_name,
         count(last_name)
FROM actor
GROUP BY  last_name
HAVING count(last_name) > 1;

Query 13: 

 SELECT f.title,
         count(i.inventory_id) AS number_of_copies
FROM public.film f
JOIN public.inventory i
    ON f.film_id = i.film_id
WHERE f.title = 'HUNCHBACK IMPOSSIBLE'
GROUP BY  f.title;

Query 14: 


SELECT first_name,
         last_name
FROM public.actor; 

Query 15: 

SELECT email FROM public.customer WHERE active=0;


Query 16: 
SELECT c.email FROM public.customer c
JOIN public.address a ON c.address_id = a.address_id
WHERE a.district = 'California';

Query 17: 

SELECT title
FROM public.film
WHERE language_id = 1
        AND title LIKE 'K%'
        OR title LIKE 'Q%';



