select s.name from salesperson s
minus
select s.name from salesperson s
join orders o on
s.sales_id = o.sales_id
where o.com_id = (select c.com_id 
                    from company c
                   where c.name = 'RED')