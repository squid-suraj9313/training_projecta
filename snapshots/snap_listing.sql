{% snapshot snap_listing %}

{{
    config(
        target_schema = 'tredence_suraj',
        unique_key='listing_id',
        strategy='timestamp',
        updated_at='updated_at'
    )
}}
 
SELECT
    *
 
FROM {{ ref('src_listings') }}
 
{% endsnapshot %}
