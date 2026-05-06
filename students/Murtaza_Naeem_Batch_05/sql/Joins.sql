select * from sales.customers;

create schema hr;
go

create table hr.candidates(
	id int primary key identity,
	fullname varchar(100) not null);

create table hr.employees(
	id int primary key identity,
	fullname varchar(100) not null);

insert into
	hr.candidates(fullname)
values
	('saad'),
	('murtaza'),
	('arham'),
	('mujtaba')

insert into
	hr.employees(fullname)
values
	('saad'),
	('ishaq'),
	('mohib'),
	('Owais')

select * from hr.candidates
select * from hr.employees

/*SELECT c.fullname FROM hr.candidates c
INNER JOIN hr.employees  e
	ON c.fullname = e.fullname

SELECT c.id as candid_id, e.id as emp_id, c.fullname FROM hr.candidates c
INNER JOIN hr.employees  e
	ON c.fullname = e.fullname

SELECT c.id as candid_id, e.id as emp_id, c.fullname FROM hr.candidates c
INNER JOIN hr.employees  e
	ON e.fullname = c.fullname;*/
-- INNER JOIN
	select 
		p.product_id,
		oi.order_id
	from production.products p
	inner JOIN SALES.order_items oi
	on p.product_id = oi.product_id;

--LEFT JOIN

SELECT p.product_name, oi.order_id, oi.item_id from production.products p
left join sales.order_items oi
on oi.product_id  = p.product_id
order by oi.order_id;

--RIGHT JOIN

SELECT product_name, order_id from sales.order_items oi
right join production.products p
on p.product_id = oi.product_id
order by order_id;

select * from sales.stores o
right join sales.orders st
on st.store_id = o.store_id
order by st.store_id;

-- cross join

Select * from production.products;
select * from sales.stores;

select * from production.products
cross join sales.order_items;

-- self join
