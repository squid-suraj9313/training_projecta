{% macro mv_macro() %}

    {% set sql %}  -- Fixed syntax here (used '{' instead of '(')

        create materialized view if not exists
            `{{ target.project }}.{{ target.dataset }}.suraj_matrialized_view`  -- Removed single quotes
            as 
            select * from {{ ref('src_hosts') }}

    {% endset %}

    {% if execute %}

        {{ log('this is my mv.', info = True) }}

        {% do run_query(sql) %}

        {{ log('created mv successfully...', info = True) }}

    {% endif %}

{% endmacro %}
