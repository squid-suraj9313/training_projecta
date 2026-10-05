WITH cte1 AS (
    SELECT *
    FROM {{ref('src_hosts')}}
    WHERE is_superhost IS NOT NULL
)

SELECT
{{ dbt_utils.generated_surrogate_ke(['host_id', 'is_superhost' ]) }} as host_sk,
    host_id,
    COALESCE(host_name, 'Anonymous') AS host_name,
    is_superhost,
    created_at,
    updated_at
FROM cte1