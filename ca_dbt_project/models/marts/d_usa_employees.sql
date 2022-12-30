
{{config(
    materialized = "table")
}}


select emp."EmployeeID", us.state_name
from {{ ref('stg_employees') }} emp
left join {{ref('usa_states') }} us
on emp."Region" = us.state_key