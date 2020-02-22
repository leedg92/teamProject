<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberjoin2</title>
<style>
	p{
		text-align: center;
	}
</style>
</head>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body>
<fieldset style="width: 500px;">
	<legend>회원가입</legend>
	<form action="memberJoin2" method="post">
	<table>
		<tr>
			<th>ID</th>
			<td><input name="userid" placeholder="ID" required>	<font color="red;">${msg }</font></td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td><input name="userpw" type="password" placeholder="PW" required></td>
		</tr>
		<tr>
			<th>패스워드 확인</th>
			<td><input name="confirmpw" type="password" placeholder="PW확인" required></td>
		</tr>
		<tr>
			<th>${membertype == 'gemember' ? "이름":"가게 이름"}</th>
			<td><input name="username" placeholder="OOO" required></td>
		</tr>
		<tr>
			<th>성별</th>
			<td><input name="gender" type="radio" value="여자" required>여자
			<input name="gender" type="radio" value="남자" required>남자</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input name="email" placeholder="hello@hello.com" required></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input name="phone" placeholder="010-1234-5678" required></td>
		</tr>
	</table>
		<input type="hidden" name="membertype" value="${membertype }">
		<p><input type="submit" value="가입"></p>
	</form>
</fieldset>
</body>
</html>