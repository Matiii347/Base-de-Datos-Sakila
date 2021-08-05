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
select * from sakila.actor where first_name like 'A%' and last_name like 'B%';/*Empiece con A y B */
select * from sakila.actor where first_name like '%A' and last_name like'%N'; /* Termine Con A*/
select * from sakila.actor where first_name like '%NE%' and last_name like '%RO%'; /*En cualquier parte*/
select * from sakila.actor where first_name like 'A%E';/*Empieza con la primera y termina con la ultima letra*/
select * from sakila.actor where first_name like 'C%N' /*Empieza con la primera y termina con la ultima letra*/ and last_name like 'G%';

/*PRACTICAS CON LIKE*/
select * from sakila.film where release_year=2006 and title like 'ALI%';

/* DIFERENTES JOINS*/
/*inners*/
select f.title,f.description,f.release_year,f.language_id,l.name from sakila.film as f inner join sakila.language as l on (f.language_id=l.language_id);
select a.address AS Direccion,c.city AS Ciudad from sakila.address as a inner join sakila.city as c on (a.city_id=c.city_id);
/*rights*/
select c.customer_id,c.first_name,c.last_name,a.actor_id,a.first_name,a.last_name from sakila.customer as c right join sakila.actor as a on (c.last_name=a.last_name);
/* Buca similitudes la tabla derecha Actor con La izquierda */
/*Lefts*/
select c.customer_id,c.first_name,c.last_name,a.actor_id,a.first_name,a.last_name from sakila.customer as c left join sakila.actor as a on (c.last_name=a.last_name); 
/*Mantiene los datos completos de la izquierda buscando similitudes con los last_names*/

/*Practicas con los joins*/
select a.address,c.city,co.country from sakila.address as a inner join sakila.city as c on (a.city_id=c.city_id) inner join sakila.country as co on (c.country_id=co.country_id);
select c.first_name,a.address,s.store_id from sakila.customer as c left join sakila.store as s on (c.store_id=s.store_id) left join sakila.address as a on(s.address_id=a.address_id);
select r.rental_id,s.first_name from sakila.rental as r inner join sakila.staff as s on (r.staff_id=s.staff_id);

/* SUMA,AVG,COUNT*/
select sum(amount) from sakila.payment;
select inventory_id+film_id+store_id from sakila.inventory;
select count(*) from sakila.address;
select count(*) from sakila.category;
select avg(amount) from sakila.payment;
select avg(rental_duration) from sakila.film;
select max(length) from sakila.film;
select min(length) from sakila.film;
select min(replacement_cost) from sakila.film;
select max(replacement_cost) from sakila.film;

/* Practicas suma,avg,count */
select count(rental_id) from sakila.rental;
select max(amount) from sakila.payment;

/*Group by */
select last_name from sakila.actor group by last_name;
select last_name,count(*) from sakila.actor group by last_name;
select c.customer_id,c.first_name,c.last_name,sum(p.amount) from sakila.payment as p inner join sakila.customer as c on (p.customer_id=c.customer_id) group by c.customer_id,c.first_name,c.last_name/*o 1,2,3 */;

/*Practica Group by */
select customer_id,max(rental_date) from sakila.rental group by customer_id;

/*Having*/
select last_name,count(*) from sakila.actor group by last_name having count(*)>3; 
select c.customer_id,c.first_name,c.last_name,sum(p.amount) from sakila.payment as p inner join sakila.customer as c on(p.customer_id=c.customer_id) group by c.customer_id,c.first_name,c.last_name having sum(p.amount)<100 order by sum(p.amount)DESC;

/* Practicas Having*/
select last_name,count(*) from sakila.actor group by last_name having count(*)<3;

/*Longitud Cadena*/
select name,char_length(name) as Cadena from sakila.category;
select city,char_length(city) from sakila.city;
/*Concatenar*/
select *,concat(first_name, " ",last_name)as "Nombre Completo" from sakila.customer;
select concat_ws("-",title,description,release_year) from sakila.film;

/* Funciones para Redondear */
select *,round(amount,0) from sakila.payment;

/*Lowercase*/
select *,lcase(concat(first_name, " " ,last_name))as "Nombre Completo" from sakila.actor;

/* Practica de las Funciones*/
select *,concat_ws("-",first_name,last_name,email)as CONCAT from sakila.customer;
select * from film;
SELECT *,concat_ws("-",film_id,title,description,release_year,language_id,original_language_id,rental_duration,rental_rate,length,replacement_cost,rating,special_features,last_update)as "Peliculas" from sakila.film;
select customer_id,avg(amount)as prom from sakila.payment group by customer_id having round(prom,0);
select ucase(city) from sakila.city;

/*CASE*/
select address,address2, case when address2 is null then "Sin Direccion 2" else "Con Direccion"end as Comentario from sakila.address;
select payment_id,amount,case when amount<1 then "Precio Minimo" when amount between 1 and 3 then "Precio Intermedio" else "Precio Maximo" end as Comentario   from sakila.payment;

/*Practicas Case*/
select title,rental_rate, case when rental_rate<1 then "Pelicula Mala" when rental_rate between 1 and 3 then "Pelicula Buena" else "Pelicula Excelente" end as Comentario   from sakila.film;

/*SubQueries*/
select title from sakila.film where title like 'K%' OR title like 'Q%' and title in (select title from sakila.film where language_id in (select language_id from sakila.language where name='English') );
select first_name,last_name from sakila.actor where actor_id in (select actor_id from sakila.film_actor where film_id in (select film_id from sakila.film where title='Alone Trip'));
select title from sakila.film where film_id in(select film_id from sakila.film_category where category_id in (select category_id from sakila.category where name='Family'));

/*Views*/
Create view ingreso as
select name,sum(amount)from sakila.category inner join sakila.film_category on category.category_id=film_category.category_id inner join sakila.inventory on film_category.film_id=inventory.film_id inner join sakila.rental on inventory.inventory_id=rental.inventory_id inner join sakila.payment on rental.rental_id=payment.rental_id group by name order by sum(amount) desc limit 5;
select * from ingreso;
drop view ingreso;

/*Consultas Multitablas */
select staff.first_name,staff.last_name, sum(payment.amount)as total from sakila.staff inner join sakila.payment on staff.staff_id=payment.staff_id and payment_date like '2005-08%' group by staff.first_name,staff.last_name;
select b.title,count(a.actor_id)as 'Contador de Actores' from sakila.film_actor as a inner join sakila.film as b on a.film_id=b.film_id group by b.title;
select title,count(title)as 'Titulos Disponibles' from sakila.film inner join sakila.inventory on film.film_id=inventory.film_id where title='Hunchback Impossible';
select first_name,last_name, sum(amount) as 'Total Pagado' from sakila.payment inner join sakila.customer on payment.customer_id=customer.customer_id group by first_name,last_name order by last_name;

/* Insert Into*/
insert into city(city,country_id) values ('prueba',100);
select * from sakila.city;
insert into actor(first_name,last_name) values ('Matias','Funes');
select * from actor;
insert into category(name) values('Deportes');

/*Update*/
update city set city='New York' where country_id=87;
select * from city where country_id=87;
update actor set first_name='RAUL' where last_name='GUINNES'; 
select * from actor where last_name='GUINNES';
update staff set first_name='Pablo' where staff_id=2;

/*Alter Table*/
alter table actor add column genero char(1);
alter table actor drop column genero;

/*Terminamos*/
select first_name from actor where first_name ='Scarlett'; 
select last_name from actor where last_name ='Johansson';
select distinct last_name from actor;
select last_name,count(*) from actor group by last_name;


