/* Write your PL/SQL query statement below */
select unique_id,name
from employees e
left join employeeUNI uni on
e.id = uni.id