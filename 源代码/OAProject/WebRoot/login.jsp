<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">

		<title>欢迎登陆OA系统</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<link href="css/login.css" rel="stylesheet" type="text/css" />
		<script src="js/jquery-1.9.1.min.js"></script>
		<script src="js/login.js" type="text/javascript"></script>
		<script>
		function login(){			
			var logincount = ${sessionScope.logincount==null?0:sessionScope.logincount};	
			<%
			Integer count=(Integer)ActionContext.getContext().getSession().get("logincount");
			if(count==null){
			count=0;
			}
			if(count>=3){
				ActionContext.getContext().getSession().put("logincount",0);
			}
			%>		
			if(logincount>=3){
				alert("密码连错三次系统默认你为非法入侵");
				window.opener=null;
			  	window.open('','_self');
			  	window.close();	
				}
			}
			</script>
	</head>
	<body onload="login();">
		<div id="page">
			<div id="context">
				<div id="formdiv">
					<form name="form1" id="form1" action="userlogin!checklogin" method="post" target="_top" onSubmit="return checkALL();">
						用户：<s:textfield name="username" id="uname" cssClass="inputtext" maxlength="15" value="lin"/>
						<br />
						密码：<s:password id="pwd" name="password" cssClass="inputtext2" maxlength="15" value="123"/>
						<br />
						验证码：
						<s:textfield name="code" id="code" maxlength="4" />
						<img alt="请输入该验证码"
							onclick="this.src='img2.jsp?asda='+new Date().getTime()"
							style="cursor: hand" src="img2.jsp" id="requestcode" />
						<span id="codemsg"></span>
						<br />
						<div>
						<img src="<%=path%>/main/images/dl.gif"width="60" height="25" border="0" onclick="javascript:form1.submit();"/>
						<img src="<%=path%>/main/images/cz.gif"width="60" height="25" border="0" onclick="javascript:form1.reset();" /> </div>
					</form>
				</div>
			</div>
		</div>
		<s:fielderror fieldName="codeerror" cssStyle="color:red;" />
		<span id="error" style="color:red"></span>
		<br />
	</body>
</html>
