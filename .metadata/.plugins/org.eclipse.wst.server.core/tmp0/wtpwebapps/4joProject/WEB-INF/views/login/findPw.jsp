<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 재설정</title>
</head>
<body>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>비밀번호 재설정</h1>
<hr>

<c:if test="${result == 'true' }">
	<script>
		alert("비밀번호 변경 성공! 로그인 페이지로 이동합니다.");
		location.href ="login";
	</script>
</c:if>
<form method="POST">
	<table>
		<tr>
			<th>ID</th>
			<td><input name="userid" placeholder="ID를 입력하세요"></td> 
		</tr>
		<tr>
			<th>새 비밀번호 입력</th>
			<td><input name="inputpass" type="password" placeholder="새비밀번호를 입력하세요"></td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td><input name="confirmpass" type="password" placeholder="비밀번호 확인"></td>
		</tr>
		<tr><td colspan="2"><input type="submit" value="확인"></td></tr>
	</table>
</form>

</body>
</html>