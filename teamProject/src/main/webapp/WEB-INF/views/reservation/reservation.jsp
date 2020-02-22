<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<html>
<head>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.css">
	<script src="//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="resources/assets/css/main.css?ver=1" />
</head>
<body class="is-preload">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<form method="post">
			<h2>예약</h2>
			<hr>
			<%@include file="calendar.jsp" %>
			예약일: <input type="text" id="chDate" name="resdate" value="${datepicker1 }" required>
			예약시간: <input type="text" class='chHour' name="reshour" value="${timepicker }">
			
<!-- 			<hr> -->
<!-- 			년도:<p id="year"></p> 월: <p id="month"></p> 일: <p id="day"></p> -->
<!-- 			시간: <p id="hour"></p><p id="minutes"></p> -->
			
<!-- 			<br> -->
<!-- 			<hr> -->
			예약자: <input type="text" placeholder="이름" name="resname">
			인원 : <select name="respeople">
				<option>명</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8" >8</option>
				<option value="9">9</option>
				<option value="10">10</option>
			</select><br>
			연락처: <input type="text" name="resnum"><br>

			<input type="hidden" name="key" value="${key }">			<!-- 해당 가게의 key를 히든으로 넘겨준다 -->
			<input type="hidden" name="userid" value="${member.userid }">			<!-- 예약자의 아이디를 히든으로 넘겨준다 -->
			
			<font color="blue;">예약 내역은 마이페이지에서 확인 가능합니다.</font><br><br>
			<input type="submit" value="예약하기">
			
		</form>
</div></div>
		<div id="copyright">
			<ul><li>&copy; </li></ul>
		</div>
			<input id="user" type="hidden" value="${member.userid }">
		<script src="resources/assets/js/jquery.scrollex.min.js?ver=3"></script>
		<script src="resources/assets/js/jquery.scrolly.min.js?ver=4"></script>
		<script src="resources/assets/js/browser.min.js?ver=5"></script>
		<script src="resources/assets/js/breakpoints.min.js?ver=6"></script>
		<script src="resources/assets/js/util.js?ver=7"></script>
		<script src="resources/assets/js/main.js?ver=8"></script>
</body>
</html>
