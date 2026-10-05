{{
    config(
        materialized = 'materialized_view',
        enable_refresh = true,
        refresh_interval_minutes = 30,
        partition_by = {
            "field" : "created_at",
            "data_type" : "timestamp",
            "granularity" : "day"
        }
    )
}}

-- Querying the staging model directly without CTEs
select
    id as listing_id, 
    listing_url,
    name as listing_name,
    room_type,
    minimum_nights,
    host_id,
    price as price_str,
    created_at,
    updated_at
from
    {{ ref('src_listings') }}
