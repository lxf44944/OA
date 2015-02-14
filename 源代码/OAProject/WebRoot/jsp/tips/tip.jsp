<%@page import="pojo.TUser"%>
<%@page import="tips.dao.TTipsDAO"%>
<%@page import="pojo.TTips"%>
<%@page
	import="org.springframework.context.support.ClassPathXmlApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	TUser user = (TUser) session.getAttribute("user");
	int userid = user.getUserid();
	
	/*username= session.getAttribute("user");		 */
	String username = user.getUsername();
	
	ApplicationContext context = new ClassPathXmlApplicationContext(
			"applicationContext.xml");
	TTipsDAO dao = (TTipsDAO) context.getBean("TTipsDAO");
	/* TTips tips = dao.findById(id); */
	TTips tips = dao.findById(userid);
	System.out.println("tips:"+tips);
	int isShowPost = tips.getTshowpost();
	int isShowEmail = tips.getTshowemail();
	int isShow = tips.getTisshow();
	int showTime = tips.getShowtime() * 1000;//变为毫秒数
	int postCount = dao.postCount(userid);
	int emailCount = dao.emailCount(username);
	
	/* System.out.println("isShow="+isShow);
	System.out.println("isShowPost="+isShowPost);
	System.out.println("isShowEmail="+isShowEmail);
	System.out.println("showTime="+showTime);  */
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'tip.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<%
	Date date=new Date();
	Calendar c = Calendar.getInstance();
	int i=c.get(Calendar.DAY_OF_WEEK);
	String dayshow=new String();
	switch(i){
		case 1:
		dayshow ="日";
		break;
		case 2:
		dayshow ="一";
		break;
		case 3:
		dayshow ="二";
		break;
		case 4:
		dayshow ="三";
		break;
		case 5:
		dayshow ="四";
		break;
		case 6:
		dayshow ="五";
		break;
		case 7:
		dayshow ="六";
		break;
	}
	request.setAttribute("date",date);
	request.setAttribute("dayshow",dayshow);
%>
<script>
var oPopup = window.createPopup();//创建动态窗口
var popTop=50;
var width=226;
var mytime;
var vshowTime = <%=showTime%>;
var visShow = <%=isShow%>;
var visShowEmail = <%=isShowEmail%>;
var visShowPost = <%=isShowPost%>;
var vpostCount = <%=postCount%>;
var vemailCount = <%=emailCount%>;


//未读邮件和未读公告的数量由数据库读取，并利用AJAX动态变化。
var xmlHttp = null;
function createXmlHttpRequest() {
//alert('create');
	//IE浏览器
	if (window.ActiveXObject) {
		xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
	} else {
		//其他浏览器
		xmlHttp = new XMLHttpRequest();
	}
}


function AjaxCount() {
	createXmlHttpRequest();
	//var suser = document.all.suser.value;
	//拼接url
	var url = "<%=path%>/tips/tipCountAction?userid=<%=userid%>&username=<%=username%>" + "&date="
			+ new Date().getTime();
	//alert(url);
	xmlHttp.open("GET", url, true);
	xmlHttp.onreadystatechange = dealRes;
	xmlHttp.send(null);
}


function dealRes() {
	if (xmlHttp.readyState == 4) {
		if (xmlHttp.status == 200) {
			//获得服务器响应回来的文本
			var text1 = xmlHttp.responseText;
			//alert('text1=' + text1);
			//var suserSp = document.getElementById("suserSp");
			//document.all.spid.innerText=text;
			var text=text1.split(" ");
			vemailCount=text[0];
			vpostCount=text[1];
			//alert(text);
			//document.all.suserSp.innerHTML=text;
			
		}
	}
}

//【注意：在执行下面的js脚本前，要判断是否要显示小贴士，如果不显示，就不执行以下脚本】
//【注意：判断是否要显示小贴士由数据库读取】
if(visShow==1){
	popmsg();//加载该页面即执行该函数，该函数往动态窗口输出内容。
	window.setInterval("popmsg();",vshowTime);//间隔10秒循环执行popmsg()函数，【注意：10秒的间隔数由数据库读取。】
}

