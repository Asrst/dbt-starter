{{config(
    materialized = "table")
}}


select "OrderID", "EmployeeID", products_number
from {{ ref('int_orders_with_products') }} ord
where products_number >= 2