<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>社团活动</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
<script src="${pageContext.request.contextPath }/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath }/js/script.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/daohang.js"></script>
</head>
<body>

	<%@include file="header.jsp" %>
	<div class="main">
		<div class="main-inner body-width">
			<div class="main-cont main-recommend" style="margin-top:-30px;">
				<ul class="main-cont__list clearfix">
					<c:forEach items="${actives}" var="v">
						<li class="item"><a href="${pageContext.request.contextPath }/active/ActiveInfo.do?id=${v.id}" class="pic">
						<img src="${pageContext.request.contextPath }/upload/${v.img }" alt="#"></a>
							<div class="info">
								<a href="${pageContext.request.contextPath }/active/ActiveInfo.do?id=${v.id}" class="title">${v.name }</a> <span>${v.address }</span> <a
									href="${pageContext.request.contextPath }/user/addActive.do?id=${v.id}&uid=${loginUser.id==null?0:loginUser.id}" class="icon-text__pink purchase">报名</a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>

		</div>


		<%@include file="footer.jsp" %>

	</div>


</body>



</html>