<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 찾기</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css?ver=15" />
<link rel="stylesheet" href="resources/assets/css/myPage.css?ver=1" />
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://kit.fontawesome.com/5f6c379a3f.js" crossorigin="anonymous"></script>
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body class="is-preload">
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
<section>
	<form method="POST">
		<table>
			<tr>
				<th>이름</th>
				<td><input name="username" placeholder="성함을 입력하세요"> (기업회원의 경우 상호명)</td> 
			</tr>
			<tr>
				<th>메일</th>
				<td><input name="email" placeholder="email을 입력하세요"></td>
			</tr>
			<tr><td colspan="2" ><input type="submit" value="확인"></td></tr>
		</table>	
	</form>
		<p style="color: red;">${msg }</p>
		<p><a href="login">로그인 페이지로</a></p>
		<c:if test="${userid != null }">			<!-- id를 찾았을 경우 -->
			<p style="font: bold;">${username }님의 ID는 <font color="blue" size="6">${userid }</font> 입니다</p>
	</c:if>
</section>
	<div id="copyright">
			<ul><li>&copy; </li></ul>
		</div>
</div></div>
		<script src="resources/assets/js/jquery.min.js?ver=2"></script>
		<script src="resources/assets/js/jquery.scrollex.min.js?ver=3"></script>
		<script src="resources/assets/js/jquery.scrolly.min.js?ver=4"></script>
		<script src="resources/assets/js/browser.min.js?ver=5"></script>
		<script src="resources/assets/js/breakpoints.min.js?ver=6"></script>
		<script src="resources/assets/js/util.js?ver=7"></script>
		<script src="resources/assets/js/main.js?ver=8"></script>
</body>
</html>