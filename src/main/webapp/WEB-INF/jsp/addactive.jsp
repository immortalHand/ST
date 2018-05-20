<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>添加活动</title>

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
				<h2 class="biaoti">添加活动</h2>
					<form action="${pageContext.request.contextPath }/active/addactive.do" class="tuanform" method="post" enctype="multipart/form-data">
						<p class="p1">活动名称：<input type="text" name="name" required> </p>
						<p class="p1">活动地址：<input type="text" name="address" required> </p>
						<p class="p1">活动时间：<input type="text" Class="Wdate" id="birthday" name="time" 
							onClick="WdatePicker({el:this,dateFmt:'yyyy-MM-dd'})" required>
						</p>
						<p class="p1">活动简介：<textarea rows="5" cols="20" name="context"></textarea> </p>
						<p class="p1">上传活动图片：<input type="file" name="imgs">
						<p class="p1">所属社团：
						<select id="organizationid" name="organizationid" class="l_pwd" >
							<option value="0">请选择</option>
							<c:forEach items="${orgas }" var="orga">
								<option value="${orga.id}">${orga.name }</option>
							</c:forEach>
						</select>
						</p>
						<p style="width: 400px;">
							<input class="submit1" type="submit" value="添加"  />
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
