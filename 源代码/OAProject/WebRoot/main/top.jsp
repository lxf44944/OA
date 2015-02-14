<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="/struts-tags" prefix="s"%>
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
}
.STYLE1 {
	font-size: 12px;
	color: #FFFFFF;
}
.STYLE2 {font-size: 9px}
.STYLE3 {
	color: #033d61;
	font-size: 12px;
}
-->
</style>
<script type="text/javascript">
	function quit(){
		if(confirm("是否退出系统")){
			alert("aaa");
			location.href="<%=path%>/oa/userlogin!quit";
		}
	}	
</script>
</head>

<body>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="70" background="main/images/main_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="24"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="270" height="24" background="main/images/main_03.gif">&nbsp;</td>
            <td width="505" background="main/images/main_04.gif">&nbsp;</td>
            <td>&nbsp;</td>
            <td width="21"><img src="main/images/main_07.gif" width="21" height="24"></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="38"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="270" height="38" background="main/images/main_09.gif">&nbsp;</td>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="77%" height="25" valign="bottom"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="50" height="19"><div align="center"><a href="<%=path %>/user!dotag" target="I1"><img src="main/images/main_12.gif" width="50" height="19"></a><</div></td>
                    <td width="50"><div align="center"><a onclick="history.go(-1);"  target="I1"><img src="main/images/main_14.gif" width="48" height="19"></a></div></td>
                    <td width="50"><div align="center"><a onclick="history.go(1);" target="I1"><img src="main/images/main_16.gif" width="48" height="19" ></a></div></td>
                    <td width="50"><div align="center"><a onclick="window.parent.location.reload();" target="I1"><img src="main/images/main_18.gif" width="48" height="19" ></a></div></td>
                    <td width="50"><div align="center"><a href="<%=path %>/oa/userlogin!quit" target="_top" ><img src="main/images/main_20.gif" width="48" height="19"></a></div></td>
                    <td width="26"><div align="center"><img src="main/images/main_21.gif" width="26" height="19"></div></td>
                    <td width="100"><div align="center"><a href="<%=path %>/oa/user!onlyUpdateview" target="I1"><img src="main/images/main_22.gif" width="98" height="19"></a></div></td>
                    <td>&nbsp;</td>
                  </tr>
                </table></td>
                <td width="220" valign="bottom"  nowrap="nowrap"><div align="right"><span class="STYLE1"><span class="STYLE2">■<span class="STYLE1">日期：<s:date name="#request.date" format="yy年MM月dd日"/>  星期${dayshow }</span></div></td>
              </tr>
            </table></td>
            <td width="21"><img src="main/images/main_11.gif" width="21" height="38"></td><a></a>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="8" style=" line-height:8px;"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="270" background="main/images/main_29.gif" style=" line-height:8px;">&nbsp;</td>
            <td width="505" background="main/images/main_30.gif" style=" line-height:8px;">&nbsp;</td>
            <td style=" line-height:8px;">&nbsp;</td>
            <td width="21" style=" line-height:8px;"><img src="images/main_31.gif" width="21" height="8"></td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="28" background="main/images/main_36.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="177" height="28" background="main/images/main_32.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="20%"  height="22">&nbsp;</td>
            <td width="59%" valign="bottom"><div align="center" class="STYLE1">当前用户：<s:property value="#session.user.username"/></div></td>
            <td width="21%">&nbsp;</td>
          </tr>
        </table></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="65" height="28"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="23" valign="bottom"><table width="58" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr> 
                    <td height="20" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(main/images/bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#a6d0e7'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"> <div align="center" class="STYLE3">业务中心</div></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
           <s:iterator value="#session.menuList.{? #this.pid != 0}" var="min">
              <td width="3"><img src="images/main_34.gif" width="3" height="28"></td>
            <td width="63"><table width="58" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="20" style="cursor:hand" onMouseOver="this.style.backgroundImage='url(main/images/bg.gif)';this.style.borderStyle='solid';this.style.borderWidth='1';borderColor='#a6d0e7'; "onmouseout="this.style.backgroundImage='url()';this.style.borderStyle='none'"><div align="center" class="STYLE3"><A href="<%=path %>/oa/${link }" target=I1><s:property value="#min.menuname"/></A></div></td>
              </tr>
            </table></td>
           </s:iterator>
            <td>&nbsp;</td>
          </tr>
        </table></td>
        <td width="21"><img src="main/images/main_37.gif" width="21" height="28"></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
