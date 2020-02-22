<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
	a{
		all:unset;
	}
</style>
<style>
	a{
	 cursor: pointer;
	}
	th, td{
	 vertical-align: middle;
	 text-align: center;
	}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.12.0.min.js" ></script>
<script type="text/javascript">
	function tabSetting() {
		// 탭 컨텐츠 hide 후 현재 탭메뉴 페이지만 show
		$('.tabPage').hide();
		$($('.current').find('a').attr('href')).show();

		// Tab 메뉴 클릭 이벤트 생성
		$('li').click(function (event) {
			var tagName = event.target.tagName; // 현재 선택된 태그네임
			var selectedLiTag = (tagName.toString() == 'A') ? $(event.target).parent('li') : $(event.target); // A태그일 경우 상위 Li태그 선택, Li태그일 경우 그대로 태그 객체
			var currentLiTag = $('li[class~=current]'); // 현재 current 클래그를 가진 탭
			var isCurrent = false;  
			
			// 현재 클릭된 탭이 current를 가졌는지 확인
			isCurrent = $(selectedLiTag).hasClass('current');
			
			// current를 가지지 않았을 경우만 실행
			if (!isCurrent) {
				$($(currentLiTag).find('a').attr('href')).hide();
				$(currentLiTag).removeClass('current');

				$(selectedLiTag).addClass('current');
				$($(selectedLiTag).find('a').attr('href')).show();
			}

			return false;
		});
	}

	$(function () {
		// 탭 초기화 및 설정
		tabSetting();
	});
	
	
	function numberTicket(id) {				//번호표
		var request = new XMLHttpRequest();
		request.open("GET", id);
		request.onreadystatechange = function(){
			if ( request.readyState == 4 && request.status == 200) {
				document.getElementById('ticketNum').innerHTML = request.responseText;
			}
		}
		request.send();
	}
	function deletemember(id) {								//탈퇴
		var userinput = prompt('비밀번호를 입력해주세요'+"");
		var request = new XMLHttpRequest();
		request.open("GET", id+"?inputpass="+userinput);
		request.onreadystatechange = function(){
			if ( request.readyState == 4 && request.status == 200) {		
				alert(request.responseText);
			}
		}
		request.send(userinput);
	}
