<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'center.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	overflow:visible; 
}
-->
</style></head>
<SCRIPT type="text/javascript">
 function refresh(){
   window.parent.frames["I2"].location="<%=path %>/oa/menu!getUserRoleMenu";
 }
</SCRIPT>
<body onload="refresh()">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed">
  <tr>
    <td background="<%=path %>/main/images/main_140.gif" style="width:3px;">&nbsp;</td>
    <td width="177"  style="border-right:solid 1px #9ad452;">
    <iframe id ="I2" name="I2" height="105%" width="100%" border="0" frameborder="0" scrolling="auto" src="<%=path %>/oa/menu!getUserRoleMenu"></iframe>
	</td>
    <td><br><iframe name="I1" src="<%=path %>/oa/user!dotag" height="95%" width="100%" border="0" scrolling="auto" frameborder="0"></iframe>
    <br></td>
    <td background="<%=path %>/main/images/main_142.gif" style="width:3px;">&nbsp;</td>
  </tr>
</table>
</body>
</html>
