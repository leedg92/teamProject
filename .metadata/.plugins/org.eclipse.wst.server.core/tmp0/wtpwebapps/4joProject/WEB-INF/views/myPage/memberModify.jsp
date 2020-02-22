<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 수정</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
</head>

<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header id="header">
	<a href="${pageContext.request.contextPath }" class="logo">맛.zip</a>
</header>

<div id="main">
<h2>회원 정보 수정</h2>

<section>
	<form method="POST">
		<table>
				<tr>
					<th>TYPE</th> <td>${member.membertype eq 'gemember'? "일반회원":"기업회원"}</td>
				</tr>
				<tr>
					<th>아이디</th> <td>${member.userid}</td>
				</tr>
				<tr>	
					<th>이름</th> <td><input name="username" value="${member.username}" required></td>
				</tr>		
				<tr>	
					<th>PHON</th> <td><input name="phone" value="${member.phone}" required></td>
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
					<th>EMAIL</th> <td><input name="email" value="${member.email}" required></td>
				</tr>
			</table>
			<input type="hidden" name="userid" value="${member.userid }">
			<input type="submit" value="수정완료">
	</form>	

</section>

</div>
</body>
</html>