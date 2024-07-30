/* Write your PL/SQL query statement below */
with first_login as (
        select 
            player_id, 
            min(event_date) as first_login_date
        from activity
        group by player_id
    ),
    second_login as (
        select 
            fl.player_id
        from first_login fl
        join activity a on
        fl.player_id = a.player_id
        and event_date = first_login_date+1
    )
select ROUND(
        (SELECT COUNT(*) FROM second_login) / (SELECT COUNT(DISTINCT player_id) FROM activity), 
        2
    ) AS fraction
FROM dual;