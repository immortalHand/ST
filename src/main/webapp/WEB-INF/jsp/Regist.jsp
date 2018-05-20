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
	<script>
		 function loginStuno(){
			var v = $("#stuno").val();
			$.ajax({
				type:'post',
				url:'${pageContext.request.contextPath }/user/loginStuno.do',
				data:'stuno='+v,
				datatype:'text',
				success:function(data){
					if(data!=2){
						$("#stuno").val("");
						alert("此学号已被注册");
					}
				}
			});
		} 
		
		function passwordtwo(){
			var v1 = $("#pw1").val();
			var v2 = $("#pw2").val();
			if(v1 != v2){
				$("#pw2").val("");
				alert("两次密码不同，请重新输入！");
			}
		}
	</script>

</head>
<body>

				<c:if test="${error!=null }">
					<script>
						alert("${error}");
					</script>
				</c:if>
	
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
				<form method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/user/addUser.do">
					<table border="0"
						style="width:420px; font-size:14px; margin-top:20px;"
						cellspacing="0" cellpadding="0">
						<tr height="50" valign="top">
							<td width="95">&nbsp;</td>
							<td><span class="fl" style="font-size:24px;">注册</span> <span
								class="fr"><a href="${pageContext.request.contextPath }/user/dologin.do" style="color:#FF4466;">我要登录</a></span>
							</td>
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;用户名
								&nbsp;</td>
							<td><input type="text" value="" class="l_user" name="name" required/></td>
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;密码

								&nbsp;</td>
							<td><input type="password" id="pw1" value="" class="l_pwd" name="password" required/></td>
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;确认密码

								&nbsp;</td>
							<td><input type="password" id="pw2" value="" class="l_pwd" required onblur="passwordtwo()"/></td>
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00"></font>&nbsp;社团

								&nbsp;</td>
							<td>
								<select id="organizationid" name="organizationid" class="l_pwd" >
									<option value="0">请选择</option>
									<c:forEach items="${orgas }" var="orga">
										<option value="${orga.id}">${orga.name }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;手机

								&nbsp;</td>
							<td><input type="text" value="" class="l_tel" name="phone" required/></td>
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;学号
								&nbsp;</td>
							<td><input type="text" id="stuno" value="" class="l_user" name="stuno" required onblur="loginStuno()"/></td>
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00"></font>&nbsp;个人信息
								&nbsp;</td>
							<td><textarea rows="3" cols="40" name="information"></textarea></td>
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;头像
								&nbsp;</td>
							<td><input type="file" value="" class="l_user" name="header" required/></td>
						</tr>
						<!-- <tr height="50">
							<td align="right">邀请人会员名 &nbsp;</td>
							<td><input type="text" value="" class="l_mem" /></td>
						</tr>
						<tr height="50">
							<td align="right">邀请人ID号 &nbsp;</td>
							<td><input type="text" value="" class="l_num" /></td>
						</tr> -->
						
						<tr height="60">
							<td>&nbsp;</td>
							<td><input type="submit" value="立即注册" class="log_btn" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<!--End Login End-->

</body>



</html>
