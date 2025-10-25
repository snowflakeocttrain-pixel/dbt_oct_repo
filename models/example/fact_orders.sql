{{config(materialized='incremental',
unique_key='order_id')}}

select 
order_id, customer_id, product_id, quantity, order_date, status,
extract(year from order_date) as order_year,
extract(month from order_date) as order_month
 from 
RAW_DATA.ORDERS
{% if is_incremental() %}
-- this filter will only be applied on an incremental run
WHERE ORDER_DATE > (select MAX(ORDER_DATE) from {{this}} )
{% endif %}

