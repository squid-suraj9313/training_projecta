select 
*
from
{{ref('src_listing')}}
where price < 0 
limit 10