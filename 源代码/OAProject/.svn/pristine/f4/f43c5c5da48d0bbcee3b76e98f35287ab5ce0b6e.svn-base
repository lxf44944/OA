<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'error.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
 <script type="text/javascript">
	function doit(){
		window.setTimeout("godefault();", 1000);
		dochange();
	}
	var i=1;
	function dochange(){
		var span=document.getElementById("xx");
		span.innerHTML=i;
		if(i>0){
		i--;
		}
	}
	function godefault(){
		location.href='<%=basePath%>${defaultURL}';
	}
</script>
<STYLE type=text/css>
#xx {
	color: red;
	}
</STYLE>
<BODY oncontextmenu="return false" onselectstart="return false"  onload="doit();">
<P align=center>　</P>
<P align=center>　</P>
<TABLE cellSpacing=0 cellPadding=0 width=540 align=center border=0>
 <TBODY>
  <TR>
    <TD vAlign=top height=270>
      <DIV align=center><BR><IMG height=211 src="main/images/error.gif" 
      width=329><BR><BR>
      <TABLE cellSpacing=0 cellPadding=0 width="50%" border=0>
        <TBODY> 
        <TR>
          <TD>
            <P><BR><FONT color=#000000>
            <div align="center" style="color: red">${message }</div>
            <div align="center"><span id="xx">1</span>秒之后自动跳回登录页</div>
           	
      　</FONT></P></TD></TR></TBODY></TABLE></DIV></TD></TR>
   
 </TBODY></TABLE></BODY>
   </BODY>
</HTML>

