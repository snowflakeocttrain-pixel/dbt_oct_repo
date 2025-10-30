{% macro get_unique_sql(src_table,unique_key,ts_col) %}
    
{# Start building the SQL statement #}
{% set sql %}
{% if ts_col == 'NA' %}

select *
from raw_data.{{src_table}}
qualify row_number() over (partition by {{unique_key}} order by {{unique_key}}) = 1

{% else %}

select *
from raw_data.{{src_table}}
qualify row_number() over (partition by {{unique_key}} order by {{ts_col}} desc) = 1

{% endif %}


{% endset %}   


{{ return(sql) }}

{% endmacro %}