function popmsg(){
	AjaxCount();
	var winstr="<table width=\"226\" height=\"151\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" background=\"<%=path%>/jsp/tips/images/taobao_msg.gif\"> "  
	+"<tr>    <td width=\"27\" height=\"20\">&nbsp;</td>  "
	+"  <td width=\"168\">&nbsp;</td>  "
	+"  <td width=\"29\"><div align=\"center\"><img src=\"<%=path%>/jsp/tips/images/close.gif\"  "
				+ "width=\"14\" height=\"13\" id=\"aimgclose\"  style=\"cursor:hand\" onclick=\"\"/></div></td>  </tr>  "
				+ " <tr>    <td width=\"50\" height=\"100\">&nbsp;</td>  "
				+ "  <td><br>		<div align=\"center\" style=\"line-height:22px;\">			<font size=\"2\">		";
		if (visShowEmail == 1) {
			winstr = winstr
					+ " <a href=\"#\" target=\"I1\" id=\"amail\">您有未读邮件 <font color=\"#FF0000\">"+vemailCount+"</font> 封</a> <br /> ";
		}
		if (visShowPost == 1) {
			winstr = winstr
					+ " <a href=\"#\" target=\"I1\" id=\"ameet\">您有未读公告 <font color=\"#FF0000\">"+vpostCount+"</font> 条</a> <br /> ";
		}
		if (visShowPost == 0 && visShowEmail == 0) {
			winstr = winstr
					+ "  <font color=\"#FF0000\">您未设置任何提示项，请点“设置”选择提示项</font> <br /> ";
		}
		winstr = winstr
				+ "	<br />	<a href=\"#\" target=\"I1\" id=\"aset\">设置</a> <a href=\"#\" onclick=\"\" id=\"aclose\">关闭</font></div>		</td>    <td>&nbsp;</td>  </tr>  <tr>    <td height=\"5\">&nbsp;</td>  "
				+ "  <td>&nbsp;</td>    <td>&nbsp;</td>  </tr></table> ";
		oPopup.document.body.innerHTML = winstr;
		popshow();
		popTop = 50;

		//下面两个if是判断是否要显示邮件和公告。以及查看未读邮件和公告的地址。
		//【注意：是否显示邮件和公告由数据库读取】
		if (oPopup.document.getElementById("amail") != null
				&& visShowEmail == 1) {
			oPopup.document.getElementById("amail").onclick = function() {
				parent.mainFrame.I1.location = "<%=path%>/email/emailAction!emaillist.action?type=2";
			}
		}

		if (oPopup.document.getElementById("ameet") != null
				&& visShowEmail == 1) {
			oPopup.document.getElementById("ameet").onclick = function() {
				parent.mainFrame.I1.location = "<%=path%>/post/postAction!postlistnoread";
			}
		}
		if (oPopup.document.getElementById("aset") != null) {
			oPopup.document.getElementById("aset").onclick = function() {
				parent.mainFrame.I1.location = "<%=path%>/jsp/tips/setTips.jsp?showtime=<%=tips.getShowtime()%>&showpost=<%=tips.getTshowpost()%>&isshow=<%=tips.getTisshow()%>&showemail=<%=tips.getTshowemail()%>&userid=<%=tips.getTuserid()%>";
			}
		}
		if (oPopup.document.getElementById("aclose") != null) {
			oPopup.document.getElementById("aclose").onclick = function() {
				popshow();
			}
		}
		if (oPopup.document.getElementById("aimgclose") != null) {
			oPopup.document.getElementById("aimgclose").onclick = function() {
				popshow();
			}
		}

	}

	//这个函数是表示动态弹出窗口的停留时间，基本不会变动
	function popshow() {
	
		window.status = popTop;
		if (popTop > 1720) {
		//alert(popTop);
			clearTimeout(mytime);
			oPopup.hide();
			popTop = 50;
			return;
		} else if (popTop > 1520 && popTop < 1720) {
			oPopup.show(screen.width - 260, screen.height + 30, width,
					1720 - popTop - 20);
		} else if (popTop > 1500 && popTop < 1720) {
			oPopup.show(screen.width - 260, screen.height + 30
					+ (popTop - 1720), width, 152);
		} else if (popTop < 180) {
			oPopup.show(screen.width - 260, screen.height + 30, width,
					popTop - 20);
		} else if (popTop < 220) {
			oPopup.show(screen.width - 260, screen.height + 30 - popTop, width,
					152);
		}
		popTop += 10;
		mytime = setTimeout("popshow();", 20);
		
	}
	
