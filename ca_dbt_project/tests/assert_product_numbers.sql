-- unique products in a order cannot be negative or zero
-- Therefore return records where this isn't true to make the test fail

select *
from {{ ref('f_orders_atleast_two_products.sql' )}}
where products_number <= 0


