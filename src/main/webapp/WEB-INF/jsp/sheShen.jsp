<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 

"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>申请入会</title>
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
	<c:if test="${error!=null }">
		<script>
			alert("${error}");
		</script>
	</c:if>
	<!--Begin Login Begin-->
	<div class="logsheqing ">
		<div class="top" >
			<!-- <div class="logo">
				<a href="Index.html"><img
					src="images/c187d600baa1cd1112df5ba5b312c8fcc2ce2da0.jpg"
					width="150" height="150" /></a>
			</div> -->
		</div>
		<div class="regist">
			<div class="reg_c" style="height:380px;">
				<form method="post" action="${pageContext.request.contextPath }/orga/addOrgaByUserId.do">
					<table border="0"
						style="width:420px; font-size:14px; margin-top:20px;"
						cellspacing="0" cellpadding="0">
						<tr height="50" valign="top">
							<td width="95">&nbsp;</td>
							<td><span class="fl" style="font-size:24px;">会员申请</span> 
							</td>
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;姓名
								&nbsp;</td>
							<td><input type="text" value="${user.name }" class="l_user" disabled="disabled"/>
								<input type="hidden" value="${loginUser.id}" name="id" />
							</td>
						</tr>
						<tr height="50">
							
							<td align="right"><font color="#ff4e00">*</font>&nbsp;社团名称

								&nbsp;</td>
							<td><!-- <input type="password" value="" class="shenqingming" /> -->
								<select name="organizationid" class="shenqingming" <c:if test="${error!=null }">disabled="disabled"</c:if> >
									<c:forEach items="${shetuans }" var="v">
										<option value="${v.id }"<c:if test="${user.organizationid==v.id }">selected</c:if>  >${v.name }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;学号

								&nbsp;</td>
							<td><input type="text" value="${user.stuno }" class="shenqingban"  disabled="disabled"/></td>
						</tr>
						<tr height="50">
							<td align="right"><font color="#ff4e00">*</font>&nbsp;手机

								&nbsp;</td>
							<td><input type="text" value="${user.phone }" class="l_tel"  disabled="disabled"/></td>
						</tr>
						
						
						<tr height="60">
							<td>&nbsp;</td>
							<td><input type="submit" value="确认入会" class="log_btn" <c:if test="${error!=null }">style="display:none"</c:if>/></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<!--End Login End-->

</body>



</html>

