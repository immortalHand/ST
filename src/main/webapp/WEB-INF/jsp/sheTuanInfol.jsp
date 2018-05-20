<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>社团风采介绍</title>



<link rel="stylesheet" href="${pageContext.request.contextPath }/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
<script src="${pageContext.request.contextPath }/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath }/js/script.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/daohang.js"></script>
</head>
<body>

	<%@include file="header.jsp" %>
	<c:if test="${error!=null }">
		<script>
			alert("${error}");
		</script>
	</c:if>

	<!-- 各个社团信息的详细介绍 -->
	<div class="main">
		<div class="main-inner body-width">

			<div class="banner clearfix">
				<div class="slider" id="slider">
					<img src="${pageContext.request.contextPath }/images/cont/slider_img1.jpg">
				</div>
				<div class="banner-info">
					<div class="right">
						<h1> ${stinfo.name }</h1>
						<p class="rightp1">
							<span>成立时间：</span> <fmt:formatDate value="${stinfo.time }" pattern="yyyy-MM-dd"/> 
						</p>
				
						<p class="rightp3">
							<span>会员：</span> ${stinfo.num}名
						</p>
						<div class="rightpdiv">
							${stinfo.info }</div>
						<a href="${pageContext.request.contextPath }/orga/sheShen.do?id=${loginUser.id==null?0:loginUser.id}" class="icon-text__pink purchase"
							style="position:absolute;bottom: 30px; right: 30px; 
						 	line-height: 25px;width: 56px;height: 25px;color: #fff; background-color: #ffbb33;">入会申请</a>
					</div>

				</div>
			</div>

			<div class="main-cont"
				style=" width:1200px ; height: 700px;">

				<div class="jieshao__title">
					<h3>
						<span>${stinfo.name }</span>简介
					</h3>
				</div>
				<div class="main-cont_Info"
					style=" width: 800px ;float: left;margin-left: 30px">
					${stinfo.info }</div>

				<div class="main-cont_Info"
					style=" width: 300px ; height:500px;float: right; 
					margin-right: 30px;position: relative;top: -73px;">
					<h2 style="font-size: 24px;margin-left: -40px; font-weight: bold;line-height: 70px;">历任社长</h2>
					<ul class="shezhangtu" >
						<c:forEach items="${users }" var="v">
							<li><img src="${pageContext.request.contextPath }/upload/${v.img}" alt="${v.name }" title="${v.name }"><br></li>
						</c:forEach>
					</ul>

				</div>
			</div>

		</div>



		<%@include file="footer.jsp" %>

	</div>


</body>



</html>