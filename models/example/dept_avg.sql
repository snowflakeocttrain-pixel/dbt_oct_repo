{{config(materialized='ephemeral')}}

select department,avg(salary) as avg_dept_sal from DEV.RAW_DATA.EMPLOYEES
group by department