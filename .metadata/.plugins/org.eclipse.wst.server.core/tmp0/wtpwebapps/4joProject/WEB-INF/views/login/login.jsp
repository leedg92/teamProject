<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
<style>
	input[type="password"], input[type="text"]{all: unset;}
	input[type="password"], input[type="text"]{
		-moz-appearance: none;
		-webkit-appearance: none;
		-ms-appearance: none;
		appearance: none;
		background: transparent;
		border-radius: 0;
		border: solid 2px;
		color: inherit;
		display: block;
		outline: 0;
		padding: 0 1rem;
		text-decoration: none;
/* 		width: 50%; */
		border-color: #eeeeee;
		box-shadow: none;
	}
	section{
		all: unset;
	}
</style>
</head>

<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header id="header">
	<a href="${pageContext.request.contextPath }" class="logo">맛.zip</a>
</header>

<c:if test="${next != null }">
	<script>
 		alert("로그인이 되어있지 않습니다.");
	</script> 
</c:if>
<c:if test="${row != null }">
	<script>
 		alert("회원가입이 완료되었습니다.");
	</script> 
</c:if>

<div id="main">
<section>
<h2>로그인</h2>
	
<hr>

<form method="post">
<fieldset style="margin-left: 400px;">

		<div class="field">
			<label for="userid">ID</label>
			<input width="700px;" name="userid" type="text" id="email" value="${cookie['userid'].value ==null ? '' : cookie['userid'].value }" placeholder="ID입력">
		</div><br>
		<div class="field">
			<label for="inputpass">PW</label>
			<input width="700px;" name="inputpass" type="password" id="inputpass" placeholder="PW입력">
		</div><br>
			<p style="color: red;">${msg }</p>
		<div class="col-6 col-12-small">
			<input type="checkbox" id="rememberid" name="rememberid" ${cookie['userid'].value ==null? "" : "checked"}>
			<label for="rememberid">id기억</label>
		</div>
		<div class="col-6 col-12-small">
			<input type="checkbox" id="autologin" name="autologin" >
			<label for="autologin">로그인 유지</label>
		</div><br>
			<input type="hidden" name="next" value="${next }">
			<p><input type="submit" value="로그인">
			<input type="button" value="회원가입" onclick="location.replace('${pageContext.request.contextPath}/memberJoin')"></p>
			<a href="findId">아이디</a>/<a href="findPw">비밀번호</a> 찾기
</fieldset>
</form>
</section>
</div>	

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