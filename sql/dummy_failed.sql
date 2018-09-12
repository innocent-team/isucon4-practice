insert into user_failed
SELECT
    user_id,
    COUNT(1) as `count`
FROM login_log l
natural join (
    select user_id, max(id) as max_id
    from login_log
    where succeeded = 1
    group by 1
) t
where l.id > t.max_id
group by 1
;

insert into ip_failed
select
    l.ip,
    count(1) as `count`
from login_log l
natural join (
    select ip, max(id) as max_id
    from login_log
    where succeeded = 1
    group by 1
) t
where l.id > t.max_id
group by 1
;
