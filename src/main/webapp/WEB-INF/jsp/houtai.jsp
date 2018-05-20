<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>后台</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/reset.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/index.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/style.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/Regist.css" />
<script src="${pageContext.request.contextPath }/statics/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/script.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/daohang.js"></script>

  </head>
  
  <body>
    <%@ include file="header.jsp"%>
    <div class="main">
		<div class="main-inner body-width" style="padding-top: 100px">
	<div class="i_bg bg_color">
		<!--Begin 用户中心 Begin -->
		<div class="m_content">
			<%@ include file="left.jsp"%>

			<div class="m_right">
				<div class="huanying" >
					<img  alt="" src="${pageContext.request.contextPath }/statics/images/clock.jpg">
					<h2>${loginUser.name}</h2>
					<span>欢迎来到后台管理中心</span>
				</div>

			</div>

		</div>

	</div>
	</div>
		<%@ include file="footer.jsp"%>

	</div>

    
  </body>
</html>
