create role user_role;

show privileges;

grant create view, select, show view on *.* to 'user_role';
grant alter, create, delete, drop, index, lock tables, select, update on 
*.* to 'user_role';

create user 'enzo' default role 'user_role';

select user, host from mysql.user;

show grants for 'user_role';

revoke all privileges, grant option from 'user_role';

flush privileges;

drop user 'enzo';
drop role 'user_role';
