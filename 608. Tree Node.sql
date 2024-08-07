/* Write your PL/SQL query statement below */
-- using CASE
select
    id,
    case
        when p_id is null then 'Root'
        when id not in (select distinct p_id from tree where p_id is not null) then 'Leaf'
    else 'Inner'
    end type
from tree

--using self joins
SELECT 
    distinct t1.id,
    CASE
        WHEN t1.p_id IS NULL THEN 'Root'
        WHEN t2.id IS NULL THEN 'Leaf'
    ELSE 'Inner'
    END AS type
FROM tree t1
LEFT JOIN tree t2 ON t1.id = t2.p_id;