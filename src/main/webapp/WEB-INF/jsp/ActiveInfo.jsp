<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>社团活动介绍</title>



<link rel="stylesheet" href="${pageContext.request.contextPath }/css/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
<script src="${pageContext.request.contextPath }/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath }/js/script.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/daohang.js"></script>
</head>
<body>

	
	<%@include file="header.jsp" %>
	
	<!-- 信息的介绍 -->
	<div class="main">
		<div class="main-inner body-width">

			<div class="banner clearfix">
				<div class="slider" id="slider">
					<img src="${pageContext.request.contextPath }/images/cont/slider_img1.jpg">
				</div>
				<div class="banner-info">
					<div class="right" >
						<h1>活动详情</h1>
						<p class="rightp1">
							<span>主题：</span> ${active.name }
						</p>
						<p class="rightp2">
							<span>时间：</span> ${active.time }
						</p>
						<p class="rightp3">
							<span>地点：</span> ${active.address }
						</p>
						<div class="rightpdiv">
							${active.context }
						</div>
						 <a href="${pageContext.request.contextPath }/user/addActive.do?id=${active.id}&uid=${loginUser.id==null?0:loginUser.id}" class="icon-text__pink purchase" style="position:absolute;bottom: 30px; right: 30px; 
						 	line-height: 25px;width: 56px;height: 25px;color: #fff; background-color: #ffbb33;">报名</a>
					</div>

				</div>
			</div>
			
			 <div class="main-cont" >
       			 <div class="jieshao__title">
         			 <h3>活动介绍</h3>
          		</div>
          		<div class="main-cont_Info">
          			${active.context }
          		</div>
			</div>
		</div>



		<%@include file="footer.jsp" %>

	</div>


</body>



</html>