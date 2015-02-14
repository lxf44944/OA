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
    
    <title>菜单修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="<%=path%>/js/jquery-1.4.4.min.js" type="text/javascript"></script>
		<script src="<%=path%>/js/formValidator-4.1.3.js"
			type="text/javascript" charset="UTF-8"></script>
		<script src="<%=path%>/js/formValidatorRegex.js"
			type="text/javascript" charset="UTF-8"></script>
		<script language="javascript" src="<%=path%>/js/DateTimeMask.js"
			type="text/javascript"></script>
		<script type="text/javascript">
	$(document).ready(
			function() {
				$.formValidator.initConfig({
					formID : "form1",
					onError : function() {
						alert("校验没有通过，具体错误请看错误提示")
					}
				});

				$("#menuname").formValidator({
					onShow : "请输入菜单名称",
					onFocus : "菜单名称至少要输入2个汉字",
					onCorrect : "该菜单名可以注册"
				}).inputValidator({
					min : 4,
					onError : "你输入的菜单名非法,请确认"
				}).regexValidator({
					regExp : "chinese",
					dataType : "enum",
					onError : "菜单名格式不正确"
				}).ajaxValidator(
						{
							type : "post",
					        dataType : "html",
					        async : true,
					        cache:false,
							other:{"pname":"pid","pv":"bigmid"},
							contentType:"application/x-www-form-urlencoded;charset=utf-8",
							url : "<%=path %>/oa/menu!checkMenuname.action?menuid=2",
							success : function(data) {
								if (data == "0")
									return true;
								return "该菜单名不可用，请更换菜单名";
							},
							buttons : $("#button"),
							error : function(jqXHR, textStatus, errorThrown) {
								alert("服务器没有返回数据，可能服务器忙，请重试" + errorThrown);
							},
							onError : "该菜单名不可用，请更换菜单名",
							onWait : "正在对菜单名进行合法性校验，请稍候..."
						});
				$("#link").formValidator({
					onShow : "请在双斜杠后加上链接",
					onFocus : "链接至少3个字符,最多100个字符",
					onCorrect : "谢谢你的配合"
				}).inputValidator({
					min : 3,
					max : 100,
					onError : "你输入的链接非法,请确认"
				});

			});
</script>
  </head>
  
  <body>
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="15" height="30"><img src="main/tab/images/tab_03.gif" width="15" height="30" /></td>
        <td width="1101" background="main/tab/images/tab_05.gif"><img src="main/tab/images/tb.gif" width="16" height="16" /> <span class="STYLE4">你当前的位置:[<a href="<%=path %>/oa/menulist!view">菜单管理</a>]-[<a href="<%=path %>/oa/menu!init">菜单添加</a>]</span></td>
        <td width="281" background="main/tab/images/tab_05.gif"><table border="0" align="right" cellpadding="0" cellspacing="0">
		        </table></td>
        <td width="14"><img src="main/tab/images/tab_07.gif" width="14" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
  		<s:form action="menu!saveOrUpdate" name="form1" id="form1" theme="simple" namespace="/oa">
			<table width="680" height="150px" align="center" border="1">
				<s:hidden name="menuid"></s:hidden>
				<tr>
					<td width="200">
						父类别名称：
					</td>
					<td width="200">
					<s:if test="menuid>0">
						<s:if test="pid==0">
							<s:select id="bigmid" list="#{'0':'无'}" name="pid"></s:select>
						</s:if>
						<s:else>
							<s:select id="bigmid" list="menulist.{? #this.pid==0}" name="pid"
							headerKey="0" headerValue="无" listKey="menuid" listValue="menuname">
							</s:select>
						</s:else>
					</s:if>
					<s:else>
						<s:select id="bigmid" list="menulist.{? #this.pid==0}" name="pid"
							headerKey="0" headerValue="无" listKey="menuid" listValue="menuname">
						</s:select>
					</s:else>
					</td>
					<td>
						<div id="pidTip" style="width: 280px">
					</td>
				</tr>
				<tr>
					<td>
						菜单名称：
					</td>
					<td>
						<s:textfield name="menuname" id="menuname"></s:textfield>
					</td>
					<td>
						<div id="menunameTip" style="width: 280px"></div>
					</td>
				</tr>
				<tr>
					<td>
						菜单链接：
					</td>
					<td>
						<s:textfield name="link" id="link" value="//"></s:textfield>
					</td>
					<td>
						<div id="linkTip" style="width: 280px">
					</td>
				</tr>

				<tr>
					<td colspan="3" align="center">
						<s:submit value="%{menuid>0?'修改':'添加'}"></s:submit>
						<input type="button" value="返回" onclick="history.go(-1);" />
					</td>

				</tr>
			</table>
		</s:form>
  </tr>
  </table>
  </body>
</html>
