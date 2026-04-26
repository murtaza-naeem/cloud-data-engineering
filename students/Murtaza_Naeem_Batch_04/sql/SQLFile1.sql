Create database BikeStores;

select * from sales.customers;

select * from production.categories;

select * from production.categories
where category_id = 6;

select * from production.stocks;

select * from production.stocks
where store_id = 3;

select product_id,quantity from production.stocks;

select state, zip_code from sales.customers;

select state from sales.customers
where state = 'CA';

select street from sales.customers
where street = '107 River Dr.';
