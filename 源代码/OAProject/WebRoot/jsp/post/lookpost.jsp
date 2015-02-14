<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>My JSP 'shenhepost.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

	</head>
	<script language="javascript" src="js/calendar.js"></script>
	<script type="text/javascript">
	 function testsubmit(){
  var d=new Date();
  var year=d.getFullYear();
  var month=d.getMonth()+1;
  var day=d.getDate();
  if(month<10) month="0" + month
  if(day<10) month="0" + day
  var now=year+"-"+month+"-"+day;
  
   
  
		
		
		var form=document.forms.form1;
		var begindate=form.begindate;
		var enddate=form.enddate;
		
		if(begindate.value>=now){
			alert("生效时间必须小于当前时间");
			return false;
		}
		if(enddate.value<begindate.value){
			alert("失效时间必须大于生效时间");
			return false;
		}
	}	
	function autoshenhe(){
		
		
		
			
			createXMLHttp();
	
			var url = "<%=path%>/post/autoshenheAction.action?date="
			+ new Date().getTime();
			
			XmlHttp.open("get", url, true);
			//指定回调的方法
			XmlHttp.onreadystatechange = function(){
				if (XmlHttp.readyState == 4) {
					if (XmlHttp.status == 200) {
						var text = XmlHttp.responseText;
						
						
					}
				}
			};
			XmlHttp.send();
		
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
	
	
	</script>


	<body onload="autoshenhe()" bgcolor="#efefef">


		<s:form action="postAction!postlist" namespace="/post" name="form1"
			method="post" theme="simple" onsubmit="return testsubmit()">
			<table>
				<tr>
					<td>
						公共标题：
						<s:textfield name="stitle"  />
						
					</td>
					<td>
						发布时间：
						<s:textfield name="begindate"
							onfocus="javascript:{show_cele_date(this,'','',this);}" />
					</td>
					<td>
						到
						<s:textfield name="enddate"
							onfocus="javascript:{show_cele_date(this,'','',this);}" />
					</td>
					<td>
						<s:submit value="查询" />
					</td>
				</tr>
			</table>
		</s:form>
		<a href="post/postAction!postlistread">已读公告</a>

		<a href="post/postAction!postlistnoread">未读公告</a>
		<s:form theme="simple">
			<table   bordercolor="#efefef" bgcolor="#efefef">
			
				<tr bgcolor="#3399FF">
					<td colspan="8" align="center"  background="main/images/tab_05.gif">
						全部公告
					</td>
				</tr>
				<tr bgcolor="#CCCCCC">
					<td width="80" >
						公告标题
					</td>
					<td width="220">
						公告内容
					</td>
					<td width="100">
						生成时间
					</td>
					<td width="100">
						失效时间
					</td>
					<td width="80">
						发布者
					</td>
					<td width="100">
						状态
					</td>
					<td width="100">
						附件信息
					</td>
					<td width="100">
						操作
					</td>
				</tr>
				<s:iterator value="#attr.postlist" var="bean">
					<tr>
						<td onMouseOut="this.bgColor='#efefef';this.borderColor='#efefef'"; onMouseOver="this.bgColor='#cccccc'; this.borderColor='#000033'">
							<s:property value="#bean.stitle" />
						</td>
						<td onMouseOut="this.bgColor='#efefef';this.borderColor='#efefef'"; onMouseOver="this.bgColor='#cccccc'; this.borderColor='#000033'">
							<DIV
								STYLE="width: 200px; height: 20px; overflow: hidden; text-overflow: ellipsis">
								<NOBR>
									<s:property value="#bean.scontentstr" />
								</NOBR>
							</DIV>
						</td>
						<td width="10" onMouseOut="this.bgColor='#efefef';this.borderColor='#efefef'"; onMouseOver="this.bgColor='#cccccc'; this.borderColor='#000033'">
							
							<DIV
								STYLE="width: 70px; height: 20px; overflow: hidden; text-overflow: ellipsis">
								<NOBR>
									<s:property value="#bean.begindate" />
								</NOBR>
							</DIV>
						</td>
						<td onMouseOut="this.bgColor='#efefef';this.borderColor='#efefef'"; onMouseOver="this.bgColor='#cccccc'; this.borderColor='#000033'">
							<DIV
								STYLE="width: 70px; height: 20px; overflow: hidden; text-overflow: ellipsis">
								<NOBR>
									<s:property value="#bean.enddate" />
								</NOBR>
							</DIV>
						</td>
						<td onMouseOut="this.bgColor='#efefef';this.borderColor='#efefef'"; onMouseOver="this.bgColor='#cccccc'; this.borderColor='#000033'">

							<s:property value="#bean.suser" />
						</td>
						<td onMouseOut="this.bgColor='#efefef';this.borderColor='#efefef'"; onMouseOver="this.bgColor='#cccccc'; this.borderColor='#000033'">


							<s:if test="#bean.nstatus==0">
								未审核
							</s:if>
							<s:if test="#bean.nstatus==1">
								通过
							</s:if>
							<s:if test="#bean.nstatus==2">
								未通过
							</s:if>
						</td>
						<td onMouseOut="this.bgColor='#efefef';this.borderColor='#efefef'"; onMouseOver="this.bgColor='#cccccc'; this.borderColor='#000033'">


							<s:if test="#bean.nisfile==0">
								无附件
							</s:if>
							<s:if test="#bean.nisfile==1">
								有附件
							</s:if>

						</td>
						<td onMouseOut="this.bgColor='#efefef';this.borderColor='#efefef'"; onMouseOver="this.bgColor='#cccccc'; this.borderColor='#000033'">
							<s:hidden name="postid1" value="%{#bean.postid}" />
							<input type="button" value="查看"
								onclick="javascript:window.location.href='<%=request.getContextPath()%>/post/postAction!lookpost?postid=${ bean.postid}'" />

						</td>

					</tr>
				</s:iterator>



			</table>
		</s:form>



	</body>
</html>
