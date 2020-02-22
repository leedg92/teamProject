<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 찾기</title>
</head>
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>ID 찾기</h1>
<hr>

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
	<p><a href="login">로그인 페이지로</a></p>
	<c:if test="${userid != null }">			<!-- id를 찾았을 경우 -->
		<p style="font: bold;">${username }님의 ID는 <font color="blue" size="6">${userid }</font> 입니다</p>
	</c:if>
	<p style="color: red;">${msg }</p>
</body>
</html>