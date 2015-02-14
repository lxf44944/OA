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
    
    <title>修改密码</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script src="<%=path %>/js/jquery-1.4.4.min.js" type="text/javascript"></script>
<script src="<%=path %>/js/formValidator-4.1.3.js" type="text/javascript" charset="UTF-8"></script>
<script src="<%=path %>/js/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
<script language="javascript" src="<%=path %>/js/DateTimeMask.js" type="text/javascript"></script>
   <script type="text/javascript">
	$(document).ready(function(){
		$.formValidator.initConfig({formID:"form1",onError:function(){alert("校验没有通过，具体错误请看错误提示")}});
		$("#oldpassword").formValidator({onShow:"请输入旧密码",onFocus:"旧密码至少3个字符,最多15个字符",onCorrect:"旧密码正确"}).inputValidator({min:3,max:15,onError:"你输入的密码非法,请确认"}).regexValidator({regExp:"username",dataType:"enum",onError:"密码格式不正确"})
	    .ajaxValidator({
		type : "get",
        dataType : "html",
        async : true,
        cache:false,
		url : "<%=path %>/oa/user!checkoldpassword.action",
		success : function(data){
	        if( data == "1" ) return true;
			return "旧密码输入错误";
		},
		buttons: $("#button"),
		error: function(jqXHR, textStatus, errorThrown){alert("服务器没有返回数据，可能服务器忙，请重试"+errorThrown);},
		onError : "旧密码输入错误，请重新输入",
		onWait : "正在对旧密码进行合法性校验，请稍候..."
	});
		$("#password").formValidator({onShow:"请输入新密码",onFocus:"3-15个长度",onCorrect:"密码合法"}).inputValidator({min:3,max:15,empty:{leftEmpty:false,rightEmpty:false,emptyError:"密码两边不能有空符号"},onError:"新密码长度错误,请确认"});
		$("#relpwd").formValidator({onShow:"输再次输入密码",onFocus:"3-15个长度",onCorrect:"密码一致"}).inputValidator({min:3,max:15,empty:{leftEmpty:false,rightEmpty:false,emptyError:"重复密码两边不能有空符号"},onError:"重复密码长度错误,请确认"}).compareValidator({desID:"password",operateor:"=",onError:"2次密码不一致,请确认"});
	});
	</script>
  </head>
  
  <body>
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="main/tab/images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="main/tab/images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="main/tab/images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：[用户用心]-[修改密码]</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="main/tab/images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="main/tab/images/tab_12.gif">&nbsp;</td>
        <td><s:form action="user!updatepwd" id="form1" name="form1" theme="simple" namespace="/oa">
        <table width="700"  border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()" align="center">
         <tr align="center" >
            <div align="center" style="background-image:url('main/tab/images/bg.gif')"><span class="STYLE1">修改密码</span></div>
         </tr>
         <tr>
            <td  bgcolor="#FFFFFF">
              <div align="center">旧密码：</div>
           </td>
            <td  bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><input/ type="password" id="oldpassword" name="oldpassword"></span></div></td>
            <td width="24%"  bgcolor="#FFFFFF"><div id="oldpasswordTip" style="width:280px"></div></td>
         </tr>
         <tr>
            <td  bgcolor="#FFFFFF">
              <div align="center">新密码：</div>
           </td>
            <td  bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><input/ type="password" id="password" name="password"></span></div></td>
           <td bgcolor="#FFFFFF"><div id="passwordTip" style="width:280px"></div></td>
         </tr>
         <tr>
            <td  bgcolor="#FFFFFF">
              <div align="center">确认密码：</div>
           </td>
            <td  bgcolor="#FFFFFF"><div align="center"><span class="STYLE1"><input/ type="password" id="relpwd" name="relpwd"></span></div></td>
            <td bgcolor="#FFFFFF"><div id="relpwdTip" style="width:280px"></div></td>
         </tr>
         <tr align="center">
    	<td colspan="3" bgcolor="#FFFFFF"><input type="submit"  name="button" id="button" value="提交">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="" type="reset" value="重置"></td>
 	    </tr>
        </table>
        </s:form></td>
        <td width="8" background="main/tab/images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
</table>
  </body>
</html>
