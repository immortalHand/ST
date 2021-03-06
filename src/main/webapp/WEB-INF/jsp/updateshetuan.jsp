<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>修改社团</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/reset.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/index.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/style.css">
  <script src="${pageContext.request.contextPath }/statics/js/jquery-1.12.4.js"></script>
  <script src="${pageContext.request.contextPath }/statics/js/script.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/daohang.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/statics/My97DatePicker/WdatePicker.js"></script>
</head>



<body>
	<%@include file="header.jsp" %>



<div class="main">
		<div class="main-inner body-width" style="padding-top: 100px">
	<div class="i_bg bg_color">
		<!--Begin 用户中心 Begin -->
		<div class="m_content">
			<%@include file="left.jsp" %>

			<div class="m_right">
				<h2 class="biaoti">修改社团</h2>
					<form action="${pageContext.request.contextPath }/orga/updateOrga.do" class="tuanform" method="post">
						<input type="hidden" name="id" value="${st.id }">
						<p class="p1">社团名称：<input type="text" name="name" value="${st.name }" required> </p>
						<p class="p1">社团人数：<input type="text" name="num" value="${st.num }" required> </p>
						<p class="p1">创建时间：<input type="text" Class="Wdate" id="birthday" name="time" 
							onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})"
							value="<fmt:formatDate value="${st.time }" pattern="yyyy-MM-dd"/>" required>
						</p>
						<p class="p1">社团简介：<textarea rows="5" cols="20" name="info">${st.info}</textarea> </p>
						
						<p style="width: 400px;">
							<input class="submit1" type="submit" value="修改"  />
							<input class="submit2" type="reset" value="重置"  />
						 </p>
					</form>
				
				
			</div>

		</div>

	</div>
	</div>
	<%@include file="footer.jsp" %>

	</div>

</body>
</html>
