with listings as (
    select
        listing_id,
        room_type
    from {{ ref('src_listings') }}
),

reference_room_types as (
    select
        room_type
    from {{ ref('airbnb_room_type_reference_seed') }}
)

select
    l.listing_id,
    l.room_type
from listings l
left join reference_room_types r
    on l.room_type = r.room_type
where r.room_type is null