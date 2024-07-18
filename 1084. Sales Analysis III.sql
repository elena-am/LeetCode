/* Write your PL/SQL query statement below */
select distinct s.product_id, p.product_name
from sales s
join product p on
s.product_id = p.product_id
where s.sale_date between to_date('2019-01-01','yyyy-mm-dd') and to_date('2019-03-31','yyyy-mm-dd')
and not exists ( 
    select *
    from sales s2
    where s.product_id = s2.product_id
    and s2.sale_date not between to_date('2019-01-01','yyyy-mm-dd') 
    and to_date  ('2019-03-31','yyyy-mm-dd'))

--A much better solution
SELECT
    p.product_id,
    p.product_name
FROM Sales s
INNER JOIN Product p ON s.product_id = p.product_id
GROUP BY
    p.product_id,
    p.product_name
HAVING
    SUM(CASE WHEN sale_date BETWEEN '2019-01-01' AND '2019-03-31' THEN 0 ELSE 1 END) = 0