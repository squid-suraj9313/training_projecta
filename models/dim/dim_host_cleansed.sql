{{
    config(
        materialized = 'table',
        pre_hook = "select 'starting execution of the model...' as message",
        post_hook = "select 'finished execution of the model...' as message"
    )
}}




WITH cte1 AS (
    SELECT *
    FROM {{ref('src_hosts')}}
    WHERE is_superhost IS NOT NULL
)

SELECT
    host_id,
    COALESCE(host_name, 'Anonymous') AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM cte1