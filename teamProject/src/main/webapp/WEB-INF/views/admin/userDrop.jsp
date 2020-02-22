<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://kit.fontawesome.com/5f6c379a3f.js" crossorigin="anonymous"></script>
</head>
<body>
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

<h2>회원탈퇴</h2>
<br>
<hr>
<form method = "POST">
<input type="text" name ="userid" placeholder="탈퇴할 회원의 ID"> 
<input type="submit" value="회원탈퇴">
<br>
<hr>
<input type="button" value="메인으로"
			onclick="location.replace('${pageContext.request.contextPath}')">
</form>		
</div>
	</div>		
	<div id="copyright">
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