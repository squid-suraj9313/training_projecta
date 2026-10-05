{{
    config(
        materialized = 'table',
        partition_by = {
            "field" : "listing_id",
            "data_type" : "int64",
            "range" :{
                "start" : 3006,
                "end" : 60000000,
                "interval" : 1000000
            }
        },
        
    )
}}



with cte_1 as

(

select 

*

from

{{source('airbnb', 'reviews')}}

)
 
select
listing_id,
DATE AS review_date,
reviewer_name,
comments AS review_text,
sentiment AS review_sentiment
from

cte_1
 