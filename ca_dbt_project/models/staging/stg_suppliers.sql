{{config(
    materialized = "table")
}}

select *
from {{ source('ca_dbt_postgres', 'suppliers') }}