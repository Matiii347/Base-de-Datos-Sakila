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
