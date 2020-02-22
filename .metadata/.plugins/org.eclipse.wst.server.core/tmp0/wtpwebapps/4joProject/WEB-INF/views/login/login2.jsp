<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
 	input[id="popup"]{ 
 		display: none; 
 	} 
/* 	input[id="popup"] + label{ */
/* 		display: inline-block; */
/* 		padding: 20px; */
/* 		background: #FFE400; */
/* 		color: #FFFFFF; */
/* 	} */
	input[id="popup"] + label + div{
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		z-index: 100;
	}

	input[id="popup"] + label + div > div{
		position: absolute;
		top: 50%;
		left: 50%;
		transform:translate(-50%, -50%);
		width: 500px;
		height: 300px;
		background: #FFFFFF;
		z-index: 2;
	}
	input[id="popup"] + label + div > div > label{
		position: absolute;
		top: 0%;
		right: 0%;
		transform:translate(40%, -40%);
		padding: 20px;
		background: #810000;
		border-radius: 100%;
		z-index: 1;	
	}
	input[id="popup"] + label + div > label{
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		background: rgba(0,0,0,.8);
		z-index: 1;	
	}
</style>	
</head>
<body>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

		<input type="checkbox" id="popup">
		<label for="popup"></label>
		<div>
			<div align="center">
				<p style="color: red;">${msg }</p>
				<form action="login" method="POST">
					<p><input name="userid" placeholder="ID입력" value="${cookie['userid'].value ==null ? '' : cookie['userid'].value }"></p>
					<p><input name="inputpass" type="password" placeholder="PW입력"></p>
					<p><input type="checkbox" name="rememberid" ${cookie['userid'].value ==null? "" : "checked"}>id기억</p>
					<p><input type="checkbox" name="autologin">로그인 유지</p>	
					<input type="hidden" name="next" value="${next }">
					<p><input type="submit" value="로그인">
					<input type="button" value="회원가입" onclick="location.replace('${pageContext.request.contextPath}/memberJoin')"></p>
					<a href="findId">아이디</a>/<a href="findPw">비밀번호</a> 찾기
				</form>
				<label for="popup"></label>
			</div>
			<label for="popup"></label>
		</div>



</body>
</html>