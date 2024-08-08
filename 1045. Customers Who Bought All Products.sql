/* Write your PL/SQL query statement below */
select customer_id from customer c
inner join product p on
c.product_key = p.product_key
having count(distinct c.product_key)=(select count(*) from product)
group by customer_id