/* Write your PL/SQL query statement below */
with sel as (
    select  
        person_name,
        sum(weight)
        over (order by turn) as cummulative_weight
    from queue
    order by cummulative_weight desc)
select person_name
from sel
where cummulative_weight <= 1000
and rownum= 1