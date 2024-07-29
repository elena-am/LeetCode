/* Write your PL/SQL query statement below */
select to_char(sell_date,'yyyy-mm-dd') as sell_date,
        count(distinct product) as num_sold, 
        listagg(product, ',') within group (order by product) as products
from (
    select distinct sell_date, product
    from activities) t
group by sell_date
order by sell_date