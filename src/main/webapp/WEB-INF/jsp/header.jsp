<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<header class="header">
    <div class="header-inner body-width">
      <a href="${pageContext.request.contextPath }/index.do" class="logo"><img src="${pageContext.request.contextPath }/images/c187d600baa1cd1112df5ba5b312c8fcc2ce2da0.jpg" width= "70px" height="70px" /></a>
      <ul class="headerul">
		   <li><a href="${pageContext.request.contextPath }/index.do">首页</a></li>
		   	<li><a href="${pageContext.request.contextPath }/orga/all.do">社团风采</a></li>
		   	<li><a href="${pageContext.request.contextPath }/active/all.do">社团活动</a></li>
		   	<li><a href="${pageContext.request.contextPath }/user/all.do">社长简介</a></li>
		   	<li><a href="${pageContext.request.contextPath }/orga/sheShen.do?id=${loginUser.id==null?0:loginUser.id}">入会申请</a></li>
	   </ul>
      <nav class="header-nav">
        <ul>
          <li>
            <span class="line"></span>
            <a href="#" class="dreamer"><c:if test="${loginUser.name!=null }">${loginUser.name},</c:if>你好</a>
           <!--  <i class="icon-text__pink icon-new">new</i> -->
          </li>
          <li>
            <span class="line"></span>
            <a href="${pageContext.request.contextPath }/user/dologin.do"><c:if test="${loginUser.name==null }">登录</c:if><c:if test="${loginUser.name!=null }">注销</c:if></a>
          </li>
          <li>
            <span class="line"></span>
            <a href="${pageContext.request.contextPath }/orga/Regist.do" class="icon-text__pink register">注册</a>
          </li>
          <li>
            <span class="line"></span>
            
            <c:if test="${loginUser.name!=null && loginUser.type<3 }"><a href="${pageContext.request.contextPath }/houtai.do" class="app">后台管理</a></c:if>
            
          </li>
        </ul>
      </nav>
    </div>
    <div class="header-shadow"></div>
  </header>
</body>
</html>