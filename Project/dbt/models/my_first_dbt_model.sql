
/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ config(materialized='table') }}



select *
from {{ source('raw_data', 'raw_customers') }}

{% set var = env_var('DBT_DATASET') %}    
{% if var == 'dbt_dev' %}

limit 111

{% else %}

limit 22

{% endif %}

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
