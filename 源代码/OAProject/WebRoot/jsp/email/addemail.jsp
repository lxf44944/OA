<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib uri="http://java.fckeditor.net" prefix="FCK"%>
<% request.setAttribute("path", request.getContextPath()); %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>写信</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%	if(request.getParameter("mode")!=null && !"".equals(request.getParameter("mode"))){
			pageContext.setAttribute("mode", request.getParameter("mode"));
		}
		if(request.getParameter("receiveUserNames")!=null && !"".equals(request.getParameter("receiveUserNames"))){
			pageContext.setAttribute("receiveUserNames", request.getParameter("receiveUserNames"));
		}
		if(request.getParameter("title")!=null && !"".equals(request.getParameter("title"))){
			pageContext.setAttribute("title", request.getParameter("title"));
		}
	%>
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
select.STYLESELECT {
	height: 500px;
	width: 200px;
	border:1px solid blue;
	size: 25
}

</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/prototype.js"></script>
		<SCRIPT type="text/javascript">
		//json
		function userAjax() {
	//prototype.js ajax功能
	var nameKey = document.getElementById("nameKeyId").value;
	var url = "<%=request.getContextPath()%>/userjson/jsonAction.action?date=" + new Date().getTime();	
	var pars = "nameKey=" + nameKey;
	var myAjax = new Ajax.Request(url, {
		method : 'get',
		parameters : pars,
		onComplete : dealResponse
	});
}

