<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
				"http://www.w3.org/TR/html4/loose.dtd">
				
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
<script src="https://kit.fontawesome.com/5f6c379a3f.js" crossorigin="anonymous"></script>

<script src="http://code.jquery.com/jquery-1.11.2.min.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>	
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script> -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ec2b54c04ec761a948b34fefea022c0&libraries=services"></script>


<title>Insert title here</title>


</head>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		</div>
<div id="main">
<div class="box">
	<table>
		<tr>
			<th width="5%"><input type="hidden" value="${vo.bnum}"
				name="bnum"> ${vo.bnum }</th>
			<th width="70%"><input type="hidden" name="title"
				value="${vo.title}">${vo.title }</th>
			<th width="10%">${vo.time }</th>
			<th>${vo.userid }</th>
			<th>조회수 ${vo.hits }</th>
			</tr>
		<tr>

			<td colspan="4"><img
				src="viewBlob?filename=${vo.STORED_FILE_NAME }" style="height: 150px"><br>
				${vo.context }<br>

		<c:choose>
		<c:when test="${isLike eq 0}">	<!-- memberIsLike(DB)에서 불러온  -->
			<span id="likey" onclick="likeClick()"><img src='resources/images/heart.png' width="20px" heigth="20px" style="margin-right: 0;" ></span>
			<span id="likeCount">${vo.belike }</span>
		</c:when>
		<c:otherwise>
			<span id="likey" onclick="likeClick()"><img src='resources/images/blackHeart.png' width="20px" heigth="20px" style="margin-right: 0;"></span>
			<span id="likeCount">${vo.belike }</span>
		</c:otherwise>
		
	</c:choose>
	<br>



	<div id="map" style="width:200px; height:200px; float:left; border:2px solid grey;" ></div>
			</td>
			


		</tr>	
	</table>
	<input type="button" value="메인으로" height="40px" width="40px"
		onclick="location.replace('${pageContext.request.contextPath}')">
	<c:if test="${member.userid eq vo.userid }">
		<input type="button" value="삭제"
			onclick="location.replace('${pageContext.request.contextPath}/delete?bnum=${vo.bnum }')">
		<input type="button" value="수정"
			onclick="location.replace('${pageContext.request.contextPath}/modify?bnum=${vo.bnum }')">
	</c:if>

	
	
	



<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
	geocoder.addressSearch('${vo.address}', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div style="width:150px;text-align:center;padding:6px 0;">${vo.restaurant}</div><hr><div style="width:150px;text-align:center;padding:6px 0;">${vo.address}</div>'
        });
        infowindow.open(map, marker);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});

</script>
	

	


	

<div class="box">


	<table border="1" width="400px">
		<tr>
			<th width="50%">댓글</th>
			<th width="10%">글쓴이</th>
			<th width="20%">작성날짜</th>
			<th></th>
			<th></th>
		</tr>
		<c:forEach var="comment" items="${commentList }" varStatus="st">
		<tbody>
			<tr>
				<td>${comment.c_context }</td>
				<td>${comment.c_userid }</td>
				<td>${comment.c_date }</td>
			
				<c:if test="${member.userid eq comment.c_userid }">
					<td><input type="button" value="댓글 삭제"
						onclick="location.replace('${pageContext.request.contextPath}/comment_delete?Commentnum=${comment.comment_num }&Boardnum=${vo.bnum }')"></th>
<%-- 						onclick="deleteComment(${comment.comment_num})"></td> --%>
					<td><input type="button" value="댓글 수정"
						onclick="location.replace('${pageContext.request.contextPath}/comment_modify?Commentnum=${comment.comment_num}&Boardnum=${vo.bnum }')"></th>
<%-- 					<th><input type="button" value="댓글 수정" data-rno="${comment.comment_num}"></th> --%>
				</c:if>			
						
			</tr>
			</tbody>
		</c:forEach>
	</table>
	
		<form action="comment" method="POST">
		<span  style="width: 100%; height: 100%;"><input type="text" name="Ccontext" placeholder="댓글 작성창"> <input type="submit" value="댓글 작성"></span>
		<input type="hidden"name="Cuserid" value="${member.userid }"> 
		<input type="hidden" name="bnum" value="${vo.bnum}"> 
		
	</form>
	</div>
	
	<div id="copyright">
			<ul><li>&copy; </li></ul>
		</div>
	</div>
	</div>
	
<script type="text/javascript">
function likeClick(){
		$.ajax({
			url: 'likeCheck',
			dataType : "json",
			data: {"bnum" : ${vo.bnum},
				   "userid" : '${member.userid}',
			},
			
			success: function(data){
				var d1 = document.getElementById('likey');
				var d2 = document.getElementById('likeCount');
				
				if(data.likeCheck == '0'){
					d1.innerHTML = '<img src=\'resources/images/heart.png\' width="20px" heigth="20px">';		//폰트어썸에서 따오기
					d2.innerHTML = data.countLike;

				}else{
					d1.innerHTML = '<img src=\'resources/images/blackHeart.png\' width="20px" heigth="20px">';
					d2.innerHTML = data.countLike;
		
				
				}
			}
		});
}
</script>
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