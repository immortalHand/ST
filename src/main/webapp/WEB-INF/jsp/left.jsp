<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<div class="m_left">
		<div class="left_n">系统管理员中心</div>
		<div class="left_m">
			<div class="left_m_t t_bg1">社团中心</div>
			<ul>
				<li><a href="${pageContext.request.contextPath }/orga/houshetuanlist.do">全部社团</a></li>
				<li><a href="${pageContext.request.contextPath }/orga/addshetuan.do">添加社团</a></li>
			</ul>
		</div>
		<div class="left_m">
			<div class="left_m_t t_bg2">社长中心</div>
			<ul>
				<li><a href="${pageContext.request.contextPath }/user/hou_shezhanglist.do">全部社长</a></li>
				<li><a href="${pageContext.request.contextPath }/user/hourenshezhang.do">任命社长</a></li>

			</ul>
		</div>
		<div class="left_m">
			<div class="left_m_t t_bg3">活动管理</div>
			<ul>
				<li><a href="${pageContext.request.contextPath }/active/houactivelist.do">全部活动</a></li>
				<li><a href="${pageContext.request.contextPath }/active/houshowadd.do">添加活动</a></li>
			</ul>
		</div>
		<div class="left_m">
			<div class="left_m_t t_bg4">用户中心</div>
			<ul>
				<li><a href="${pageContext.request.contextPath }/user/userall.do">所有会员</a></li>
				<li><a href="${pageContext.request.contextPath }/user/userallno.do">所有游客</a></li>
			</ul>
		</div>
	</div>

	

