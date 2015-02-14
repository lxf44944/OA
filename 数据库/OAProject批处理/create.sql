/*==============================================================*/
/* DBMS name:      ORACLE Version 10g                           */
/* Created on:     2013/8/12 23:53:36                           */
/*==============================================================*/


alter table t_email_file
   drop constraint fk_t_email__reference_t_email;

alter table t_post_file
   drop constraint fk_t_post_f_reference_t_post;

drop table t_datadic cascade constraints;

drop table t_email cascade constraints;

drop table t_email_file cascade constraints;

drop table t_menu cascade constraints;

drop table t_post cascade constraints;

drop table t_post_file cascade constraints;

drop table t_post_user cascade constraints;

drop table t_receiveemail cascade constraints;

drop table t_role cascade constraints;

drop table t_role_menu cascade constraints;

drop table t_status_time cascade constraints;

drop table t_tips cascade constraints;

drop table t_user cascade constraints;

drop table t_user_role cascade constraints;

/*==============================================================*/
/* Table: t_datadic                                             */
/*==============================================================*/
create table t_datadic  (
   did                  number(8)                       not null,
   dname                varchar2(40),
   dpid                 number(8),
   ddate                date,
   dupdateuser          varchar2(20),
   dupdatedate          date,
   disdel               number(1),
   constraint pk_t_datadic primary key (did)
);

/*==============================================================*/
/* Table: t_email                                               */
/*==============================================================*/

create table T_EMAIL
(
  id         NUMBER(8) not null,
  title      VARCHAR2(32),
  senddate   DATE,
  isfile     NUMBER(1),
  content    CLOB,
  nemailmode NUMBER(1)
)
;
comment on table T_EMAIL
  is '邮箱表';
comment on column T_EMAIL.id
  is '邮件编号';
comment on column T_EMAIL.title
  is '主题';
comment on column T_EMAIL.senddate
  is '发信时间';
comment on column T_EMAIL.isfile
  is '是否有附件 0没有附件，1有附件';
comment on column T_EMAIL.content
  is '邮件内容';
comment on column T_EMAIL.nemailmode
  is '是否已发 0 已发邮件，1草稿';
alter table T_EMAIL
  add constraint PK_T_EMAIL primary key (ID);


/*==============================================================*/
/* Table: t_email_file                                          */
/*==============================================================*/

create table T_EMAIL_FILE
(
  id      NUMBER(8) not null,
  emailid NUMBER(8),
  oldname VARCHAR2(32),
  newname VARCHAR2(80)
)
;
comment on table T_EMAIL_FILE
  is '邮件附件表';
comment on column T_EMAIL_FILE.id
  is '附件编号';
comment on column T_EMAIL_FILE.emailid
  is '附件邮件编号';
comment on column T_EMAIL_FILE.oldname
  is '原附件名';
comment on column T_EMAIL_FILE.newname
  is '新附件名';
alter table T_EMAIL_FILE
  add constraint PK_T_EMAIL_FILE primary key (ID);
alter table T_EMAIL_FILE
  add constraint FK_T_EMAIL_FILE foreign key (EMAILID)
  references T_EMAIL (ID);

/*==============================================================*/
/* Table: t_menu                                                */
/*==============================================================*/
create table t_menu  (
   menuid               number(8)                       not null,
   menuname             varchar2(50),
   link                 varchar2(120),
   pid                  number(8),
   addtime              date,
   updateuser           varchar2(30),
   updatetime           date,
   isdel                number(8),
   orderid              number(8),
   constraint pk_t_menu primary key (menuid)
);

comment on table t_menu is
'菜单表';

comment on column t_menu.menuid is
'菜单ID';

comment on column t_menu.menuname is
'菜单名称';

comment on column t_menu.link is
'菜单链接';

comment on column t_menu.pid is
'父类ID';

comment on column t_menu.addtime is
'添加时间';

comment on column t_menu.updateuser is
'添加角色的用户';

comment on column t_menu.updatetime is
'更新时间';

comment on column t_menu.isdel is
'是否删除';

comment on column t_menu.orderid is
'排序ID';



/*==============================================================*/
/* Table: t_receiveemail                                        */
/*==============================================================*/
create table T_RECEIVEEMAIL
(
  username VARCHAR2(30) not null,
  emailid  NUMBER(8) not null,
  isread   NUMBER(1),
  isdel    NUMBER(1),
  issend   NUMBER(1)
)
;
comment on table T_RECEIVEEMAIL
  is '收信箱表';
comment on column T_RECEIVEEMAIL.username
  is '收件或发件用户';
comment on column T_RECEIVEEMAIL.emailid
  is '邮件编号';
comment on column T_RECEIVEEMAIL.isread
  is '是否已读 0未读，1已读';
comment on column T_RECEIVEEMAIL.isdel
  is '是否被删除 0未删除，1已删除';
comment on column T_RECEIVEEMAIL.issend
  is '是否是发件方 0：发件 1：收件';
alter table T_RECEIVEEMAIL
  add constraint PK_T_RECEIVEEMAIL primary key (USERNAME, EMAILID);


/*==============================================================*/
/* Table: t_role                                                */
/*==============================================================*/
create table t_role  (
   roleid               number(8)                       not null,
   rolename             varchar2(30),
   roleinfo             varchar2(200),
   addtime              date,
   updateuser           varchar2(30),
   updatetime           date,
   isdel                number(8),
   constraint pk_t_role primary key (roleid)
);

comment on table t_role is
'角色表';

comment on column t_role.rolename is
'角色名称';

