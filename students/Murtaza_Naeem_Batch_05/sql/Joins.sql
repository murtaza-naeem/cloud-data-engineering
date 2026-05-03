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

	select * from production.products 