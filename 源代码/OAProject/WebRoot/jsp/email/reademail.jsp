<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<% request.setAttribute("path", request.getContextPath()); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>${request.receiveEmail.id.email.title}</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}

.STYLE1 {
	font-size: 25px;
	font-family: 楷体
}

.STYLE3 {
	font-size: 15px;
	font-weight: bold;
}

.STYLE4 {
	color: blue;
	font-size: 30px;
}

A.ACLASS:link {
	font-size: 15px;
	color: blue;
	text-decoration: none
}

A.ACLASS:hover {
	font-size: 15px;
	color: blue;
	text-decoration: none
}

A.ACLASS:visited {
	font-size: 15px;
	color: blue;
	text-decoration: none
}

A.ACLASS:active {
	font-size: 15px;
	color: blue;
	text-decoration: none
}

A.ACLASS2:link {
	font-size: 30px;
	color: #9A32CD;
	text-decoration: none
}

A.ACLASS2:hover {
	font-size: 35px;
	color: purple;
	text-decoration: underline;
}

A.ACLASS2:visited {
	font-size: 30px;
	color: #9A32CD;
	text-decoration: none
}

A.ACLASS2:active {
	font-size: 30px;
	color: #9A32CD;
	text-decoration: none
}
</style>

		<SCRIPT type="text/javascript">
		 window.onload = function() 
	     { 
	           var oFCKeditor = new FCKeditor('{=i_name}') ; 
	           oFCKeditor.BasePath  = '{=dirFCK}FCKeditor/'; 
	           oFCKeditor.ToolbarSet = 'Readonly'; 
	           oFCKeditor.Height = 500; 
	           oFCKeditor.ReplaceTextarea(); 
	     }; 
		
		function FCKeditor_OnComplete(editor){
			editor.EditorDocument.body.contentEditable = false; 
	        editor.EditMode=FCK_EDITMODE_SOURCE; 
	        editor.ToolbarSet.RefreshModeState(); 
	        editor.EditMode=FCK_EDITMODE_WYSIWYG; 
	        editor.ToolbarSet.RefreshModeState();    
	    }
		FCKeditor_OnComplete();
	</SCRIPT>
	</head>

	<body>					
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="30"
				background="<%=request.getContextPath()%>/main/tab/images/tab_05.gif"><table
					width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="12" height="30"><img
							src="<%=request.getContextPath()%>/main/tab/images/tab_03.gif"
							width="12" height="30" /></td>
						<td><div align="center">
								<img src="<%=request.getContextPath()%>/main/tab/images/tb.gif"
									width="16" height="16" />
							</div></td>
						<td width="95%"><span class="STYLE3">你当前的位置</span>：[<a class="ACLASS" href="<%=request.getContextPath()%>/email/emailAction.action">邮件中心</a>]-[<a class="ACLASS" href="<%=request.getContextPath()%>/email/emailAction!emaillist.action?type=${type}">${type==0?"草稿箱":type==1?"已发送":type==2?"收件箱":"垃圾箱"}</a>]-[${request.receiveEmail.id.email.title}]</td>

						<td width="16"><img
							src="<%=request.getContextPath()%>/main/tab/images/tab_07.gif"
							width="16" height="30" /></td>
					</tr>
				</table></td>
		</tr>
		<tr height="800px" valign="top">
			<td width="100%"><table width="100%" height="100%" border="0"
					cellspacing="0" cellpadding="0">
					<tr valign="top">
						<td width="8"
							background="<%=request.getContextPath()%>/main/tab/images/tab_12.gif">&nbsp;</td>
						<td align="center"><table width="60%" border="0" cellpadding="0"
								cellspacing="0" bgcolor="#FFFFFF">
								<tr>
									<td  width="100%" height="100%"><div>
										<h4>${request.receiveEmail.id.email.title}</h4>
		
		发件人：<b style="size: 14;color: green;">
		<s:if test="#request.receiveEmail.issend">
		<s:property value="#request.receiveEmail.id.username"/>
		</s:if>
		<s:else>
		<s:property value="receiveUserNames"/>
		</s:else>	
		</b><br>
			
		时&nbsp;&nbsp;&nbsp;&nbsp;间：&nbsp;&nbsp;<s:date name="#request.receiveEmail.id.email.senddate" format="yyyy年MM月dd日     HH时mm分"/><br>
		
		收件人：
		<s:if test="#request.receiveEmail.issend">
		<s:property value="receiveUserNames"/>			
		</s:if>
		<s:else>
		<s:property value="#request.receiveEmail.id.username"/>
		</s:else>
		<br>
		附&nbsp;&nbsp;&nbsp;&nbsp;件：&nbsp;&nbsp;<s:property value="#request.receiveEmail.id.email.isfile==false?'无':#request.receiveEmail.id.email.emailFiles.size()"/>${request.receiveEmail.id.email.isfile==false?"":"个"}<br>
		<br>
		<FCK:editor instanceName="editor"  height="500" value="${request.receiveEmail.id.email.content}" /> 
			
						<!-- 附件列表 -->
						<table width="30%" border="1" bgcolor="#aaFFFF">	
							<tr>
								<td align="center">
									附件列表
								</td>
							</tr>					
								<s:iterator value="#request.receiveEmail.id.email.emailFiles">
									<tr id="tr${id}" >
										<td>
											<s:property value="oldname" />
											&nbsp;
											<input type="button" value="下载" onclick="javascript:window.location.href='${request.path}/email/emailDownLoadAction.action?fileId=${id}'">

										</td>
									</tr>
								</s:iterator>
						</table>
						<br>
						<input type="button" value="<< 返回" onclick="javascript:window.location.href=document.referrer;">&nbsp;&nbsp;&nbsp;
						<s:if test="#request.receiveEmail.issend == false">
							<input type="button" value="回复" onclick="javascript:window.location.href='${request.path}/jsp/email/addemail.jsp?mode=reply&receiveUserNames=${receiveUserNames}&title=${request.receiveEmail.id.email.title}'">
						</s:if>
						<s:if test="#request.receiveEmail.id.email.emailmode == true">
							<input type="button" value="转发" onclick="javascript:window.location.href='${request.path}/email/emailAction!emailForward.action?email.id=${request.receiveEmail.id.email.id}'">
						</s:if>
						<s:if test="#request.receiveEmail.isdel">
						<input type="button" value="还原" onclick="javascript:window.location.href='${request.path}/email/emailAction!delete.action?email.id=${request.receiveEmail.id.email.id}&type=1'">
						</s:if>
						<s:else>
						<input type="button" value="删除" onclick="javascript:window.location.href='${request.path}/email/emailAction!delete.action?email.id=${request.receiveEmail.id.email.id}&type=3'">
						</s:else>
						<input type="button" value="彻底删除" onclick="javascript:window.location.href='${request.path}/email/emailAction!delete.action?email.id=${request.receiveEmail.id.email.id}&type=4'">
						
			
									
									
									</div> </td>
								</tr>
								
								
							</table></td>
						<td width="8"
							background="<%=request.getContextPath()%>/main/tab/images/tab_15.gif">&nbsp;</td>
					</tr>
				</table></td>
		</tr>
		<!-- 底部 -->
		<tr>
			<td height="35"
				background="<%=request.getContextPath()%>/main/tab/images/tab_19.gif"><table
					width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="12" height="35"><img
							src="<%=request.getContextPath()%>/main/tab/images/tab_18.gif"
							width="12" height="35" /></td>
						<td width="100%"></td>
						<td width="16"><img
							src="<%=request.getContextPath()%>/main/tab/images/tab_20.gif"
							width="16" height="35" /></td>
					</tr>
				</table></td>
		</tr>
	</table>					
	
	</body>
</html>
