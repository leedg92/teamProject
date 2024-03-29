<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
<script src="https://kit.fontawesome.com/5f6c379a3f.js" crossorigin="anonymous"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<!-- <script type="text/javascript" src=".js/jquery-3.1.0.min.js" charset="utf-8"></script> -->

</head>

<style>
.map_wrap {position:relative;overflow:hidden;width:100%;height:350px;}
.radius_border{border:1px solid #919191;border-radius:5px;}     
.custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif; text-align:center; cursor:pointer;}
</style>

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
		
	<form name="agent_form"  method="POST" enctype="multipart/form-data">
	<fieldset style="margin-left: 100px;">
	사진을 등록해주세요.<br>
		<input type="file" name="file" id="uploadImg" required>
		<span id="preview"></span>
		
	
		<input type="hidden" name="userid" value="${member.userid }">	<!-- 차후에 세션으로 받아오기 -->
		<input type="hidden" name="username" value="${member.username }">		<!-- 차후에 세션으로 받아오기 -->
		<br>
		제목 <input type="text" name="title">	<br>
		가게검색(이름 / 주소)  <input type="text" name="restaurant" id="restaurant" required>
		<input type="button" onclick="ok()" value="검색"><br>
			 	<div class="map_wrap" >
	<div id="map" style="width:400px; height:400px; float:left; border:2px solid grey; position:relative; overflow:hidden;"></div>
<!-- 		<div class="custom_typecontrol radius_border" onclick="Pcode()"> -->
<!-- 			주소로 위치 설정 -->
<!-- 		</div> -->
	</div>
		<input type="hidden" name="address" id="address">
		</form>

	
		내용<textarea rows="30" cols="30" name="context"></textarea>		
		<input type="submit" value="리뷰 작성">
		
			<input type="button" value="메인으로" height="40px" width="40px"
		onclick="location.replace('${pageContext.request.contextPath}')">	
	</fieldset>
			<!-- 				맵 프로토타입2								-->
			</div>
	

	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ec2b54c04ec761a948b34fefea022c0&libraries=services"></script>
<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
var geocoder = new kakao.maps.services.Geocoder();
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 
 function ok(){
     map = new kakao.maps.Map(mapContainer, mapOption);    
     var test = document.getElementById('restaurant').value;   
// 키워드로 장소를 검색합니다
ps.keywordSearch(test, placesSearchCB); 
    }
// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });
   var xy =new kakao.maps.LatLng(place.y, place.x);
    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
       searchDetailAddrFromCoords(xy, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
          var test2 = document.getElementById('address');
          var test3 = document.getElementById('restaurant');
            var detailAddr = result[0].address.address_name;
            test2.value = detailAddr;
            test3.value = place.place_name;
            infowindow.setContent(place.place_name + '<br>' + detailAddr );
            infowindow.open(map, marker);
        }   
    });
    });
}
    
    
function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

</script>
	<a href="searchmap" style="text-decoration: none">지도가 보이지 않습니다.</a>

<!--  			map 프로토타입 끝		-->				
	<input type="button" value="메인으로" onclick="location.replace('${pageContext.request.contextPath}')">
</form>
	<input id="user" type="hidden" value="${member.userid }">
<script src="resources/assets/js/jquery.min.js?ver=2"></script>
		<script src="resources/assets/js/jquery.scrollex.min.js?ver=3"></script>
		<script src="resources/assets/js/jquery.scrolly.min.js?ver=4"></script>
		<script src="resources/assets/js/browser.min.js?ver=5"></script>
		<script src="resources/assets/js/breakpoints.min.js?ver=6"></script>
		<script src="resources/assets/js/util.js?ver=7"></script>
		<script src="resources/assets/js/main.js?ver=8"></script>
</body>
<script>

var upload = document.querySelector('#uploadImg');
var preview = document.querySelector('#preview');

// NodeList nodeList = preview.getChildsNodes();


upload.addEventListener('change',function (e) {
    var get_file = e.target.files;
    var image = document.createElement('img');
    
    /* FileReader 객체 생성 */
    var reader = new FileReader();

    /* reader 시작시 함수 구현 */
    reader.onload = (function (aImg) {
        console.log(1);

        return function (e) {
            console.log(3);
            /* base64 인코딩 된 스트링 데이터 */         
            aImg.src = e.target.result;

        }
    })(image)
    
    

    if(get_file){
        /* 
            get_file[0] 을 읽어서 read 행위가 종료되면 loadend 이벤트가 트리거 되고 
            onload 에 설정했던 return 으로 넘어간다.
            이와 함게 base64 인코딩 된 스트링 데이터가 result 속성에 담겨진다.
        */  
       
        	reader.readAsDataURL(get_file[0]);
        	console.log(2);
    }
    if(preview.hasChildNodes()){
    	preview.replaceChild(image, preview.firstChild);
    	preview.appendChild(image);
    	console.log("if 만족 실행")
    }else{
    	preview.appendChild(image);
    	console.log("else 실행")
    }
//     preview.replaceChile(nodeList[0], image);

	

})


</script>
</html>