<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css?ver=15" />
<link rel="stylesheet" href="resources/assets/css/myPage.css?ver=1" />
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

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
<c:if test="${result == 'true' }">
	<script>
		alert("임시비밀번호 발급! 메일을 확인해주세요.");
		location.href ="login";
	</script>
</c:if>

<form method="POST">
	<table>
		<tr>
			<th>ID</th>
			<td><input name="userid" placeholder="ID를 입력하세요"></td> 
			<td style="color: red;">${msg }</td>
		</tr>
		<tr>
			<td colspan="2" ><p style="color: blue;">가입 시 입력한 메일 주소로 임시 비밀번호가 발급됩니다.</p></td>
		</tr>

		<tr><td colspan="2"><input type="submit" value="임시 비밀번호 발급"></td></tr>
	</table>
</form>
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