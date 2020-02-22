<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" %>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="resources/assets/css/main.css" />
	<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.css">
	<script src="//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.js"></script>
	<title>예약페이지</title>


</head>

<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	<section>
	<form method="POST">
	
	 	<script>
			$(function() {
			  $( "#datepicker1" ).datepicker({
			    dateFormat: 'yy/mm/dd',
			    prevText: '이전 달',
			    nextText: '다음 달',
			    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
			    dayNames: ['일','월','화','수','목','금','토'],
			    dayNamesShort: ['일','월','화','수','목','금','토'],
			    dayNamesMin: ['일','월','화','수','목','금','토'],
			    showMonthAfterYear: true,
			    changeMonth: true,
			    changeYear: true,
			    yearSuffix: '년',
			    minDate: 1,
			    onSelect:function(d){
			    	var arr = d.split("/");
			    	var year = arr[0];
			    	var month = arr[1];
			    	var day = arr[2];
			    	
			    	$("#year").text(year);
			    	$("#month").text(month);
			    	$("#day").text(day);
			    	
			    	
			    }
			  
			  });
				$( "#example-show-hide-callbacks" ).datepicker({
					language: 'en',
					onShow: function (dp, animationCompleted) {
						if(!animationCompleted){
							log('start showing')
						}else{
							log('finished showing')
						}
					},
					onHide: function (dp, animationCompleted) {
						if(!animationCompleted){
							log('start hiding')
						}else{
							log('finished hiding')
						}
					}
				})
			
				
			});
		</script>
		예약일: <input type="text" id="datepicker1" name="resdate" required><br>
		<input type="submit" value="확인">
	</form>
	</section>
	<section>
		<i class="far fa-calendar-alt fa-3x"></i>${resDate }
		<table style="margin-top: 20px;">
			<tr>
				<th>예약시간</th>
				<th>예약자</th>
				<th>인원</th>
			</tr>
			<c:forEach var="list" items="${reservationList }">
				<tr>
					<td>${list.reshour}</td>
					<td>${list.resname}</td>
					<td>${list.respeople}</td>
				</tr>
			</c:forEach>
			<c:if test="${reservationList == null }">
				<tr>
					<td>해당 날짜의 예약이 존재하지 않습니다.</td>
				</tr>
			</c:if>
		</table>
	</section>
</div>
		<div id="copyright">
			<ul><li>&copy; </li></ul>
		</div>
</div>
	<input id="user" type="hidden" value="${member.userid }">
		<script src="resources/assets/js/jquery.scrollex.min.js?ver=3"></script>
		<script src="resources/assets/js/jquery.scrolly.min.js?ver=4"></script>
		<script src="resources/assets/js/browser.min.js?ver=5"></script>
		<script src="resources/assets/js/breakpoints.min.js?ver=6"></script>
		<script src="resources/assets/js/util.js?ver=7"></script>
		<script src="resources/assets/js/main.js?ver=8"></script>

</body>
</html>
