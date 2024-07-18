/* Write your PL/SQL query statement below */
select t.*,
        CASE
            WHEN t.x+t.y>t.z and t.y+t.z>t.x and t.x+t.z>t.y THEN
                'Yes'
            ELSE
                'No'
        END as triangle
from triangle t