<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>添加社团</title>
    
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/reset.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/index.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/style.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/Regist.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/script.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/daohang.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/my.js"></script>

<%-- <script type="text/javascript" 
src="${pageContext.request.contextPath }/My97DatePicker/WdatePicker.js"></script> --%>
<script type="text/javascript">
  	function deluser(id){
  		if(confirm("确定删除？")){
  			location.href="${pageContext.request.contextPath }/user/deluser.do?id="+id;
  		}
  	}
  </script>

  </head>
  
  <body>
    <%@ include file="header.jsp"%>
    <div class="main">
		<div class="main-inner body-width" style="padding-top: 100px">
	<div class="i_bg bg_color">
		<!--Begin 用户中心 Begin -->
		<div class="m_content">
			<%@ include file="left.jsp"%>
			
			<div class="m_right">
				<h2 class="biaoti">社长信息</h2>
				<table class="tb">
					<tr>
						<th>序号</th>
						<th>社长姓名</th>
						<th>所属社团</th>
						<th>学号</th>
						<th>联系电话</th>
						<th>操作</th>
					</tr>
					<c:forEach items="${szList }" var="sz" varStatus="status">
						<tr <c:if test="${status.index%2 == 0 }">style='background-color:#f1f2f3'</c:if>>
							<td>${status.index+1 }</td>
							<td>${sz.name }</td>
							<td>${sz.organnizationname }</td>
							<td>${sz.stuno }</td>
							<td>${sz.phone }</td>
							<td>
								<a href="${pageContext.request.contextPath }/user/houshezhangupdate.do?id=${sz.id}"><img src="${pageContext.request.contextPath }/statics/images/xiugai.png"/></a>
								<a onclick="deluser('${sz.id}')"><img src="${pageContext.request.contextPath }/statics/images/schu.png"/></a>
							</td>
						</tr>
					</c:forEach>
				
				</table>
				 <div class="pages">
				 	<c:if test="${pageIndex-1>0 }">
                    <a href='${pageContext.request.contextPath }/user/hou_shezhanglist.do?pageIndex=${pageIndex-1}'
                    		 class="p_pre" >上一页</a>
                   	</c:if>
                    <c:forEach begin="1" end="${pageCount }" varStatus="status">
                    	<a href="${pageContext.request.contextPath }/user/hou_shezhanglist.do?pageIndex=${status.count}">${status.count }</a>
                    </c:forEach>
                     <c:if test="${pageIndex<pageCount }">
                    <a href='${pageContext.request.contextPath }/user/hou_shezhanglist.do?pageIndex=${pageIndex+1}'
                    		 class="p_pre" >下一页</a>
                   	</c:if>
                </div>
				
			</div>
		</div>

	</div>
	
  </body>
</html>
