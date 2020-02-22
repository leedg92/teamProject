<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
	.tabWrap { width: 900px; height: 500px; }
	.tab_Menu { margin: 0px; padding: 0px; list-style: none; }
	.tabMenu { width: 150px; margin: 0px; text-align: center; 
		   padding-top: 10px; padding-bottom: 10px; float: left; }
	.tabMenu a { color: #000000; font-weight: bold; text-decoration: none; }
	.current { background-color: #FFFFFF; 
			   border: 1px solid #1e252d; border-bottom:hidden; }
	.tabPage { width: 900px; height: 470px; float: left; 
			   border: 1px solid #1e252d; }
	fieldset{ width: 600px; border: 1px red solid;}
	.box {
		    width: 150px;
		    height: 150px; 
		    border-radius: 70%;
		    overflow: hidden;
		    float: left;
		}
		.profile {
		    width: 150%;
		    height: 150%;	
		    transform:translate(-15%, -15%);
		    object-fit: cover;
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
	
	
	function numberTicket(id) {
		var request = new XMLHttpRequest();
		request.open("GET", id);
		request.onreadystatechange = function(){
			if ( request.readyState == 4 && request.status == 200) {
				document.getElementById('ticketNum').innerHTML = request.responseText;
			}
		}
		request.send();
	}
</script>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
</head>
<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<!-- Header -->
	<header id="header">
		<a href="${pageContext.request.contextPath }" class="logo">맛.zip</a>
	</header>
	
	<nav id="nav">
			<ul class="links">
				<li><a
					href="${pageContext.request.contextPath }/">게시판</a></li>
				<li class="active"><a
					href="myPage">마이페이지</a></li>
				<li><a 
					href="${pageContext.request.contextPath }/community">커뮤니티</a></li>
			</ul>
	</nav>

	<div id="main">
	
	<h2>마이페이지</h2>
	<section>
		<div class="box" style="background: #BDBDBD;">
	  	  <img class="profile" src="resources/images/zzang.jpg">
		</div>
		<br>
		<font size="5" style="margin-left: 20px;" >ID : ${member.userid }</font>
		<p><a href="memberInfo" class="logo" style="margin-left: 20px;">내정보</a></p>
	
	</section>
	
	<section>
		<fieldset>
			<input type="button" value="번호표 확인" onclick="numberTicket('${pageContext.request.contextPath}/ticketNum')"> 
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
					리뷰 리스트
				</div>
				<div id="mycomuboard" class="tabPage">
					<table>
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
					
					<c:if test="${myComulist !=null }">
						<footer>
							<div class="pagination">
								<a href="#" class="previous">Prev</a>
								<c:forEach var="i" begin="1" end="${MyComuPageCount }" >
									<a href="#" class="page">${i }</a>
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
					Tab3 Content
				</div>
		
			</div>
		</div><br>
	</section>
	<footer>
	<input type="button" value="메인으로" onclick="location.replace('${pageContext.request.contextPath}')"> 
	</footer>
	
	</div>
	<!-- Scripts -->
		<script src="resources/assets/js/jquery.min.js"></script>
		<script src="resources/assets/js/jquery.scrollex.min.js"></script>
		<script src="resources/assets/js/jquery.scrolly.min.js"></script>
		<script src="resources/assets/js/browser.min.js"></script>
		<script src="resources/assets/js/breakpoints.min.js"></script>
		<script src="resources/assets/js/util.js"></script>
		<script src="resources/assets/js/main.js"></script>
</body>
</html>