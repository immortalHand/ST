<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 

"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册</title>
 <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/reset.css">
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/index.css">
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
  <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/Regist.css" />
 <script src="${pageContext.request.contextPath }/js/jquery-1.12.4.js"></script>
  <script src="${pageContext.request.contextPath }/js/script.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/daohang.js"></script>

</head>
<body>
	
	<!-- header  begin-->
	 <%@include file="header.jsp" %>
<!-- header  end-->
	
	<!--Begin Login Begin-->
	<div class="log_bg">
		<div class="top">
			<!-- <div class="logo">
				<a href="Index.html"><img
					src="images/c187d600baa1cd1112df5ba5b312c8fcc2ce2da0.jpg"
					width="150" height="150" /></a>
			</div> -->
		</div>
		<div class="regist">
			<div class="reg_c">
				<form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/user/updateUser.do">
					<table border="0"
						style="width:420px; font-size:14px; margin-top:20px;"
						cellspacing="0" cellpadding="0">
						<input type="hidden" name="id" value="${user.id }"></input>
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;用户名
								&nbsp;</td>
							<td><input type="text"class="l_user" name="name" required value="${user.name }"/></td>
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;密码

								&nbsp;</td>
							<td><input type="password" id="pw1" class="l_pwd" name="password" required value="${user.password }"/></td>
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;手机

								&nbsp;</td>
							<td><input type="text"  class="l_tel" name="phone" required value="${user.phone }"/></td>
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;学号
								&nbsp;</td>
							<td><input type="text" id="stuno" class="l_user" name="stuno" required onblur="loginStuno()" value="${user.stuno }"/></td>
						</tr>
						<tr height="60">
							<td>&nbsp;</td>
							<td><input type="submit" value="修改" class="log_btn" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<!--End Login End-->

</body>



</html>
