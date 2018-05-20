<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>社团风采</title>

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
   		<div class="main-inner body-width" >
   			<div class="main-cont main-album" style="margin-top:-30px;">
        <ul class="main-cont__list clearfix">
        <c:forEach items="${shetuans }" var="v">
        	<li class="item" style="margin-top:30px;">
	            <a href="${pageContext.request.contextPath }/orga/sheTuanInfol.do?id=${v.id}" class="pic"><img src="${pageContext.request.contextPath }/upload/${v.img }" alt="#"></a>
	            <div class="info">
					<a href="${pageContext.request.contextPath }/orga/sheTuanInfol.do?id=${v.id}" class="title">${v.name }</a>
					<p><fmt:formatDate value="${v.time }" pattern="yyyy-MM-dd"/> 创立,社团大约${v.num }人</p>
					<%-- <p>
						by <a href="#" class="author">${ }</a>
					</p> --%>
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