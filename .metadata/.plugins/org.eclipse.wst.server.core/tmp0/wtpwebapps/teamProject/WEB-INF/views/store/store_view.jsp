<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<head>
<title>Massively by HTML5 UP</title>
<link href="https://fonts.googleapis.com/css?family=Jua&display=swap" rel="stylesheet">

<style>
.navbutton{
	all:unset;
	background-color: #eee;
}

.star-rating {
	height: 31px;
	overflow: hidden;
	background: url(resources/star2.png) no-repeat;
}
</style>

<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalabel=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
</head>
<body class="is-preload">
		<c:if test="${param.add eq 1}">
			<script>alert('번호표 뽑았습니다')</script>
		</c:if>
		<c:if test="${param.add eq 0}">
			<script>alert('이미 하셨어요')</script>
		</c:if>
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
				<li><a href="${pageContext.request.contextPath }/community">커뮤니티</a></li>
			</ul>
		</nav>
		<nav id="nav1">
			<ul class="links">
				<li><a href="${pageContext.request.contextPath }/myPage">마이페이지</a></li>
				<li><a href="${pageContext.request.contextPath }/logout">로그아웃</a></li>
			</ul>
		</nav>

		<!-- Main -->
		<div id="main">

			<!-- Featured Post -->
			<article class="post featured" style="background-color: #eee">
				<header class="major">
					<h2 style="font-family: 'Jua', sans-serif;">
						${board.storename }<br />
					</h2>
				</header>
				<div align="center" style="height: 250px; background-color: white;">
					<div style="width: 500px;">
						<div style="width: 300px; position: absolute;">
							<img src="store_viewBlob?key=${board.key }" style="width: 300px; height: 200px;" />
							<div class='star-rating' style=" width: ${ avg * 29.2}px; "></div>
						</div>
						<div style="float: right;">
							<label>ㆍ 시간 : ${board.runtime }</label>
							<label>ㆍ 쉬는시간 : ${board.breaktime }</label>
							<label>ㆍ 가격 : ${board.price } </label>
							<label>ㆍ 종류 : ${board.foodtype }</label>
							<label>ㆍ 날짜 : ${board.wridate }</label>
							<label>ㆍ 작성자 : ${board.writer } </label>
							<label>ㆍ 조회수 : ${board.viewcount } </label>
							<label>ㆍ 주소 : ${board.address }</label>
						</div>
					</div>
				</div>
				<br>
				<nav align="left" id="reviewnav">
					<h2 style=" display: inline-block;">
						<button class="navbutton" style="border: 0; outline: 0; background-color: white;" value="리뷰">리뷰</button>
					</h2>
					<h2 style=" display: inline-block;">
						<button class="navbutton" style="border: 0; outline: 0;" value="번호표">번호표</button>
					</h2>
					<h2 style=" display: inline-block;">
						<button class=navbutton style="border: 0; outline: 0;" value="예약">예약</button>
					</h2>
				</nav>
				<div id="con1" style="background-color: white;">
					<%@include file="review.jsp" %>
				</div>
				<div id="con2" style="background-color: white; display: none">
					<%@include file="total.jsp" %>
				</div>
				<div id="con3" style="background-color: white; display: none">
 				<input type="button" value="예약하러가기" onclick="location.replace('${pageContext.request.contextPath}/reservation?key=${board.key }')">
 		
				</div>
				
			</article>

				</div>
			</div>
		<input id="user" type="hidden" value="${member.userid }">
		<!-- Scripts -->
		<script type="text/javascript">
			$(function(){
				$('.navbutton').click(function (e){					
					$('.navbutton').css("background-color","#eee");
					$(this).css("background-color","white");
					$('#con1').css("display","none");
					$('#con2').css("display","none");
					$('#con3').css("display","none");
					if($(this).val()=='리뷰')$('#con1').css("display","block");
					if($(this).val()=='번호표')$('#con2').css("display","block");
					if($(this).val()=='예약')$('#con3').css("display","block");
				});
				
			});
		</script>
		
		<script src="resources/assets/js/jquery.min.js?ver=2"></script>
		<script src="resources/assets/js/jquery.scrollex.min.js?ver=3"></script>
		<script src="resources/assets/js/jquery.scrolly.min.js?ver=4"></script>
		<script src="resources/assets/js/browser.min.js?ver=5"></script>
		<script src="resources/assets/js/breakpoints.min.js?ver=6"></script>
		<script src="resources/assets/js/util.js?ver=7"></script>
		<script src="resources/assets/js/main.js?ver=8"></script>
</body>
</html>