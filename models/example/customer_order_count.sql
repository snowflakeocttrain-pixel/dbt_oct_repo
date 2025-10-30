{{config (materialized='table',
alias='CUST_ORDER',
schema='HRMS',
pre_hook="{{ audit_macro('customer_order_count','started')}}",
post_hook="{{ audit_macro('customer_order_count','completed')}}")}}


select c.full_name,count(*) as order_count from {{ref('fact_orders')}} o inner join {{ref('dim_customers')}} c
on o.customer_id=c.customer_id
group by c.full_name