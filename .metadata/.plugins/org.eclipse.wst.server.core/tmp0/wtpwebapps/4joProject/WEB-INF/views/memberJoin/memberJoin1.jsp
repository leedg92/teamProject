<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>memberjoin1</title>
</head>
<body>

<fieldset style="width: 500px;">
	<legend>회원가입</legend>
	<form method="POST">
		<p><label><input type="radio" name="membertype" value="gemember" required>일반 회원</label></p>
		<p><label><input type="radio" name="membertype" value="comember" required>기업 회원</label></p>
		<input type="submit" value="댜음" >
	</form>
	
</fieldset>

</body>
</html>