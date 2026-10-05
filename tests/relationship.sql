-- tests/relationship.sql
SELECT
    l.host_id
FROM {{ ref('src_listings') }} l 
LEFT JOIN {{ ref('src_hosts') }} r 
    ON l.host_id = r.host_id
WHERE r.host_id IS NULL
  AND l.host_id IS NOT NULL  -- Ensures you only catch actual mismatched host IDs, ignoring nulls
