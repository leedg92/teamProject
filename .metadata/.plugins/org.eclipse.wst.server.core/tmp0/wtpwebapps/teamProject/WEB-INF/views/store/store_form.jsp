<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Massively by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://kit.fontawesome.com/5f6c379a3f.js" crossorigin="anonymous"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
	function CancelEnterKey(){
		var evt = (evt) ? evt : ((event) ? event : null);
		var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
		if ((evt.keyCode == 13) && (node.type == "text")) { return false; }
	}
	document.onkeypress = CancelEnterKey;
</script>
<style>
	a{
		all:unset;
	}
</style>
<style>
	a{
	 cursor: pointer;
	}
</style>
</head>
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
				<li  class="active"><a href="${pageContext.request.contextPath }/storemain">맛집</a></li>
				<li><a href="myPage">마이페이지</a></li>
				<li><a href="${pageContext.request.contextPath }/community">커뮤니티</a></li>
			</ul>
		</nav>
		<nav id="nav1">
			<ul class="links">
				<li><a href="#">빙가빙가</a></li>
			</ul>
		</nav>
		<div id="main">
			<article class="post featured" style="height: 1500px;">
				<header class="major">
					<span style="font-size: large;" class="date" id="top">게시글 작성</span>
					<section style="all: unset;">
							<form style="all: unset;" method="post" enctype="multipart/form-data">
										<input type="hidden" id="storename" name="storename"/>
										<div>
										<label>작성자 : ${member.userid }</label>
										</div>
									
										<div style="display: inline-block;">
										<label>가게 번호 : </label>						
										</div>
										<input style="all: unset" name="storenumber" placeholder="ex)010-xxxx-xxxx">
										<br>
										
										<div style="display: inline-block;">
										<label>주소 :</label>
										</div>
										<%@include file="add_adress.jsp" %>
										<br>
										
										<div style="display: inline-block;">
										<label>운영 시간 :</label>
										</div>
										<input style="all: unset" name="runtime" placeholder="ex)00시~00시">										
										<br>
										
										<div style="display: inline-block;">
										<label>쉬는 시간 :</label>
										</div>
										<input style="all: unset" name="breaktime" placeholder="ex)00시~00시">
										<br>
										
										<div style="display: inline-block;">
										<label>음식 종류 :</label>
										</div>
										<input style="all: unset" name="foodtype" placeholder="ex)한식">
										<br>
										
										<div style="display: inline-block;">
										<label>평균 가격대 :</label>
										</div>
										<input style="all: unset" name="price" placeholder="ex)00000원">
										<br>
										
										<label>음식사진 :</label>
										<p><input type="file" name="file">
										
<!-- 										<input type="file" name="file"> -->
<!-- 										<input type="file" name="file"> -->
<!-- 										<input type="file" name="file"> -->
										<input style="visibility: hidden;" type="file" name="file">
										</p>
										<div align="center">
											<input type="button" value="돌아가기" onclick="location.replace('${pageContext.request.contextPath}/')">
												<input type="submit" value="작성" />
										</div>
										<input type="hidden" name="writer" value="${member.userid }"/>
							</form>
						</section>
				</header>
			</article>
			<div id="copyright"> </div>
		</div>
	</div>
	<input id="user" type="hidden" value="${member.userid }">
	<!-- Scripts -->
		<script src="resources/assets/js/jquery.min.js?ver=2"></script>
		<script src="resources/assets/js/jquery.scrollex.min.js?ver=3"></script>
		<script src="resources/assets/js/jquery.scrolly.min.js?ver=4"></script>
		<script src="resources/assets/js/browser.min.js?ver=5"></script>
		<script src="resources/assets/js/breakpoints.min.js?ver=6"></script>
		<script src="resources/assets/js/util.js?ver=7"></script>
		<script src="resources/assets/js/main.js?ver=8"></script>
</body>
</html>