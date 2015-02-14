<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {font-size: 12px}
.STYLE4 {
	font-size: 12px;
	color: #1F4A65;
	font-weight: bold;
}

a:link {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;

}
a:visited {
	font-size: 12px;
	color: #06482a;
	text-decoration: none;
}
a:hover {
	font-size: 12px;
	color: #FF0000;
	text-decoration: underline;
}
a:active {
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}
.STYLE7 {font-size: 12}

-->
</style>


</head>

<body>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="30"><img src="<%=path %>/main/tab/images/tab_03.gif" width="15" height="30" /></td>
        <td width="1101" background="<%=path %>/main/tab/images/tab_05.gif"><img src="<%=path %>/main/tab/images/tb.gif" width="16" height="16" /> <span class="STYLE4">公告</span> 
        <img src="<%=path %>/main/tab/images/more05.gif" style="vertical-align: middle;" onclick="noticemore();" /></td>
        <td width="281" background="<%=path %>/main/tab/images/tab_05.gif"></td>
        <td width="14"><img src="<%=path %>/main/tab/images/tab_07.gif" width="14" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" background="<%=path %>/main/tab/images/tab_12.gif">&nbsp;</td>
        <td bgcolor="#f3ffe3"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c0de98" onmouseover="changeto()"  onmouseout="changeback()">
           <tr>
            <td width="6%" height="26" background="<%=path %>/main/tab/images/bg.gif" class="STYLE2 STYLE1"><div align="center" class="STYLE1">查看详情</div></td>
            <td width="8%" height="18" background="<%=path %>/main/tab/images/bg.gif" class="STYLE2 STYLE1"><div align="center" class="STYLE1">公告标题</div></td>
            <td width="14%" height="18" background="<%=path %>/main/tab/images/bg.gif" class="STYLE2 STYLE1"><div align="center" class="STYLE1">发布者</div></td>
            <td width="14%" height="18" background="<%=path %>/main/tab/images/bg.gif" class="STYLE2 STYLE1"><div align="center" class="STYLE1">发布时间</div></td>
            <td width="12%" height="18" background="<%=path %>/main/tab/images/bg.gif" class="STYLE2 STYLE1"><div align="center" class="STYLE1">有效时间</div></td>
	   	  </tr>
	   	  <s:if test="postlist.result.size()<=0">
	   	     <tr height="100px" valign="middle">
	         	<td height="100%" colspan="7" align="center" bgcolor="#FFFFFF">
	         	<b style="font-family: 楷体;font-size: 30px;font-weight: bold;">暂时没有公告</b>
	         	</td>         
	         </tr>     
	   	  </s:if>
	   	  <s:else>
	   	  <s:iterator value="postlist.result" var="post" begin="0" end="%{postlist.result.size() >9 ? 9:postlist.result.size()-1}">
          <tr>       
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">
            	<!--<s:if test="#post.nisread==0">
					<img src="<%=path %>/main/tab/images/weidu.jpg" onclick="location.href='<%=request.getContextPath()%>/post/postAction!lookpost?postid=${postid}'">
				</s:if>
				<s:elseif test="#post.nisread==1">
					<img src="<%=path %>/main/tab/images/weidu.jpg" onclick="location.href='<%=request.getContextPath()%>/post/postAction!lookpost?postid=${postid}'">
				</s:elseif> --> 
				<img src="<%=path %>/main/tab/images/weidu.jpg" onclick="location.href='<%=request.getContextPath()%>/post/postAction!lookpost?postid=${postid}'">	
            </div></td>   
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="#post.stitle"/></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="#post.updateuser"/></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:date name="begindate" format="yyyy-MM-dd HH:mm:ss"></s:date></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="#post.enddate"/></div></td>          
          </tr>
         </s:iterator>
         </s:else>
        </table></td>
        <td width="9" background="<%=path %>/main/tab/images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="29"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="29"><img src="<%=path %>/main/tab/images/tab_18.gif" width="15" height="29" /></td>
         <td width="100%" height="29" background="<%=path %>/main/tab/images/tab_19.gif"></td>
        <td width="14"><img src="<%=path %>/main/tab/images/tab_20.gif" width="14" height="29" /></td>
      </tr>
    </table></td>
  </tr>
