{{config(materialized='table')}}

select emp.* from raw_data.employees emp,
{{ref('dept_avg')}} da
 where emp.salary < da.avg_dept_sal and emp.department=da.department