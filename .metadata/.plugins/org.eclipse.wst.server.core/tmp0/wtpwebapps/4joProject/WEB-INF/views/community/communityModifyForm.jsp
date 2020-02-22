<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
<!-- <script type="text/javascript" src="js/addons/datatables.min.js"></script> -->
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
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
				<li><a href="${pageContext.request.contextPath }/storemain">맛집</a></li>
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
	
<form method="POST">
<table border="1">
	<tr>
		<th width="5%"><input type="hidden" value="${vo.bnum}" name="bnum"> ${vo.bnum }</th>
		<th width="70%"><input type="text" name="title" value="${vo.title}"></th>
		<th width="10%">${vo.time }</th>
		<th>${member.userid }</th>

			
		<tr>
				
			<td colspan="4"><img src="viewBlob?filename=${vo.STORED_FILE_NAME }" style="heigh: 150px"><textarea rows="40" cols="40" name="context">${vo.context }</textarea></td>
		</tr>
	</table>
	
	<input type="submit" value="수정완료">
</form></div></div>
		<div id="copyright">
			<ul><li>&copy; </li></ul>
		</div>
		<input id="user" type="hidden" value="${member.userid }">
		
		<script src="resources/assets/js/jquery.min.js?ver=2"></script>
		<script src="resources/assets/js/jquery.scrollex.min.js?ver=3"></script>
		<script src="resources/assets/js/jquery.scrolly.min.js?ver=4"></script>
		<script src="resources/assets/js/browser.min.js?ver=5"></script>
		<script src="resources/assets/js/breakpoints.min.js?ver=6"></script>
		<script src="resources/assets/js/util.js?ver=7"></script>
		<script src="resources/assets/js/main.js?ver=8"></script>
</body>
</html>