select
    host_id,
    host_name,
    is_superhost
from {{ ref('src_hosts') }}
where 
    (is_superhost = true or is_superhost = 't')
    and (host_name is null or trim(host_name) = '')