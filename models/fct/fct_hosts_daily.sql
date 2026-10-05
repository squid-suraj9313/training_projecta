{{
    config(
        materialized='incremental',
        incremental_strategy='merge',
        unique_key='host_id'
    )
}}

SELECT
    host_id,
    host_name,
    is_superhost,
    created_at,
    updated_at
FROM {{ ref('src_hosts') }}
{% if is_incremental() %}
WHERE updated_at > (SELECT MAX(updated_at) FROM {{ this }})
{% endif %}
