<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사업자 회원 마이페이지</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="resources/assets/css/main.css" />
<style>
	.tabWrap { width: 900px; height: 500px; }
	.tab_Menu { margin: 0px; padding: 0px; list-style: none; }
	.tabMenu { width: 150px; margin: 0px; text-align: center; 
		   padding-top: 10px; padding-bottom: 10px; float: left; }
	.tabMenu a { color: #000000; font-weight: bold; text-decoration: none; }
	.current { background-color: #FFFFFF; 
			   border: 1px solid black; border-bottom:hidden; }
	.tabPage { width: 900px; height: 470px; float: left; 
			   border: 1px solid black; }
	fieldset{ width: 600px; border: 1px red solid;}
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

</script>
</head>

<body>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!-- Header -->
	<header id="header">
		<a href="${pageContext.request.contextPath }" class="logo">맛.zip</a>
	</header>
<div id="main">

<h2>마이페이지</h2>
<section>
	<h3>ID : ${member.userid }</h3>
	<p><a href="memberInfo" class="logo">내정보</a></p>
	<c:if test="${member.membertype eq 'comember' &&  member.store == 'X'}">
		<p><font color="blue;">아직 가게를 등록하지 않았습니다!   </font>>>>>>> <a href="insertStore">가게등록</a></p>
	</c:if>
</section>

<section>

</section>

<section>
	 <div class="tabWrap">
		<ul class="tab_Menu">
			<li class="tabMenu current">
				<a href="#tabContent01" >내 음식점 리뷰</a>
			</li>
			<li class="tabMenu">
				<a href="#tabContent02" >내 음식점 정보</a>
			</li>

	
		</ul>
		<div class="tab_Content_Wrap">
			<div id="tabContent01" class="tabPage">
				Tab1 Content
			</div>
			<div id="tabContent02" class="tabPage">
				Tab2 Content
			</div>
		</div>
	</div><br>
	
<input type="button" value="메인으로" onclick="location.replace('${pageContext.request.contextPath}')"> 
</section>

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