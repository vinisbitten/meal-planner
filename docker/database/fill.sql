-- Set params
set session my.number_of_sales = '20000';
set session my.number_of_users = '5000';
set session my.number_of_products = '30';
set session my.number_of_stores = '50';
set session my.number_of_coutries = '10';
set session my.number_of_cities = '30';
set session my.status_names = '5';
set session my.start_date = '2019-01-01 00:00:00';
set session my.end_date = '2020-02-01 00:00:00';

-- Filling of products
INSERT INTO product
select id, concat('Product ', id) 
FROM GENERATE_SERIES(1, current_setting('my.number_of_products')::int) as id;

-- Filling of cities
INSERT INTO city
select id
	, concat('City ', id)
	, floor(random() * (current_setting('my.number_of_coutries')::int) + 1)::int
FROM GENERATE_SERIES(1, current_setting('my.number_of_cities')::int) as id;

CREATE EXTENSION pgcrypto;
--select gen_random_uuid ();


-- Filling of sales  
INSERT INTO sale;
select gen_random_uuid ()
	, round(CAST(float8 (random() * 10000) as numeric), 3)
	, TO_TIMESTAMP(start_date, 'YYYY-MM-DD HH24:MI:SS') +
		random()* (TO_TIMESTAMP(end_date, 'YYYY-MM-DD HH24:MI:SS') 
			- TO_TIMESTAMP(start_date, 'YYYY-MM-DD HH24:MI:SS'))
	, floor(random() * (current_setting('my.number_of_products')::int) + 1)::int
	, floor(random() * (current_setting('my.number_of_users')::int) + 1)::int
	, floor(random() * (current_setting('my.number_of_stores')::int) + 1)::int
FROM GENERATE_SERIES(1, current_setting('my.number_of_sales')::int) as id
	, current_setting('my.start_date') as start_date
	, current_setting('my.end_date') as end_date;



TO_TIMESTAMP(start_date, 'YYYY-MM-DD HH24:MI:SS') +
random()* (TO_TIMESTAMP(end_date, 'YYYY-MM-DD HH24:MI:SS') 
				 - TO_TIMESTAMP(start_date, 'YYYY-MM-DD HH24:MI:SS'))

                 
floor(random() * (current_setting('my.number_of_products')::int) + 1)::int

-- Filling of order_status
INSERT INTO order_status
select gen_random_uuid ()
	, date_sale + random()* (date_sale + '5 days' - date_sale)
	, sale_id
	, floor(random() * (current_setting('my.status_names')::int) + 1)::int
from sale;