</script>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css?ver=15" />
<link rel="stylesheet" href="resources/assets/css/myPage.css?ver=1" />
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://kit.fontawesome.com/5f6c379a3f.js" crossorigin="anonymous"></script>
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
   <section>
		<i class="fas fa-user-circle fa-5x"></i>
		<font size="5" style="margin-left: 20px;" >ID : ${member.userid }</font>&emsp;
		<a href="memberInfo" class="logo" style="margin-left: 20px;">내정보</a>
	
	</section>
	
	<section>
		<fieldset>
			<input type="button" value="번호표 확인" onclick="numberTicket('${pageContext.request.contextPath}/ticketNum?userid=${member.userid }')"> 
			<span id="ticketNum"></span>
		</fieldset><br>
	</section>
	<section>
		 <div class="tabWrap">
			<ul class="tab_Menu">
				<li class="tabMenu current">
					<a href="#reviewList" >내가 쓴 리뷰</a>
				</li>
				<li class="tabMenu">
					<a href="#mycomuboard" >내가 쓴 글</a>
				</li>
				<li class="tabMenu">
					<a href="#myReservation" >내 예약</a>
				</li>
		
			</ul>
			<div class="tab_Content_Wrap">
				<div id="reviewList" class="tabPage">
					<table>																<!-- 내가 쓴 리뷰 리스트 -->
						<tr>
							<th>사진</th>
							<th width="70%" style="text-align: center;">내용</th>
							<th style="text-align: center;">평점</th>
						</tr>
						<c:forEach var="list" items="${myReviewlist}" varStatus="st">
							<c:if test="${st.count <=5 }">
								<tr>
								<td><img
								src="${pageContext.request.contextPath }/upload/${list.STORED_FILE_NAME}"
								style="height: 100px; width: 100px; size: auto;">
								</td>
								<td style="vertical-align: middle;"><a href="${pageContext.request.contextPath}/storeview?key=${list.key }">${list.content }</a></td>
								<td style="vertical-align: middle;">${list.score }</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
					
					<c:if test="${myReviewlist !=null }">							<!-- 페이징 -->
						<footer style="text-align: center;">
							<div class="pagination">
								<a href="#" class="previous">Prev</a>
								<c:forEach var="i" begin="1" end="${MyReviewPageCount }" >
									<a href="myPage?reviewPage=${i }" class="page ">${i }</a>
								</c:forEach>
	<!-- 									<a href="#" class="page active" value="1">1</a> -->
								<c:if test="${MyReviewPageCount } > 9">
									<span class="extra">&hellip;</span>
								</c:if>
								<a href="#" class="next">Next</a>
							</div>
						</footer>
					</c:if>
				</div>
				<div id="mycomuboard" class="tabPage">
					<table>																<!-- 내가 쓴 커뮤니티 글 리스트 -->
						<tr>
							<th width="70%" style="text-align: center;">제목</th>
							<th style="text-align: center;">날짜</th>
						</tr>
						<c:forEach var="list" items="${myComulist}" varStatus="st">
							<c:if test="${st.count <=5 }">
								<tr>
								<td><a href="board?bnum=2">${list.title }</a></td>
								<td>${list.time }</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
					
					<c:if test="${myComulist !=null }">							<!-- 페이징 -->
						<footer style="text-align: center;">
							<div class="pagination">
								<a href="#" class="previous">Prev</a>
								<c:forEach var="i" begin="1" end="${MyComuPageCount }" >
									<a href="myPage?comuPage=${i }" class="page ">${i }</a>
								</c:forEach>
	<!-- 									<a href="#" class="page active" value="1">1</a> -->
								<c:if test="${MyComuPageCount } > 9">
									<span class="extra">&hellip;</span>
								</c:if>
								<a href="#" class="next">Next</a>
							</div>
						</footer>
					</c:if>
				</div>
				<div id="myReservation" class="tabPage">
					<table>																<!-- 내 예약 -->
						<tr>
							<th width="40%" style="text-align: center;">식당</th>							
							<th style="text-align: center;">예약 시간</th>
							<th style="text-align: center;">예약 날짜</th>
							<th style="text-align: center;">예약 인원</th>
							<th style="text-align: center;">전화번호</th>
							<th style="text-align: center;">삭제</th>
						</tr>
						<c:forEach var="list" items="${myReservationlist}" varStatus="st">
							<c:if test="${st.count <=5 }">
								<tr>
								<td>${list.storename }</td>
								<td>${list.reshour }</td>
								<td>${list.resdate }</td>
								<td>${list.respeople }</td>
								<td>${list.resnum }</td>
								<td><a href="reserDelete?resname=${list.resname }&key=${list.key}">삭제</a></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
					<c:if test="${myReviewlist !=null }">							<!-- 페이징 -->
						<footer style="text-align: center;">
							<div class="pagination">
								<a href="#" class="previous">Prev</a>
								<c:forEach var="i" begin="1" end="${MyReservationPageCount }" >
									<a href="myPage?reservationPage=${i }" class="page ">${i }</a>
								</c:forEach>
<!-- 										<a href="#" class="page active" value="1">1</a> -->
								<c:if test="${MyReservationPageCount } > 9">
									<span class="extra">&hellip;</span>
								</c:if>
								<a href="#" class="next">Next</a>
							</div>
						</footer>
					</c:if>
				</div>
		
			</div>
		</div><br>
	</section>
	<div align="center">
	<br><br><br><br><br><br><br><br><br><br><br><br>
			<section>
			<input type="button" value="메인으로" onclick="location.replace('${pageContext.request.contextPath}')">       
			<input type="button" value="탈퇴" onclick="deletemember('${pageContext.request.contextPath}/memberDelete')">
			</section>
	</div>
		<div id="copyright">
			<ul><li>&copy; </li></ul>	
	</div>
</div>	
</div>
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