</script>

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

.STYLE2 {
	font-size: 9px
}

.STYLE3 {
	color: #033d61;
	font-size: 12px;
}
-->
</style>
</head>

<body>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td height="70" background="<%=path%>/main/images/main_05.gif"><table
					width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="24"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="270" height="24"
										background="<%=path%>/main/images/main_03.gif">&nbsp;</td>
									<td width="505" background="<%=path%>/main/images/main_04.gif">&nbsp;</td>
									<td>&nbsp;</td>
									<td width="21"><img
										src="<%=path%>/main/images/main_07.gif" width="21" height="24">
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="38"><table width="100%" border="0"
								cellspacing="0" cellpadding="0">
								<tr>
									<td width="270" height="38"
										background="<%=path%>/main/images/main_09.gif">&nbsp;</td>
									<td><table width="100%" border="0" cellspacing="0"
											cellpadding="0">
											<tr>
												<td width="77%" height="25" valign="bottom"><table
														width="100%" border="0" cellspacing="0" cellpadding="0">
														<tr>
															<td width="50" height="19"><div align="center">
																	<a href="<%=path%>/oa/user!dotag" target="I1"><img src="<%=path%>/main/images/main_12.gif" width="49"
																		height="19"  border="0"></a>
																</div>
															</td>
															<td width="50"><div align="center">
																	<a onclick="history.go(-1);" target="I1"><img src="<%=path%>/main/images/main_14.gif" width="48"
																		height="19" border="0"></a>
																</div>
															</td>
															<td width="50"><div align="center">
																	<a onclick="history.go(1);" target="I1"><img src="<%=path%>/main/images/main_16.gif" width="48"
																		height="19" border="0"></a>
																</div>
															</td>
															<td width="50"><div align="center">
																	<a onclick="window.parent.location.reload();" ><img src="<%=path%>/main/images/main_18.gif" width="48"
																		height="19" border="0"></a>
																</div>
															</td>
															<td width="50"><div align="center">
																	<a href="<%=path%>/oa/userlogin!quit" target="_top"><img src="<%=path%>/main/images/main_20.gif" width="48"
																		height="19" border="0"></a>
																</div>
															</td>
															<td width="26"><div align="center">
																	<img src="<%=path%>/main/images/main_21.gif" width="26"
																		height="19"  border="0">
																</div>
															</td>
															<td width="100"><div align="center">
																	<a href="<%=path%>/oa/user!onlyUpdateview" target="I1"><img src="<%=path%>/main/images/main_22.gif" width="98"
																		height="19"  border="0"></a>
																</div>
															</td>
															<td>&nbsp;</td>
														</tr>
													</table>
												</td>
												<td width="220" valign="bottom" nowrap="nowrap"><div
														align="right">
														<span class="STYLE1"><span class="STYLE2">■</span>当前用户：<s:property value="#session.user.username"/>
														</span>
													</div>
												</td>
												<td width="220" valign="bottom" nowrap="nowrap"><div
														align="right">
														<span class="STYLE1"><span class="STYLE2">■</span><s:date name="#request.date" format="yy年MM月dd日"/>星期${dayshow }
														</span>
													</div>
												</td>
											</tr>
										</table>
									</td>
									<td width="21"><img
										src="<%=path%>/main/images/main_11.gif" width="21" height="38">
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="8" style=" line-height:8px;"><table width="100%"
								border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="270" background="<%=path%>/main/images/main_29.gif"
										style=" line-height:8px;">&nbsp;</td>
									<td width="505" background="<%=path%>/main/images/main_30.gif"
										style=" line-height:8px;">&nbsp;</td>
									<td style=" line-height:8px;">&nbsp;</td>
									<td width="21" style=" line-height:8px;"><img
										src="<%=path%>/main/images/main_31.gif" width="21" height="8">
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</td>
		</tr>
		
	</table>
</body>

</html>
