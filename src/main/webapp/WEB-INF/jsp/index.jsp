<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<title>首页</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/statics/css/bootstrap.min.css" />
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/statics/css/reset.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/statics/css/index.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/statics/css/style.css">
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath }/statics/css/Regist.css" />
<script
	src="${pageContext.request.contextPath }/statics/js/jquery-1.12.4.js"></script>
<script src="${pageContext.request.contextPath }/statics/js/script.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/statics/js/daohang.js"></script>
<script type="text/javascript">
	$(function(){
	
     function movedown(){
        var marginTop = 0 ;
        var stop =false;
        var interval = setInterval(function(){
            if(stop) return;
            $("#express").children("li").first().animate({
                    "margin-top":marginTop--},
                0,
                function(){
                    var jqfirst =$(this);
                    if(!jqfirst.is(":animated")){
                        if((-marginTop)>jqfirst.height()){
                            jqfirst.css({"margin-top":5}).appendTo($("#express"));
                            marginTop = 0;
                        }
                    }
                });
        },50);
        $("#express").mouseover(function(){
            stop = true;
        }).mouseout(function(){
            stop = false;
        });
    }
    movedown();
    function movedown1(){
        var marginTop = 0 ;
        var stop =false;
        var interval = setInterval(function(){
            if(stop) return;
            $("#express1").children("li").first().animate({
                    "margin-top":marginTop--},
                0,
                function(){
                    var jqfirst =$(this);
                    if(!jqfirst.is(":animated")){
                        if((-marginTop)>jqfirst.height()){
                            jqfirst.css({"margin-top":5}).appendTo($("#express1"));
                            marginTop = 0;
                        }
                    }
                });
        },50);
        $("#express").mouseover(function(){
            stop = true;
        }).mouseout(function(){
            stop = false;
        });
    }
    movedown1();  
});
</script>
</head>

