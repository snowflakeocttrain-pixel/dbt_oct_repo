{{ config ( materialized='view')}}

{{  get_unique_sql('ORDERS','ORDER_ID','ORDER_DATE') }}