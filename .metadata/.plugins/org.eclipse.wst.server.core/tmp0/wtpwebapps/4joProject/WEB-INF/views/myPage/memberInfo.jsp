<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 확인</title>  
<style>
	input[id="popup"]{
		display: none;
	}
	input[id="popup"] + label{
		display: inline-block;
		padding: 20px;
		background: #FFE400;
		color: #FFFFFF;
	}
	input[id="popup"] + label + div{
		position: fixed;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		z-index: 100;
		display: none;
	}
	input[id="popup"]:checked + label + div{
		display: block;
	}
	input[id="popup"] + label + div > div{
		position: absolute;
		top: 50%;
		left: 50%;
		transform:translate(-50%, -50%);
		width: 600px;
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
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
</head>

<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header id="header">
	<a href="${pageContext.request.contextPath }" class="logo">맛.zip</a>
</header>
<div id="main">
<h2>회원정보 확인</h2>

<c:if test="${result == 'true' }">
	<script>
		alert('비밀번호가 변경되었습니다!');
	</script>
</c:if>

<section>
		<table align="center;">
			<tr>
				<th>TYPE</th> <td>${member.membertype eq 'comember'? "가게회원" :"일반회원" }</td>
			</tr>
			<tr>
				<th>아이디</th> <td>${member.userid}</td>
			</tr>
			<tr>	
				<th>이름</th> <td>${member.username}</td>
			</tr>		
			<tr>	
				<th>패스워드</th> 
				<td>	
					<input type="checkbox" id="popup"><label for="popup">변경</label>
					<div>
						<div>
							<form action="changePw" method="POST">
								<div align="center">
								<p style="width: 300px;">비번<input name="inputpass" type="password"></p>
								<p style="width: 300px;">비번확인<input name="confirmpass" type="password"></p>
								<input type="hidden" name="userid" value="${member.userid }" >
								<p><input type="submit" ></p>
								</div>
							</form>
							<label for="popup"></label>
						</div>
						<label for="popup"></label>
					</div>
				
				</td>
			</tr>
			<tr>	
				<th>PHON</th> <td>${member.phone}</td>
			</tr>
			<tr>	
				<th>성별</th> <td>${member.gender}</td>
			</tr>
			<tr>	
				<th>EMAIL</th> <td>${member.email}</td>
			</tr>
		</table>
		<input type="button" value="수정" onclick="location.replace('${pageContext.request.contextPath}/memberModify')">
		<input type="button" value="메인으로" onclick="location.replace('${pageContext.request.contextPath}')"> 
</section>

</div>
</body>
</html>