<body>
	<c:if test="${error!=null }">
		<script>
			if(confirm("你已有参加活动,是否进入活动页面?")){
				location.href="${pageContext.request.contextPath }/active/ActiveInfo.do?id=${loginUser.activeid}";
			}
		</script>
	</c:if>
	<c:if test="${error1!=null }">
		<script>
			alert("你还未加入任何社团");
		</script>
	</c:if>
	<c:if test="${message!=null }">
		<script>
			alert("报名成功");
		</script>
	</c:if>
	<%@ include file="header.jsp"%>

	<div class="main">
		<div class="main-inner body-width">
			<div class="banner clearfix">
				<div class="slider" id="slider">
					<ul class="slider-wrapper">
						<li class="item" data-title="环保协会"><a href="#" class="pic"><img
								src="${pageContext.request.contextPath }/statics/images/cont/slider_img1.jpg"
								alt="#"></a></li>
						<li class="item" data-title="舞蹈协会" data-author="社长 占秋"><a
							href="#" class="pic"><img
								src="${pageContext.request.contextPath }/statics/images/cont/slider_img2.jpg"
								alt="#"></a></li>
						<li class="item" data-title="艺翔协会" data-author="社长 哈哈">
							<a href="#" class="pic"><img
								src="${pageContext.request.contextPath }/statics/images/cont/slider_img3.jpg"
								alt="#"></a>
						</li>
						<li class="item" data-title="篮球协会" data-author="社长 郑南音"><a
							href="#" class="pic"><img
								src="${pageContext.request.contextPath }/statics/images/cont/slider_img4.jpg"
								alt="#"></a></li>
						<li class="item" data-title="足球协会"><a href="#" class="pic"><img
								src="${pageContext.request.contextPath }/statics/images/cont/slider_img5.jpg"
								alt="#"></a></li>
					</ul>
					<a href="javascript:;" class="slider-prev"></a> <a
						href="javascript:;" class="slider-next"></a>
					<div class="slider-title">
						<h2></h2>
						<span></span>
					</div>
					<div class="slider-btns">
						<span class="item"></span> <span class="item"></span> <span
							class="item"></span> <span class="item"></span> <span
							class="item"></span>
					</div>
				</div>
				<div class="banner-info">
					<div class="news body-border">
						<div class="tabList">
							<ul class="nav nav-tabs" role="tablist">
								<li role="presentation" class="active"><a href="#home"
									aria-controls="home" role="tab" data-toggle="tab" style="font-size:18px;">公告</a></li>
								<li role="presentation"><a href="#profile"
									aria-controls="profile" role="tab" data-toggle="tab" style="font-size:18px;">活动</a></li>
								
							</ul>

							<!--选项卡面板-->
							<div class="tab-content">
								<div role="tabpanel" class="tab-pane active" id="home">
									<ul id="express">
										<c:forEach items="${actives}" var="v">
											<li><span class="zixun">[ 活动 ]</span><a class="neirong" href="${pageContext.request.contextPath }/active/ActiveInfo.do?id=${v.id}">${v.time }在${v.address }举办${v.name }</a></li>
										</c:forEach>
									</ul>
									
								</div>
								<div role="tabpanel" class="tab-pane" id="profile">
									<div>
									<ul id="express1">
										<c:forEach items="${actives}" var="v">
											<li><span class="zixun">[ 活动 ]</span><a class="neirong" href="${pageContext.request.contextPath }/active/ActiveInfo.do?id=${v.id}">${v.time }在${v.address }举办${v.name }</a></li>
										</c:forEach>
									</ul>
									</div>
								</div>
								
							</div>

						</div>
					</div>

				</div>
			</div>
			<div class="main-cont main-album">
				<div class="main-cont__title">
					<h3>社团</h3>
					<a href="${pageContext.request.contextPath }/orga/all.do" class="more">更多社团 ></a>
				</div>
				<ul class="main-cont__list clearfix">
					<c:forEach items="${organizations }" var="v">
						<li class="item"><a href="${pageContext.request.contextPath }/orga/sheTuanInfol.do?id=${v.id}" class="pic"><img
								src="${pageContext.request.contextPath }/upload/${v.img }" alt="#"></a>
							<div class="info">
								<a href="${pageContext.request.contextPath }/orga/sheTuanInfol.do?id=${v.id}" class="title">${v.name }</a>
								<p><fmt:formatDate value="${v.time }" pattern="yyyy-MM-dd"/> 创立&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			
									<a class="author" style="margin-left:100px">社团大约${v.num }人</a>
								</p>
							</div>
						</li>
					</c:forEach>

				</ul>
			</div>
			<div class="main-cont main-recommend">
				<div class="main-cont__title">
					<h3>最新社团活动</h3>
					<%-- <p class="list">
						<em>社团：</em>
						<c:forEach items="${organizations }" var="v">
							<a href="${pageContext.request.contextPath }/active/selectActivesByOrgaId.do?id=${v.id}">${v.name }</a><span>|</span>
						</c:forEach>
					</p> --%>
					<a href="${pageContext.request.contextPath }/active/all.do" class="more">更多活动 ></a>
				</div>
				<ul class="main-cont__list clearfix">
					<c:forEach items="${actives}" var="v">
						<li class="item"><a href="${pageContext.request.contextPath }/active/ActiveInfo.do?id=${v.id}" class="pic"><img
								src="${pageContext.request.contextPath }/upload/${v.img }" alt="#"></a>
							<div class="info">
								<a href="${pageContext.request.contextPath }/active/ActiveInfo.do?id=${v.id}" class="title">${v.name }</a> <span>${v.address }</span> <a
									href="${pageContext.request.contextPath }/user/addActive.do?id=${v.id}&uid=${loginUser.id==null?0:loginUser.id}" class="icon-text__pink purchase">报名</a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
			<div class="main-cont main-user">
				<div class="main-cont__title">
					<h3>社团社长</h3>
					<a href="${pageContext.request.contextPath }/user/all.do" class="more">更多社长 ></a>
				</div>
				<ul class="main-cont__list clearfix">
					<c:forEach items="${users }" var="v">
						<li class="item"><a href="#" class="pic"
											style=" background: url(images/cont/user_img1.jpg) no-repeat; background-size: cover; "></a>
							<a href="#" class="headImg"><img
									src="${pageContext.request.contextPath }/upload/${v.img }" alt="无图"></a>
							<div class="info">
								<a href="#" class="info-title">${v.name }</a>
								<p>
									<i class="icon-star"></i>${v.organnizationname }
								</p>
									<%-- <p>
                                        职位: <b>${ }</b>
                                    </p> --%>
							</div>
						</li>
					</c:forEach>

				</ul>
			</div>

		<%@ include file="footer.jsp"%>


	</div>

	<script src="${pageContext.request.contextPath }/statics/js/bootstrap.min.js"></script>
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/inews_express.js"></script> --%>
</body>
</html>
