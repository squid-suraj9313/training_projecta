select * from 
{{ref('dim_listing_w_host')}} 
where created_at > updated_at