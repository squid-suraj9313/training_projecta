select count(*) from {{ref('src_hosts')}}
group by host_id having count(*) > 1
