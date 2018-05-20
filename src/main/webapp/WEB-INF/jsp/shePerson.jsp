<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>社长简介</title>

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
				<div class="main-cont main-user" style="margin-top:-30px;">
        <ul class="main-cont__list clearfix">
	        <c:forEach items="${users}" var="v">
	        	<li class="item" style="margin-top:30px;">
		            <a href="#" class="pic" style=" background: url(images/cont/user_img1.jpg) no-repeat; background-size: cover; "></a>
		            <a href="#" class="headImg"><img src="${pageContext.request.contextPath }/upload/${v.img }" alt="#"></a>
		            <div class="info">
		              <a href="#" class="info-title">${v.name }</a>
		              <p>信息：${v.information }</p>
		              <p><i class="icon-star"></i>${v.organnizationname }社团社长</p>
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