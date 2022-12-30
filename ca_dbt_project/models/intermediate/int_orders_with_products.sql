{{config(
    materialized = "ephemeral")
}}

WITH unq_products AS (
select ord."OrderID", count(distinct od."ProductID") as products_number
from {{ ref('stg_orders') }} ord
join {{ ref('stg_order_details') }} od
on ord."OrderID" = od."OrderID"
GROUP BY ord."OrderID"
)

select ord.*, up.products_number
from {{ ref('stg_orders') }} ord
left join unq_products up
on ord."OrderID" = up."OrderID"