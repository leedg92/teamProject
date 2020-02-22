<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>main</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="resources/assets/css/main.css" />
</head>
<body>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%@include file="login/login2.jsp" %> --%>
	<div id="wrapper" class="fade-in">

	<!-- Intro -->
		<div id="intro">
			<h1>맛.zip</h1>
			<p></p>
			<ul class="actions">
				<li><a href="#header" class="button icon solid solo fa-arrow-down scrolly">Continue</a></li>
			</ul>
		</div>

	<!-- Header -->
		<header id="header">
			<a href="${pageContext.request.contextPath }" class="logo">맛.zip</a>
		</header>
	</div>
	
		<nav id="nav">
			<ul class="links">
				<li class="active"><a
					href="${pageContext.request.contextPath }/">게시판</a></li>
				<li><a
					href="myPage">마이페이지</a></li>
				<li><a 
					href="community">커뮤니티</a></li>
			</ul>
		</nav>
	<div id="main">
		<section class="posts">
			<article>						
				<c:if test="${member != null }">
					<p>${member.userid } 님 환영합니다</p>
					<p><a href="community">커뮤니티</a></p>
					<p><a href="myPage">마이페이지</a></p>
					<p><a href="logout">로그아웃</a></p>
				</c:if>
				<c:if test="${member == null }">
				<p><a href="login">로그인</a></p>
				<p><a href="community">커뮤니티</a></p>
				</c:if>
			</article>
		</section>
	</div>
	<footer></footer>
	<!-- Scripts -->
		<script src="resources/assets/js/jquery.min.js"></script>
		<script src="resources/assets/js/jquery.scrollex.min.js"></script>
		<script src="resources/assets/js/jquery.scrolly.min.js"></script>
		<script src="resources/assets/js/browser.min.js"></script>
		<script src="resources/assets/js/breakpoints.min.js"></script>
		<script src="resources/assets/js/util.js"></script>
		<script src="resources/assets/js/main.js"></script>
</body>
</html>
