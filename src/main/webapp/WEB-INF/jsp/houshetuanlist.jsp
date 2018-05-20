<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>全部社团</title>

  <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/reset.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/index.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/statics/css/style.css">
  <script src="${pageContext.request.contextPath }/statics/js/jquery-1.12.4.js"></script>
  <script src="${pageContext.request.contextPath }/statics/js/script.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/daohang.js"></script>
  
  <script type="text/javascript">
  	function delst(id){
  		if(confirm("确定删除？")){
  			location.href="${pageContext.request.contextPath }/orga/delshetuan.do?id="+id;
  		}
  	}
  </script>

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
				<h2 class="biaoti">全部社团</h2>
				<table class="tb">
					<tr>
						<th>序号</th>
						<th>社团名称</th>
						<th>创建时间</th>
						<th>会员人数</th>
						<th>操作</th>
					</tr>
					
					<c:forEach items="${lists }" varStatus="vs" var="v">
						<tr <c:if test="${vs.index%2 == 0 }">style='background-color:#f1f2f3'</c:if>>
							<td>${vs.count }</td>
							<td>${v.name }</td>
							<td><fmt:formatDate value="${v.time }" pattern="yyyy-MM-dd"/> </td>
							<td>${v.num }</td>
							<td>
								<a href="${pageContext.request.contextPath }/orga/updateshetuan.do?id=${v.id}"><img src="${pageContext.request.contextPath }/statics/images/xiugai.png"/></a>
								<a onclick="delst('${v.id}')"><img src="${pageContext.request.contextPath }/statics/images/schu.png"/></a>
							</td>
							
						</tr>
					</c:forEach>
					
				
				</table>
				 <div class="pages">
				 	<c:if test="${pageindex-1>0 }">
                    <a href="${pageContext.request.contextPath }/orga/houshetuanlist.do?pageIndex=${pageindex-1}" class="p_pre">上一页</a>
                   </c:if>
                    <c:forEach begin="1" end="${pages }" step="1" varStatus="vs">
                    	<a href="${pageContext.request.contextPath }/orga/houshetuanlist.do?pageIndex=${vs.count}" >${vs.count}</a>
                    </c:forEach>
                    <c:if test="${pageindex<pages }">
                    <a href="${pageContext.request.contextPath }/orga/houshetuanlist.do?pageIndex=${pageindex+1}" class="p_pre">下一页</a>
                    </c:if>
                    
                </div>
				
			</div>

		</div>

	</div>
	</div>
	<%@include file="footer.jsp" %>

	</div>

</body>
</html>
