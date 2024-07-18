/* Write your PL/SQL query statement below */
select to_char(activity_date,'yyyy-mm-dd') day, count(distinct user_id) as active_users
from activity
where activity_date between to_date('2019-07-27','yyyy-mm-dd')-29 and to_date('2019-07-27','yyyy-mm-dd')
group by activity_date
order by 1