/* Write your PL/SQL query statement below */
select p.project_id, ROUND(avg(cast(e.experience_years as NUMBER)), 2) as average_years
from employee e
join project p on
p.employee_id = e.employee_id
group by p.project_id
order by p.project_id