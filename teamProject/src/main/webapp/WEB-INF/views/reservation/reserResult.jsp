<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약완료</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css?ver=1" />
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!-- Wrapper -->
		<div id="wrapper" class="fade-in">
	
			<!-- 헤더 -->
			<header id="header">
				<a href="${pageContext.request.contextPath}/" class="logo">맛.ZIP</a>
			</header>
	
			<!-- 상단 바 -->
			<nav id="nav">
				<ul class="links">		
					<li><a href="${pageContext.request.contextPath }/">메인페이지</a></li>
					<li  class="active"><a href="${pageContext.request.contextPath }/storemain">맛집</a></li>
					<li><a href="${pageContext.request.contextPath }/community">커뮤니티</a></li>
				</ul>
			</nav>
			<nav id="nav1">
				<ul class="links">
					<li><a href="${pageContext.request.contextPath }/myPage">마이페이지</a></li>
					<li><a href="${pageContext.request.contextPath }/logout">로그아웃</a></li>
				</ul>
			</nav>
	<div id="main">
		<c:set var="cpath" value="${pageContext.request.contextPath }" scope="session"/>
		<h2>예약 완료</h2>
		예약이 완료 되었습니다.
		 <hr>
		<a href="search">예약수정</a>
		<a href="delete">예약삭제</a> 
	</div>
	</div>
</body>
</html>