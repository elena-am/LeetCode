/* Write your PL/SQL query statement below */
with prod_feb as (
    select p.product_name,sum(o.unit) total_units
    from products p
    join orders o on
    p.product_id = o.product_id
    where o.order_date between to_date('01.02.2020','dd.mm.yyyy')
                           and to_date('29.02.2020','dd.mm.yyyy')
    group by p.product_name
)
select product_name,total_units as unit
from prod_feb
where total_units >= 100

--better:
select p.product_name, sum(unit) as unit 
from products p 
join orders o on p.product_id = o.product_id 
where to_char(order_date, 'MON-YYYY') = 'FEB-2020' 
group by p.product_name 
having sum(unit ) >= 100