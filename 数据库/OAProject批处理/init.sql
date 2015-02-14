spool ./log.log;
drop user oapro cascade;
create user oapro identified by oapro;
grant connect,resource to oapro;
conn oapro/oapro;
@@create.sql;
@@insert.sql;
spool off;