</table>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="30"><img src="<%=path %>/main/tab/images/tab_03.gif" width="15" height="30" /></td>
        <td width="1101" background="<%=path %>/main/tab/images/tab_05.gif"><img src="<%=path %>/main/tab/images/tb.gif" width="16" height="16" /> <span class="STYLE4">邮件</span>
        <img src="<%=path %>/main/tab/images/more05.gif"　style="vertical-align: middle;" onclick="mailmore();"/></td>
        <td width="281" background="<%=path %>/main/tab/images/tab_05.gif"></td>
        <td width="14"><img src="<%=path %>/main/tab/images/tab_07.gif" width="14" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" background="<%=path %>/main/tab/images/tab_12.gif">&nbsp;</td>
        <td bgcolor="#f3ffe3"><table width="99%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#c0de98" onmouseover="changeto()"  onmouseout="changeback()">
 		  <tr>
            <td width="10%" height="26" background="<%=path %>/main/tab/images/bg.gif" class="STYLE2 STYLE1"><div align="center" class="STYLE1">查看详情</div></td>
            <td width="30%" height="18" background="<%=path %>/main/tab/images/bg.gif" class="STYLE2 STYLE1"><div align="center" class="STYLE1">邮件标题</div></td>
            <td width="30%" height="18" background="<%=path %>/main/tab/images/bg.gif" class="STYLE2 STYLE1"><div align="center" class="STYLE1">来至</div></td>
            <td width="30%" height="18" background="<%=path %>/main/tab/images/bg.gif" class="STYLE2 STYLE1"><div align="center" class="STYLE1">接收时间↓</div></td>         
	   	  </tr>
	   	   <s:if test="#request.emails==null||#request.emails.size()<=0">
	         <tr height="100px" valign="middle">
	         	<td height="100%" colspan="7" align="center" bgcolor="#FFFFFF">
	         	<b style="font-family: 楷体;font-size: 30px;font-weight: bold;">您的收件箱没有邮件</b>
	         	</td>         
	         </tr>         
         </s:if>
	   	 <s:else>
	   	    <s:iterator value="#request.emails" var="mail" begin="0" end="%{#request.emails.size()>9?9:#request.emails.size()-1}" status="i" >
          <tr>       
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1">
            	<s:if test="#mail.isread==0">
					<img src="<%=path %>/main/tab/images/weidu.jpg" onclick="location.href='<%=request.getContextPath()%>/email/emailAction!read.action?email.id=${id.email.id}&type=1'">
				</s:if>
				<s:elseif test="#mail.isread==1">
					<img src="<%=path %>/main/tab/images/yidu.jpg" onclick="location.href='<%=request.getContextPath()%>/email/emailAction!read.action?email.id=${id.email.id}&type=1'">
				</s:elseif>     	
            </div></td>   
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="#mail.id.email.title"/></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:property value="#request.type==3&&issend==true?id.username:#request.usernames.get(#i.index)"/></div></td>
            <td height="18" bgcolor="#FFFFFF"><div align="center" class="STYLE2 STYLE1"><s:date name="id.email.senddate" format="yyyy-MM-dd HH:mm:ss"></s:date></div></td>          
          </tr>
          </s:iterator>
	   	 </s:else>
        </table></td>
        <td width="9" background="<%=path %>/main/tab/images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="29"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="29"><img src="<%=path %>/main/tab/images/tab_18.gif" width="15" height="29" /></td>
        <td background="<%=path %>/main/tab/images/tab_19.gif"></td>
        <td width="100%" height="29" background="<%=path %>/main/tab/images/tab_19.gif"></td>
        <td width="14"><img src="<%=path %>/main/tab/images/tab_20.gif" width="14" height="29" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
<script type="text/javascript">
	function noticemore(){
		location.href="<%=request.getContextPath()%>/post/postAction!postlist";
	}
	function mailmore(){
		location.href="<%=request.getContextPath()%>/email/emailAction!emaillist.action?type=2";
	}
</script>
</html>
