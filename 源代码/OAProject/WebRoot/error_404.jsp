<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
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

<title>出错啦</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
#content {
	margin-left: 200px;
	width: 910px;
	padding-top: 50px
}

#top {
	width: 910px;
	height: 80px;
	margin-bottom: 5px
}

#top #top_left {
	width: 400px;
	height: 80px;
	text-align: left;
	float: left
}

#top #top_right {
	width: 510px;
	height: 80px;
	text-align: left;
	float: left
}

#top_bottom {
	width: 910px;
	height: 3px;
	background-color: #2f99e0
}

#middle {
	width: 910px;
	height: 250px;
	margin-top: 5px;
	padding-top: 30px
}

#middle #left {
	width: 260px;
	height: 250px;
	text-align: left;
	float: left
}

#middle #right {
	width: 650px;
	height: 250px;
	text-align: left;
	float: left
}

#bottom {
	width: 910px;
	height: 70px;
}
</style>
</head>

<body>
	<div id="content" align="center">
		<div id="top">
			<div id="top_left">
				<img src="<%=path%>/main/images/main_09.gif" height="70px" width="350px" />
			</div>
			<div id="top_right"></div>

		</div>

		<div id="top_bottom"></div>
		<div id="middle" align="center">
			<div id="left">
				<img src="<%=path%>/main/images/error404.jpg" height="250" width="260" />
			</div>
			<div id="right">

				<h1>&nbsp;&nbsp;&nbsp;&nbsp;对不起哈！您要的页面没有找到...</h1>
				<br /> <br /> <br />

				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;您可以：</p>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1.检查刚才的输入
				</p>
				<p>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.退回上一页重试:<a
						href="javascript:history.go(-1)">点击这里后退</a>
				</p>


			</div>

		</div>

		<div id="bottom"></div>
	</div>
</body>
</html>
