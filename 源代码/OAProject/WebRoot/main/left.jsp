<%@page import="tips.dao.TTipsDAO"%>
<%@page import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="pojo.TUser"%>
<%@page import="pojo.TTips"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
TUser user = (TUser) session.getAttribute("user");
int userid = user.getUserid();
/*username= session.getAttribute("user");		 */

ApplicationContext context = new ClassPathXmlApplicationContext(
		"applicationContext.xml");
TTipsDAO dao = (TTipsDAO) context.getBean("TTipsDAO");
/* TTips tips = dao.findById(id); */
TTips tips = dao.findById(userid);
int isShowPost = tips.getTshowpost();
int isShowEmail = tips.getTshowemail();
int isShow = tips.getTisshow();
int showTime = tips.getShowtime() * 1000;//变为毫秒数

%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>菜单栏</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	font-size: 12px;
	color: #FFFFFF;
}
.STYLE3 {
	font-size: 12px;
	color: #033d61;
}

a:link {font-size:12px; text-decoration:none; color:#43860c;}
a:visited {font-size:12px; text-decoration:none; color:#43860c;}
a:hover{font-size:12px; text-decoration:none; color:#FF0000;}
-->
</style>
	<SCRIPT language=JavaScript>
function showsubmenu(sid)
{
whichEl = "submenu" + sid;
whichEl=document.getElementById(whichEl);
if (whichEl.style.display == "none")
{
	whichEl.style.display="";
}
else
{
whichEl.style.display="none";
}
}
</SCRIPT>
</head>
<body>
<table width="165" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="table-layout:fixed">
      <tr>
        <td height="20" background="<%=path %>/main/images/main_40.gif" style="font-size: 12px;color: #FFFFFF;" align="center">&nbsp;管理菜单</td>
      </tr>
     <tr>
        <td height="80" style="background-image:url(<%=path %>/main/images/main_23.gif); background-repeat:repeat-x;">
		<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="45"><div align="center"><a href="<%=path%>/jsp/tips/setTips.jsp?showtime=<%=tips.getShowtime()%>&showpost=<%=tips.getTshowpost()%>&isshow=<%=tips.getTisshow()%>&showemail=<%=tips.getTshowemail()%>&userid=<%=tips.getTuserid()%>" target="I1"><img src="<%=path %>/main/images/tips.jpg" name="Image1" width="40" height="40" border="0" id="Image1" /></a></div></td>
            <td><div align="center"><a href="<%=path%>/oa/user!updatepwdview" target="I1"><img src="<%=path %>/main/images/pass.jpg" name="Image2" width="40" height="40" border="0" id="Image2" /></a></div></td>
            <td><div align="center"><a href="<%=path%>/oa/user!onlyUpdateview" target="I1"><img src="<%=path %>/main/images/professional.jpg" name="Image3" width="40" height="40" border="0" id="Image3"  /></a></div></td>
          </tr>
          <tr>
            <td height="25"><div align="center" class="STYLE2"><a href="<%=path%>/jsp/tips/setTips.jsp?showtime=<%=tips.getShowtime()%>&showpost=<%=tips.getTshowpost()%>&isshow=<%=tips.getTisshow()%>&showemail=<%=tips.getTshowemail()%>&userid=<%=tips.getTuserid()%>" target="I1">小贴士</a></div></td>
            <td><div align="center" class="STYLE2"><a href="<%=path%>/oa/user!updatepwdview" target="I1">密码</a></div></td>
            <td><div align="center" class="STYLE2"><a href="<%=path%>/oa/user!onlyUpdateview" target="I1">个人信息</a></div></td>
          </tr>
        </table>
		</td>
   	</tr>
    <tr>
        <td  style="line-height:4px; background:url(<%=path %>/main/images/main_29.gif)">&nbsp;</td>
    </tr>
    <tr>
        <td>
			<table width="100%" border="0" cellpadding="0" cellspacing="0" background="<%=path %>/main/images/main_51.gif"> 
 <s:iterator value="menulist.{?#this.pid==0}" var="max">
  <tr>
    <td><TABLE width="97%" border=0 align=right cellPadding=0 cellSpacing=0 class=leftframetable>
      <TBODY>
        <TR>
          <TD height="25" style="background:url(<%=path %>/main/images/main_47.gif) no-repeat">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <TD width="20"></TD>
				<TD class=STYLE3 style="CURSOR: hand" onclick=showsubmenu(${menuid}); height=25><span class="STYLE3"><s:property value="#max.menuname"/></span></TD>        	  
              </tr>
            </table>            </TD>
          </TR>
        <TR>
          <TD><TABLE id="submenu${menuid }" cellSpacing=0 cellPadding=0 width="100%" border=0>
              <TBODY>
              <s:iterator value="menulist.{? #this.pid==#max.menuid}" var="min">
              	<TR>
                  <TD><IMG src="<%=path %>/main/images/left.gif" width="10" height="10"></TD>
                  <TD height=23><A href="${link }" target=I1><s:property value="#min.menuname"/></A></TD>
                </TR>
                </s:iterator>
              </TBODY>
          </TABLE></TD>
        </TR>
      </TBODY>
    </TABLE></td>
  </tr>
  <tr>
    <td  background="<%=path %>/main/images/main_51.gif" width="120" height="3" ></td>
  </tr>
</s:iterator> 
</table>
		</td>
    </tr>
    </table>
	</td>
  </tr>
</table>
</body>
</html>
