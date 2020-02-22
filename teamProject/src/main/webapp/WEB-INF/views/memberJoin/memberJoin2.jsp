<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberjoin2</title>
<style>
	input[type="password"], input[type="text"]{all: unset;}
</style>
<style>
	.icons li a{
		all: unset;
	}
</style>
<style>
	p{
		text-align: center;
	}
</style>
</head>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="resources/assets/css/main.css" />
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>

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
	<div id="main">

	<form action="memberJoin2" method="post">
	<table>
		<tr>
			<th>ID</th>
<%-- 			<td><input type="text" name="userid" placeholder="ID" required>	<font color="red;">${msg }</font></td> --%>
			<td><div class="row gtr-uniform">
					<div class="col-6 col-12-xsmall">
						<input type="text" name="userid" placeholder="ID" required id="demo-name"/>
					</div></div>
			</td>
		</tr>
		<tr>
			<th>패스워드</th>
<!-- 			<td><input width="300px;" name="userpw" type="password" placeholder="PW" required></td> -->
			<td><div class="row gtr-uniform">
					<div class="col-6 col-12-xsmall">
						<input name="userpw" type="password" placeholder="PW" required id="demo-name"/>
					</div></div>
			</td>
		</tr>
		<tr>
			<th>패스워드 확인</th>
<!-- 			<td><input name="confirmpw" type="password" placeholder="PW확인" required></td> -->
			<td><div class="row gtr-uniform">
					<div class="col-6 col-12-xsmall">
						<input name="confirmpw" type="password" placeholder="PW확인" required id="demo-name"/>
					</div></div>
			</td>
		</tr>
		<tr>
			<th>${membertype == 'gemember' ? "이름":"가게 이름"}</th>
<!-- 			<td><input name="username" placeholder="OOO" required></td> -->
			<td><div class="row gtr-uniform">
					<div class="col-6 col-12-xsmall">
						<input name="username" placeholder="OOO" required type="text" id="demo-name"/>
				</div></div>
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
			<div class="col-6 col-12-small">
				<input type="radio" id="gender1" name="gender" value="여자" ${member.gender eq '여자' ? "checked" : ""} required>
				<label for="gender1">여자</label> &nbsp;
				<input type="radio" id="gender2" name="gender" value="남자" ${member.gender eq '남자' ? "checked" : ""} required>
				<label for="gender2">남자</label>
			</div>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
<!-- 			<td><input name="email" placeholder="hello@hello.com" required></td> -->
			<td><div class="row gtr-uniform">
					<div class="col-6 col-12-xsmall">
						<input name="email" placeholder="hello@hello.com" required type="text" id="demo-name"/>
				</div></div>
			</td>
		</tr>
		<tr>
			<th>전화번호</th>
<!-- 			<td><input name="phone" placeholder="010-1234-5678" required></td> -->
			<td><div class="row gtr-uniform">
					<div class="col-6 col-12-xsmall">
						<input name="phone" placeholder="010-1234-5678" required type="text" id="demo-name"/>
				</div></div>
			</td>
		</tr>
	</table>
		<input type="hidden" name="membertype" value="${membertype }">
		<p><input type="submit" value="가입"></p>
	</form>
		<div id="copyright">
			<ul><li>&copy; </li></ul>
		</div>
</div></div>
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