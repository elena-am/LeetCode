/* Write your PL/SQL query statement below */
select customer_number
from (
    select customer_number, count(order_number) as nr_orders
    from orders
    group by customer_number
    order by nr_orders desc)
where rownum = 1