comment on column t_role.roleinfo is
'角色描述';

comment on column t_role.addtime is
'添加时间';

comment on column t_role.updatetime is
'更新时间';

comment on column t_role.isdel is
'是否删除(0未删除1已删除)';

/*==============================================================*/
/* Table: t_role_menu                                           */
/*==============================================================*/
create table t_role_menu  (
   roleid               number(8)                       not null,
   menuid               number(8)                       not null,
   constraint pk_t_role_menu primary key (roleid, menuid)
);

comment on table t_role_menu is
'角色菜单表';

comment on column t_role_menu.roleid is
'角色id';

comment on column t_role_menu.menuid is
'菜单id';

/*==============================================================*/
/* Table: t_post                                                */
/*==============================================================*/
create table t_post  (
   postid               number(8)                       not null,
   suser                varchar2(30),
   stitle               varchar2(32),
   scontent             clob,
   begindate            date,
   enddate              date,
   nstatus              number(1),
   nisfile              number(1),
   addtime              date,
   updateuser           varchar(16),
   updatetime           date,
   constraint PK_T_POST primary key (postid)
);

comment on table t_post is
'公告表';

comment on column t_post.postid is
'公告编号';

comment on column t_post.suser is
'发布者';

comment on column t_post.stitle is
'公告标题';

comment on column t_post.scontent is
'公告内容';

comment on column t_post.begindate is
'生效时间';

comment on column t_post.enddate is
'失效时间';

comment on column t_post.nstatus is
'公告审核状态 0未审核，1通过审核，2未通过审核';

comment on column t_post.nisfile is
'附件是否存在 0不存在，1存在';

comment on column t_post.addtime is
'发布时间';

comment on column t_post.updateuser is
'修改者';

comment on column t_post.updatetime is
'修改时间';

/*==============================================================*/
/* Table: t_post_file                                           */
/*==============================================================*/
create table t_post_file  (
   nid                  number(8)                       not null,
   postid               number(8),
   soldname             varchar(32),
   snewname             varchar(80),
   constraint PK_T_POST_FILE primary key (nid)
);

comment on table t_post_file is
'公告附件表';

comment on column t_post_file.nid is
'附件编号';

comment on column t_post_file.soldname is
'附件旧名字';

comment on column t_post_file.snewname is
'附件新名字';

/*==============================================================*/
/* Table: t_post_user                                           */
/*==============================================================*/
create table t_post_user  (
   suserid              number(8)                       not null,
   nisread              number(1),
   postid               number(8)                       not null,
   constraint PK_T_POST_USER primary key (suserid, postid)
);

comment on table t_post_user is
'公告用户表';

comment on column t_post_user.suserid is
'用户账号';

comment on column t_post_user.nisread is
'公告是否已读 0未读，1已读';

/*==============================================================*/
/* Table: t_status_time                                         */
/*==============================================================*/
create table t_status_time  (
   ntime                number(2),
   id                   number(8)                       not null,
   constraint PK_T_STATUS_TIME primary key (id)
);

comment on table t_status_time is
'自动审核时间表';

comment on column t_status_time.ntime is
'自动审核时间';

/*==============================================================*/
/* Table: t_tips                                                */
/*==============================================================*/
create table t_tips  (
   tuserid              number(8)                       not null,
   tshowpost            number(1),
   tshowemail           number(1),
   tisshow              number(1),
   showtime             number(8),
   constraint pk_t_tips primary key (tuserid)
);

/*==============================================================*/
/* Table: t_user                                                */
/*==============================================================*/
create table t_user  (
   userid               number(8)                       not null,
   username             varchar2(30),
   password             varchar2(30),
   realname             varchar2(30),
   deptno               number(8),
   jobno                number(8),
   regdate              date,
   sex                  varchar2(4),
   city                 varchar2(30),
   idcard               varchar2(20),
   telephone            varchar2(20),
   email                varchar2(50),
   mobilephone          varchar2(20),
   address              varchar2(200),
   married              number(8),
   freeze               number(8),
   constraint pk_t_user primary key (userid)
);

comment on table t_user is
'用户表';

comment on column t_user.username is
'用户名';

comment on column t_user.password is
'密码';

comment on column t_user.realname is
'真实姓名';

comment on column t_user.deptno is
'部门ID';

comment on column t_user.jobno is
'职务ID';

comment on column t_user.regdate is
'注册时间';

comment on column t_user.sex is
'性别(1男2女)';

comment on column t_user.city is
'籍贯';

comment on column t_user.idcard is
'身份证号';

comment on column t_user.telephone is
'家庭电话';

comment on column t_user.email is
'电子邮件';

comment on column t_user.mobilephone is
'手机号码';

comment on column t_user.address is
'地址';

comment on column t_user.married is
'是否婚否（1未婚2已婚)';

comment on column t_user.freeze is
'是否冻结(1冻结0正常）';

/*==============================================================*/
/* Table: t_user_role                                           */
/*==============================================================*/
create table t_user_role  (
   userid               number(8)                       not null,
   roleid               number(8)                       not null,
   constraint pk_t_user_role primary key (userid, roleid)
);

comment on table t_user_role is
'用户角色表';

alter table t_email_file
   add constraint fk_t_email__reference_t_email foreign key (id)
      references t_email (id);



create sequence seq_datadic;
create sequence seq_email;
create sequence seq_email_file;
create sequence seq_menu;
create sequence seq_post;
create sequence seq_post_file;
create sequence seq_role;
create sequence seq_tips;
create sequence seq_user;