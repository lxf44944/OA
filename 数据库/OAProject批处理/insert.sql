insert into t_datadic(did,dname,dpid,ddate,dupdateuser,dupdatedate,disdel) values(1,'省份',0,sysdate,'刘向峰1',sysdate,0);
insert into t_datadic(did,dname,dpid,ddate,dupdateuser,dupdatedate,disdel) values(2,'部门',0,sysdate,'刘向峰2',sysdate,0);
insert into t_datadic(did,dname,dpid,ddate,dupdateuser,dupdatedate,disdel) values(3,'职务',0,sysdate,'刘向峰3',sysdate,0);
insert into t_datadic(did,dname,dpid,ddate,dupdateuser,dupdatedate,disdel) values(4,'山西省',1,sysdate,'刘向峰1',sysdate,0);
insert into t_datadic(did,dname,dpid,ddate,dupdateuser,dupdatedate,disdel) values(5,'福建省',1,sysdate,'刘向峰1',sysdate,0);
insert into t_datadic(did,dname,dpid,ddate,dupdateuser,dupdatedate,disdel) values(6,'江苏省',1,sysdate,'刘向峰1',sysdate,0);
insert into t_datadic(did,dname,dpid,ddate,dupdateuser,dupdatedate,disdel) values(7,'技术部',2,sysdate,'刘向峰2',sysdate,0);
insert into t_datadic(did,dname,dpid,ddate,dupdateuser,dupdatedate,disdel) values(8,'后勤部',2,sysdate,'刘向峰2',sysdate,0);
insert into t_datadic(did,dname,dpid,ddate,dupdateuser,dupdatedate,disdel) values(9,'人力资源部',2,sysdate,'刘向峰2',sysdate,0);
insert into t_datadic(did,dname,dpid,ddate,dupdateuser,dupdatedate,disdel) values(10,'策划部',2,sysdate,'刘向峰2',sysdate,0);
insert into t_datadic(did,dname,dpid,ddate,dupdateuser,dupdatedate,disdel) values(11,'部门经理',3,sysdate,'刘向峰3',sysdate,0);
insert into t_datadic(did,dname,dpid,ddate,dupdateuser,dupdatedate,disdel) values(12,'项目经理',3,sysdate,'刘向峰3',sysdate,0);
insert into t_datadic(did,dname,dpid,ddate,dupdateuser,dupdatedate,disdel) values(13,'项目组长',3,sysdate,'刘向峰3',sysdate,0);

Insert into T_MENU (MENUID,MENUNAME,LINK,PID,ADDTIME,updateuser,updatetime,ISDEL,ORDERID) values (seq_menu.nextval,'个人管理','父菜单，无链接',0,sysdate,'admin',sysdate,0,1);
Insert into T_MENU (MENUID,MENUNAME,LINK,PID,ADDTIME,updateuser,updatetime,ISDEL,ORDERID) values (seq_menu.nextval,'个人公告','父菜单，无链接',0,sysdate,'admin',sysdate,0,2);
Insert into T_MENU (MENUID,MENUNAME,LINK,PID,ADDTIME,updateuser,updatetime,ISDEL,ORDERID) values (seq_menu.nextval,'系统管理','父菜单，无链接',0,sysdate,'admin',sysdate,0,3);
Insert into T_MENU (MENUID,MENUNAME,LINK,PID,ADDTIME,updateuser,updatetime,ISDEL,ORDERID) values (seq_menu.nextval,'公告管理','父菜单，无链接',0,sysdate,'admin',sysdate,0,4);
Insert into T_MENU (MENUID,MENUNAME,LINK,PID,ADDTIME,updateuser,updatetime,ISDEL,ORDERID) values (seq_menu.nextval,'内部邮件','父菜单，无链接',0,sysdate,'admin',sysdate,0,5);
Insert into T_MENU (MENUID,MENUNAME,LINK,PID,ADDTIME,updateuser,updatetime,ISDEL,ORDERID) values (seq_menu.nextval,'修改密码','oa/user!updatepwdview',1,sysdate,null,sysdate,0,7);
Insert into T_MENU (MENUID,MENUNAME,LINK,PID,ADDTIME,updateuser,updatetime,ISDEL,ORDERID) values (seq_menu.nextval,'个人信息修改','oa/user!onlyUpdateview',1,sysdate,null,sysdate,0,8);
Insert into T_MENU (MENUID,MENUNAME,LINK,PID,ADDTIME,updateuser,updatetime,ISDEL,ORDERID) values (seq_menu.nextval,'查看公告','post/postAction!postlist',2,sysdate,null,sysdate,0,9);
Insert into T_MENU (MENUID,MENUNAME,LINK,PID,ADDTIME,updateuser,updatetime,ISDEL,ORDERID) values (seq_menu.nextval,'角色管理','oa/rolelist!view',3,sysdate,null,sysdate,0,10);
Insert into T_MENU (MENUID,MENUNAME,LINK,PID,ADDTIME,updateuser,updatetime,ISDEL,ORDERID) values (seq_menu.nextval,'菜单管理','oa/menulist!view',3,sysdate,null,sysdate,0,11);
Insert into T_MENU (MENUID,MENUNAME,LINK,PID,ADDTIME,updateuser,updatetime,ISDEL,ORDERID) values (seq_menu.nextval,'数据字典','jsp/datadic/showData.jsp',3,sysdate,null,sysdate,0,12);
Insert into T_MENU (MENUID,MENUNAME,LINK,PID,ADDTIME,updateuser,updatetime,ISDEL,ORDERID) values (seq_menu.nextval,'用户管理','oa/userlist!view',3,sysdate,null,sysdate,0,13);
Insert into T_MENU (MENUID,MENUNAME,LINK,PID,ADDTIME,updateuser,updatetime,ISDEL,ORDERID) values (seq_menu.nextval,'写信','email/emailAction!drafts.action',5,sysdate,null,sysdate,0,20);
Insert into T_MENU (MENUID,MENUNAME,LINK,PID,ADDTIME,updateuser,updatetime,ISDEL,ORDERID) values (seq_menu.nextval,'发件箱','email/emailAction!emaillist.action?type=1',5,sysdate,null,sysdate,0,14);
Insert into T_MENU (MENUID,MENUNAME,LINK,PID,ADDTIME,updateuser,updatetime,ISDEL,ORDERID) values (seq_menu.nextval,'收件箱','email/emailAction!emaillist.action?type=2',5,sysdate,null,sysdate,0,15);
Insert into T_MENU (MENUID,MENUNAME,LINK,PID,ADDTIME,updateuser,updatetime,ISDEL,ORDERID) values (seq_menu.nextval,'草稿箱','email/emailAction!emaillist.action?type=0',5,sysdate,null,sysdate,0,16);
Insert into T_MENU (MENUID,MENUNAME,LINK,PID,ADDTIME,updateuser,updatetime,ISDEL,ORDERID) values (seq_menu.nextval,'垃圾箱','email/emailAction!emaillist.action?type=3',5,sysdate,null,sysdate,0,17);
Insert into T_MENU (MENUID,MENUNAME,LINK,PID,ADDTIME,updateuser,updatetime,ISDEL,ORDERID) values (seq_menu.nextval,'公告审核','post/postAction!shenghepost',4,sysdate,null,sysdate,0,18);
Insert into T_MENU (MENUID,MENUNAME,LINK,PID,ADDTIME,updateuser,updatetime,ISDEL,ORDERID) values (seq_menu.nextval,'公告处理','post/postAction!postmanage',4,sysdate,null,sysdate,0,19);



