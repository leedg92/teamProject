<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>사업자 회원 마이페이지</title>
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
	td{
	 vertical-align: middle;
	}
</style>
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
	function deletemember(id) {								//탈퇴
		var userinput = prompt('정말 탈퇴하시겠습니까? 비밀번호를 입력해주세요'+"");
		if (userinput != null){
			var request = new XMLHttpRequest();
			request.open("GET", id+"?inputpass="+userinput);
			request.onreadystatechange = function(){
				if ( request.readyState == 4 && request.status == 200) {		
					alert(request.responseText);
				}
			}
			request.send(userinput);
		}
	}
	$(function(){
		$("#gdgd").click(function(){
			document.getElementById("popup").checked = true;
		})
	});
</script>


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
			<i class="fas fa-store fa-5x"></i>
			<font size="6" style="margin-left: 20px;" >ID :  ${member.userid }</font>&emsp;&emsp;
			<a href="memberInfo" class="logo" style="margin-left: 20px;">내정보확인</a>
			
			<c:if test="${member.membertype eq 'comember' &&  member.store == 'x'}">
				<p style="margin-top: 30px;"><font color="blue;">아직 가게를 등록하지 않았습니다!</font>&emsp;
					 <input type="button" value="가게등록"
							onclick="location.replace('${pageContext.request.contextPath}/insertStore')"></p>
			</c:if>
			
		</section>
		
		<section>
			<a href="myStoreReservation"><i class="far fa-address-book fa-3x"></i>&emsp;예약현황</a>
		</section>
		
		<section>
			<article>
			 <div class="tabWrap">
				<ul class="tab_Menu">
					<li class="tabMenu current">
						<a href="#myStoreData" >내 음식점 정보</a>
					</li>
					<li class="tabMenu">
						<a href="#myStoreReview" >내 음식점 리뷰</a>
					</li>
			
				</ul>
				<div class="tab_Content_Wrap">
					<div id="myStoreData" class="tabPage">
						<c:if test="${member.store == 'x'}">아직 가게를 등록하지 않았습니다!</c:if>
						<c:if test="${member.store == 'o'}">										
						<%@ include file="myStoreInfo.jsp" %>								<!-- 음식점 등록이 되어 있다면 -->
						</c:if>
					</div>
					<div id="myStoreReview" class="tabPage">
						<table style="text-align: center;">																
						<tr>
							<th>사진</th>
							<th width="70%" style="text-align: center;">내용</th>
							<th style="text-align: center;">작성자</th>
							<th style="text-align: center;">평점</th>
						</tr>
						<c:if test="${myStoreReviewList == null}"><tr><td colspan="4">가게 리뷰가 존재하지 않습니다.<tr><td></c:if>
						
						<c:forEach var="list" items="${myStoreReviewList}" varStatus="st">
							<c:if test="${st.count <=5 }">
								<tr>
								<td><img
								src="${pageContext.request.contextPath }/upload/${list.STORED_FILE_NAME}"
								style="height: 100px; width: 100px; size: auto;">
								</td>
								<td><a href="${pageContext.request.contextPath}/storeview?key=${myStore.key }">${list.content }</a></td>
								<td>${list.writer }</td>
								<td>${list.score }</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
					<c:if test="${myStoreReviewList !=null }">							<!-- 페이징 -->
						<footer style="text-align: center;">
							<div class="pagination">
								<a href="#" class="previous">Prev</a>
								<c:forEach var="i" begin="1" end="${MyStoreReviewPageCount }" >
									<a href="myPage?page=${i }" class="page ">${i }</a>
								</c:forEach>
								<c:if test="${MyStoreReviewPageCount } > 9">
									<span class="extra">&hellip;</span>
								</c:if>
								<a href="#" class="next">Next</a>
							</div>
						</footer>
					</c:if>
					</div>
				</div>
			</div></article>
		</section>
		
		<footer id="footer">
			<section>
			<button id="delbutton">번호표삭제</button>
			<input type="button" value="메인으로" onclick="location.replace('${pageContext.request.contextPath}')"> 
			<input type="button" value="탈퇴" onclick="deletemember('${pageContext.request.contextPath}/memberDelete')">
			</section>
		</footer>
		<div id="copyright">
			<ul><li>&copy; </li></ul>
		</div>
	</div>
</div>
<script>
	$('#delbutton').click(function(){
				$.ajax({
					type : "POST",
					dataType : 'text',
					data : "userid="+$('#user').val()+"&key="+$('#key').val(),
					url : "number",
					success : function(data) {
						if(data==0) document.getElementById("txt").innerHTML = 'ㄱㄱ';
						else document.getElementById("txt").innerHTML = data;
					},
					error : function(data){
						alert('이미 예약 하셨어요');
						}
					});
			});
</script>
<input id="user" type="hidden" value="${member.userid }">
<input id="key" type="hidden" value="${myStore.key }">
		<script src="resources/assets/js/jquery.min.js?ver=2"></script>
		<script src="resources/assets/js/jquery.scrollex.min.js?ver=3"></script>
		<script src="resources/assets/js/jquery.scrolly.min.js?ver=4"></script>
		<script src="resources/assets/js/browser.min.js?ver=5"></script>
		<script src="resources/assets/js/breakpoints.min.js?ver=6"></script>
		<script src="resources/assets/js/util.js?ver=7"></script>
		<script src="resources/assets/js/main.js?ver=8"></script>
		
</body>
</html>