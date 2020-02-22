<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 확인</title>  

<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
<link rel="stylesheet" href="resources/assets/css/myPage.css?ver=13" />
<script src="https://kit.fontawesome.com/5f6c379a3f.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js" ></script>
<style>
	a{
		all:unset;
	}
</style>
<style>
	a{
	 cursor: pointer;
	}
	input[id="popup"] + label + div > div {
		position: absolute;
		top: 50%;
		left: 50%;
		transform:translate(-50%, -50%);
		width: 500px;
		height: 500px;
		background: #FFFFFF;
		z-index: 2;
	}
</style>
<script>
$(function(){
	$("#gdgd").click(function(){
		document.getElementById("popup").checked = true;
	})
});
</script>
</head>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<body class="is-preload">
	<!-- Wrapper -->
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
				<th style="vertical-align: middle;">패스워드</th> 
				<td>	
					<div style="margin: 20px;">
						<button style="position: absolute;" class="button primary small" id="gdgd">패스워드 변경</button>
						</div>
						<input type="checkbox" id="popup"><label style="visibility: hidden;" for="popup">변경</label>
							<div>
								<div>			
								<form action="changePw" method="POST">
									<div align="center" style="margin-top: 100px;">
										<p style="width: 300px;"><label>변경할 패스워드</label><input name="inputpass" type="password"></p>
										<p style="width: 300px;"><label>패스워드 확인</label><input name="confirmpass" type="password"></p>
										<input type="hidden" name="userid" value="${member.userid }" >
										<p style="text-align: center;"><input type="submit" value="패스워드 변경"></p>
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