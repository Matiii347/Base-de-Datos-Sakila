select * from sakila.actor;
select actor_id,first_name,last_name,last_update from sakila.actor;
select actor_id, first_name as Nombre, last_name as Apellido from sakila.actor;


select distinct(store_id) from sakila.customer;/* Datos Unicos */
select distinct(customer_id) from sakila.payment;

/* Order by */
select * from sakila.country;
select * from sakila.country order by country DESC;
select * from sakila.country order by country ASC;
select * from sakila.customer order by first_name ASC;

/* PRACTICAS */
select store_id,first_name,last_name from sakila.customer;
select store_id AS Tienda,first_name AS Nombre,last_name AS Apellido from sakila.customer;
select last_name from sakila.customer order by last_name DESC;
select * from sakila.payment;
select distinct(amount) from sakila.payment order by amount DESC;
select distinct(amount) from sakila.payment order by amount ASC;


/* WHERE */
select * from sakila.actor where first_name='DAN';
select * from sakila.city where city='London';
select * from sakila.city where country_id=102;
select * from sakila.customer where store_id=1;
select * from sakila.inventory where film_id > 50;
select * from sakila.payment where amount < 3;
select distinct(amount) from sakila.payment where amount < 3;
select * from sakila.staff where staff_id !=2;
select * from sakila.language where name !='German'; 

/* Practicas WHERE */
select description,release_year from sakila.film where title='Impact Aladdin';
select * from sakila.payment where amount >0.99;

/* Where con Operadores Logicos */
select * from sakila.country where country='Algeria' AND country_id=2;/* Hay datos con esa Descripcion*/
select * from sakila.country where country='Algeria' AND country_id=12;/*No hay datos con esa descripcion*/
select * from sakila.country where country='Algeria' OR country_id=12;
select * from sakila.language where language_id=1 OR name='German';
select * from sakila.category where NOT name='Action';
select * from sakila.film where NOT rating='PG';
select distinct(rating) from sakila.film where NOT rating='R';

/* Practicas con Operadores Logicos */
select * from sakila.payment where customer_id=36 AND amount >0.99 AND staff_id=1;
select * from sakila.rental where NOT staff_id=1 AND customer_id > 250 AND inventory_id > 100;

/* Opreador In */
select * from sakila.customer where first_name IN('MARY','PATRICIA');
select * from sakila.film where special_features IN ('Trailers','Trailers,Deleted Scenes') and rating IN ('G','NC-17') AND length > 50;
select * from sakila.category where name not in ('Action','Animation','Children');

/* Practicas con Operador IN */
select * from sakila.film_text where title IN('Zorro Ark','Virgin Daisy','United Pilot');
select * from sakila.city where city IN('Chiayi', 'Dongying', 'Fukuyama','Kilis');

/*Operador BetWeen */
select * from sakila.rental where (customer_id between 300 and 350) and staff_id=1;
select * from sakila.payment where amount between 3 and 5;

/* Practicas Operador BetWeen*/
select * from sakila.payment where (amount between 2.99 and 4.99) and staff_id=2 and customer_id in(1,2);
select * from sakila.address where city_id between 300 and 350;
select * from sakila.film where (rental_rate between 0.99 and 2.99) and length<=50 and replacement_cost<20;

/* LIKE */
select * from sakila.actor where first_name like 'A%' and last_name like 'B%';