function dealResponse(myRequest) {
	var text = myRequest.responseText;
	var select = document.getElementById("userselect");
	select.length=0;
	//jSON格式的字符串转换成 JSON对象
	var json = text.evalJSON();
	//$("sname").value = json.userBean.sid;
	//list进行迭代

	for(var i=0;i< json.users.length;i++){
		var option = new Option(json.users[i],json.users[i]);
		select.add(option);
		
	}


}
		
		
		
		
		
		
		
		//附件
		function addMore(){
			var tbody = document.getElementById("tbody");
			var trs = tbody.childNodes;
			if(trs.length>=3){
				alert("附件只能是3个，您当期附件已经是3个，请删除其中一些附件");
			}else{
				var tr = document.createElement("tr");
			var td = document.createElement("td");
			var input = document.createElement("input");
			var button = document.createElement("input");
			var br = document.createElement("br");
			input.type = "file";
			input.name="emailFile";
			//设置文件域内容是否可以编辑
			input.contentEditable="false";
			button.type = "button";
			button.value = "删除附件";
			//匿名内部函数
			button.onclick = function(){
				//方法里面可以直接调用上面定义的变量
				tbody.removeChild(tr);
				
			};
	
			td.appendChild(input);
			td.appendChild(button);
			td.appendChild(br);
			tr.appendChild(td);
			tbody.appendChild(tr);
				
			}		
		}	
		function selectReceive(userName){
			var receiveUser = document.forms[0].receiveUserNames;
			var values = receiveUser.value;
			if(values==null || values==""){
				values = userName + ";";
			}else if(values.indexOf(userName+";")==0){
				values = values.replace(eval("/" + userName + ";/"), "");
			}else if(values.match(eval("/;" + userName + ";/")) != null){
				//values.replace("/" + userName + ";/g", ""));
				values = values.replace(eval("/;" + userName + ";/"), ";");
			}else{
				values = values + userName + ";";
			}
			receiveUser.value = values;
		}
		
		function check(){
			var receiveUser = document.forms[0].receiveUserNames;
			var values = receiveUser.value;
			if(values==null || values==""){
				alert("请选择收件人");
				return false;
			}else{
				return true;
			}	
		}
		//获取文件值 验证上传文件大小   浏览器禁止操作ActiveXObject  无法实现
		/* function getFileValue(){
			alert("sss");
			var tbody = document.getElementById("tbody");
			var trs = tbody.childNodes;
			alert(trs.length);
			for(i=0;i<trs.length;i++){
				var filespec = trs[i].childNodes[0].childNodes[0].value;
				if(filespec!="" && filespec!=null){
					if(!ShowFolderSize(filespec)){						
						return false;
					}				
				}			
			}					
			return true;	
		}
		//验证文件大小
		function ShowFolderSize(filespec){   
		   var fso, f;   
		   var maxsize=5242880;//定义允许文件的大小，此为5M   
		   fso = new ActiveXObject("Scripting.FileSystemObject");  
		   f = fso.GetFolder(filespec); 
		   alert(filespec + "=" +f.size);    
		   if(f.size>maxsize) {   
		   		alert("文件" + filespec + "大小超出规定，请您选择小于5M的文件进行上传");   
				return false;   
		   }   
		   return true;   
		}  */  
		
		
		function formSubmit(value){
			var form = document.forms[0];
			if(value=="发送"){
				if(!check()){
					return;
				}				
				form.action="${request.path}/email/emailAction!${email.id>0?'update':'add'}.action?type=1";
				form.submit();
			}else if(value=="存草稿" || value=="保存"){
				form.action="${request.path}/email/emailAction!${email.id>0?'update':'add'}.action?type=0";
				form.submit();
			}
			
		}
		
		//ajax代码
		var XmlHttp = null;
	function createXMLHttp() {
	if (window.ActiveXObject) {
		XmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	} else if (window.XMLHttpRequest) {
		XmlHttp = new XMLHttpRequest();
	}
}
		
		
		function deletePostFile(fileid){
			var tbody = document.getElementById("tbody");
			var tr = document.getElementById("tr"+nfileid);
			createXMLHttp();
	
			var url = "<%=request.getContextPath()%>/email/emailAction!ajaxDeleteFile.action?fileid="+fileid+"&date="
			+ new Date().getTime();
			XmlHttp.open("get", url, true);
			//指定回调的方法
			XmlHttp.onreadystatechange = function(){
				if (XmlHttp.readyState == 4) {
					if (XmlHttp.status == 200) {
						var text = XmlHttp.responseText;
						if (text == 1) {
							tbody.removeChild(tr);
							alert("删除附件成功");
						}else{
							alert("删除附件失败");
						}
					}
				}
			};
			XmlHttp.send();		
		}
		
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
						<td width="95%"><span class="STYLE3">你当前的位置</span>：[<a
							class="ACLASS"
							href="<%=request.getContextPath()%>/email/emailAction.action">邮件中心</a>]-[写信]</td>

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
						<td><table width="100%" border="0" cellpadding="0"
								cellspacing="0" bgcolor="#FFFFFF">
								<tr><td >
									<s:form   method="POST"
			enctype="multipart/form-data" theme="simple" onsubmit="return check();">
			<s:hidden name="email.id"/>
			<table border="0" border="0" cellpadding="0" cellspacing="0" width="80%" align="center">
			<tr>
					<td align="left" width="70%">
						<br>
						收件人：<br/><s:textfield  name="receiveUserNames" maxLength="300" size="150" readonly="true"/>
						
					</td>
					<s:if test="#attr.mode!='reply'">
					<td rowspan="3" valign="top" width="30%" align="center">
						<br><br><br><br><br>
						<h3>用户列表</h3>						
						<div align="center" style="height: 500px;width: 200px;">
						<input type="text" size="15" id="nameKeyId">&nbsp; <input type="button" value="查询" onclick="userAjax();">
						<br><br>
							<select style="height: 500px;width: 200px;border:1px solid blue;font-size: 15px;font-weight: bold;" size="25"  id="userselect" onclick="selectReceive(this.value);"></select>
						
						</div>						
						
						
					</td>
					</s:if>
				</tr>
				<tr>
					<td align="left">
						<br>
						主&nbsp;&nbsp;&nbsp;&nbsp;题：<br/><s:textfield  name="email.title" maxLength="300" size="150"/>
						<br />
					</td>
				</tr>
				<tr>
					<td align="left">
						 <br><br><FCK:editor instanceName="email.content"  height="500" value="${email.content}" /> 
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="添加更多附件" onclick="addMore();" />
						<br>
						<!-- 附件列表 -->
						<table width="100%" border="1" bgcolor="#CCFFFF">
							<tbody id="tbody">
								<s:if test="email == null || email.emailFiles.size()==0">
									<tr>
									<td>
										<s:file label="选择上文件1" name="emailFile"></s:file>
									</td>
								</tr>
								</s:if>
							
								<s:iterator value="email.emailFiles">
									<tr id="tr${id}" >
										<td>
											<s:property value="oldname" />
											&nbsp;
											<input type="button"
												onclick="deletePostFile(${id})" value="删除附件" />&nbsp;&nbsp;
											<input type="button" value="下载" onclick="javascript:window.location.href='${request.path}/email/emailDownLoadAction.action?fileId=${id}'">
											
										</td>

									</tr>

								</s:iterator>

							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" value="发送" onclick="formSubmit(this.value);">
						<input type="button" value="${email.id>0?'保存':'存草稿'}" onclick="formSubmit(this.value);">
						<input type="button" value="关闭" onclick="javascript:window.location.href=document.referrer;">
					</td>
				</tr>
			</table>
		</s:form></td>
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
	<script type="text/javascript">
		function receiveName(){
			var title = document.getElementsByName("email.title")[0];
			var receiveUser = document.forms[0].receiveUserNames;
			var text = "${mode}";
			if(text=="reply"){
				receiveUser.value = "${receiveUserNames};";
				title.value = "(回复)${title}"
			}
		}
		receiveName();
		userAjax();
		
		
	</script>
</html>
