<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://kit.fontawesome.com/5f6c379a3f.js" crossorigin="anonymous"></script>
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Wrapper -->
	<div id="wrapper" class="fade-in">

		<!-- 헤더 -->
		<header id="header">
			<a href="${pageContext.request.contextPath}/" class="logo">맛.ZIP</a>
		</header>

		<!-- 상단 바 -->
		<nav id="nav">
			<ul class="links">		
				<li><a href="adminUserList">회원조회</a></li>
				<li><a href="adminUserDrop">회원탈퇴</a></li>
				<li><a href="adminReviewList">커뮤니티 삭제</a></li>
			</ul>
		</nav>
		<div id="main">

<h2>회원조회</h2>
<hr>
<table>
		<tr>
			<th>No</th>
			<th>UserId</th>
			<th>UserName</th>
			<th>Phone</th>
			<th>Gender</th>
			<th>Email</th>
			<th>MemberType</th>
			<th>Store</th>
			<th>탈퇴여부</th>
		</tr>
		<c:forEach var="user" items="${memberlist }" varStatus="st">
		<tr>
			<th>${st.count }</th>
			<th>${user.userid }</th>		
			<th>${user.username }</th>
			<th>${user.phone }</th>
			<th>${user.gender }</th>
			<th>${user.email }</th>
			<th>${user.membertype }</th>
			<th>${user.store }</th>
			<th><c:if test="${user.deleted ==-1}">탈퇴</c:if></th>
		</tr>
		</c:forEach>
</table>
<input type="button" value="메인으로"
			onclick="location.replace('${pageContext.request.contextPath}')">
					<div id="copyright"></div></div>
			<ul><li>&copy; </li></ul>
		</div>
					<script src="resources/assets/js/jquery.min.js?ver=2"></script>
		<script src="resources/assets/js/jquery.scrollex.min.js?ver=3"></script>
		<script src="resources/assets/js/jquery.scrolly.min.js?ver=4"></script>
		<script src="resources/assets/js/browser.min.js?ver=5"></script>
		<script src="resources/assets/js/breakpoints.min.js?ver=6"></script>
		<script src="resources/assets/js/util.js?ver=7"></script>
		<script src="resources/assets/js/main.js?ver=8"></script>
</body>
</html>