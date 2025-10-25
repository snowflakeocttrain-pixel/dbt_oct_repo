{{config(materialized='table')}}

select 
customer_id,
 first_name||' '||last_name as full_name, 
 email, 
 city
 from RAW_DATA.CUSTOMERS