Insert into T_ROLE (ROLEID,ROLENAME,roleinfo,addtime,updateuser,updatetime,ISDEL) values (seq_role.nextval,'超级管理员','拥有所有权限',sysdate,'admin',sysdate,0);
Insert into T_ROLE (ROLEID,ROLENAME,roleinfo,addtime,updateuser,updatetime,ISDEL) values (seq_role.nextval,'管理员','系统管理',sysdate,'admin',sysdate,0);

Insert into T_ROLE_MENU (RoleID,MenuID) values (1,1);
Insert into T_ROLE_MENU (RoleID,MenuID) values (1,2);
Insert into T_ROLE_MENU (RoleID,MenuID) values (1,3);
Insert into T_ROLE_MENU (RoleID,MenuID) values (1,4);
Insert into T_ROLE_MENU (RoleID,MenuID) values (1,5);
Insert into T_ROLE_MENU (RoleID,MenuID) values (1,6);
Insert into T_ROLE_MENU (RoleID,MenuID) values (1,7);
Insert into T_ROLE_MENU (RoleID,MenuID) values (1,8);
Insert into T_ROLE_MENU (RoleID,MenuID) values (1,9);
Insert into T_ROLE_MENU (RoleID,MenuID) values (1,10);
Insert into T_ROLE_MENU (RoleID,MenuID) values (1,11);
Insert into T_ROLE_MENU (RoleID,MenuID) values (1,12);
Insert into T_ROLE_MENU (RoleID,MenuID) values (1,13);
Insert into T_ROLE_MENU (RoleID,MenuID) values (1,14);
Insert into T_ROLE_MENU (RoleID,MenuID) values (1,15);
Insert into T_ROLE_MENU (RoleID,MenuID) values (1,16);
Insert into T_ROLE_MENU (RoleID,MenuID) values (1,17);
Insert into T_ROLE_MENU (RoleID,MenuID) values (1,18);
Insert into T_ROLE_MENU (RoleID,MenuID) values (1,19);
Insert into T_ROLE_MENU (RoleID,MenuID) values (2,1);
Insert into T_ROLE_MENU (RoleID,MenuID) values (2,2);
Insert into T_ROLE_MENU (RoleID,MenuID) values (2,3);
Insert into T_ROLE_MENU (RoleID,MenuID) values (2,4);
Insert into T_ROLE_MENU (RoleID,MenuID) values (2,5);
Insert into T_ROLE_MENU (RoleID,MenuID) values (2,6);
Insert into T_ROLE_MENU (RoleID,MenuID) values (2,10);
Insert into T_ROLE_MENU (RoleID,MenuID) values (2,11);
Insert into T_ROLE_MENU (RoleID,MenuID) values (2,12);
Insert into T_ROLE_MENU (RoleID,MenuID) values (2,13);

Insert into T_USER(userid,username,password,realname,deptno,jobno,regdate,sex,city,idcard,telephone,
 email,mobilephone,address,married,freeze) values(seq_user.nextval,'superadmin','123','admin',12,7,
sysdate,'1','福州','35052419910511105x','0591-88888888','18950499748@163.com','18950499748','福州','0','0');
Insert into T_USER(userid,username,password,realname,deptno,jobno,regdate,sex,city,idcard,telephone,
 email,mobilephone,address,married,freeze) values(seq_user.nextval,'lin','123','admin',13,8,
sysdate,'1','福州','35052419910511105x','0591-88888888','18950499748@163.com','18950499748','福州','0','0');

insert into t_user_role(userid,roleid) values (1,1);
insert into t_user_role(userid,roleid) values (2,1);
insert into t_user_role(userid,roleid) values (1,2);
insert into t_user_role(userid,roleid) values (2,2);

insert into t_tips values(1,1,1,1,1000);
insert into t_tips values(2,1,1,1,1000);

insert into T_STATUS_TIME (NTIME, ID)
values (3, 1);


commit;

