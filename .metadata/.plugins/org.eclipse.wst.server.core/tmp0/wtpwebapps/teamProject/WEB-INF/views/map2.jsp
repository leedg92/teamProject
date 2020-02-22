<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css?ver=1" />
<script src="https://kit.fontawesome.com/5f6c379a3f.js" crossorigin="anonymous"></script>
<title>Massively by HTML5 UP</title>


</head>
<style>
a{
		all:unset;
}
a{
	 cursor: pointer;
}
.listimg {
	float:left;
	
}
.map_wrap {
   position: relative;
   overflow: hidden;
   width: 100%;
   height: 350px;
}

.radius_border {
   border: 1px solid #919191;
   border-radius: 5px;
}

.custom_typecontrol {
   position: absolute;
   top: 10px;
   right: 10px;
   overflow: hidden;
   width: 130px;
   height: 30px;
   margin: 0;
   padding: 0;
   z-index: 1;
   font-size: 12px;
   font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
   text-align: center;
   cursor: pointer;
}

.category, .category * {
   margin: 0;
   padding: 0;
   color: #000;
}

.category {
   position: absolute;
   overflow: hidden;
   top: 10px;
   left: 45%;
   width: 352px;
   height: 57px;
   z-index: 10;
   border-radius: 5px;
   border:1px solid #909090;
   box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
   font-family: 'Malgun Gothic', '맑은 고딕', sans-serif;
   font-size: 12px;
   text-align: center;
   background-color: #fff;
  	background: #fff;overflow: hidden;z-index: 2;
}

.category .menu_selected {
   background: #FF5F4A;
   color: #fff;
   border-left: 1px solid #915B2F;
   border-right: 1px solid #915B2F;
   margin: 0 0px;
}

.category li {
   list-style: none;
   float: left;
   width: 50px;
   height: 57px;
   padding-top: 5px;
   cursor: pointer;
   
}

.category .ico_comm {
   display: block;
   margin: 0 auto 2px;
   width: 22px;
   height: 26px;
/*    background: */
/*       url('resources/images/koreaflag.png') */
/*       no-repeat; */
}

.category .ico_coffee {
   background-position: -10px 0;
   
}

.category .ico_store {
   background-position: -10px -36px;
}

.category .ico_carpark {
   background-position: -10px -72px;
}

.wrap {
   position: absolute;
   left: 0;
   bottom: 40px;
   width: 288px;
   height: 132px;
   margin-left: -144px;
   text-align: left;
   overflow: hidden;
   font-size: 12px;
   font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
   line-height: 1.5;
}

.wrap * {
   padding: 0;
   margin: 0;
}

.wrap .info {
   width: 286px;
   height: 120px;
   border-radius: 5px;
   border-bottom: 2px solid #ccc;
   border-right: 1px solid #ccc;
   overflow: hidden;
   background: #fff;
}

.wrap .info:nth-child(1) {
   border: 0;
   box-shadow: 0px 1px 2px #888;
}

.info .title {
   padding: 5px 0 0 10px;
   height: 30px;
   background: #eee;
   border-bottom: 1px solid #ddd;
   font-size: 18px;
   font-weight: bold;
}

.info .close {
   position: absolute;
   top: 10px;
   right: 10px;
   color: #888;
   width: 17px;
   height: 17px;
   background:
      url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');
}

.info .close:hover {
   cursor: pointer;
}

.info .body {
   position: relative;
   overflow: hidden;
}

.info .desc {
   position: relative;
   margin: 13px 0 0 90px;
   height: 75px;
}

.desc .ellipsis {
   overflow: hidden;
   text-overflow: ellipsis;
   white-space: nowrap;
}

.desc .jibun {
   font-size: 11px;
   color: #888;
   margin-top: -2px;
}

.info .img {
   position: absolute;
   top: 6px;
   left: 5px;
   width: 73px;
   height: 71px;
   border: 1px solid #ddd;
   color: #888;
   overflow: hidden;
}

.info:after {
   content: '';
   position: absolute;
   margin-left: -12px;
   left: 50%;
   bottom: 0;
   width: 22px;
   height: 12px;
   background:
      url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.info .link {
   color: #5085BB;
}

#menu_wrap {
   position: absolute;
   top: 0;
   left: 0;
   bottom: 0;
   width: 250px;
   margin: 10px 0 30px 10px;
   padding: 5px;
   overflow-y: auto;
   background: rgba(255, 255, 255, 0.7);
   z-index: 1;
   font-size: 12px;
   border-radius: 10px;
}

.bg_white {
   background: #fff;
}

#menu_wrap hr {
   display: block;
   height: 1px;
   border: 0;
   border-top: 2px solid #5F5F5F;
   margin: 3px 0;
}

#menu_wrap .option {
   text-align: center;
}

#menu_wrap .option p {
   margin: 10px 0;
}

#menu_wrap .option button {
   margin-left: 5px;
}

#placesList li {
   list-style: none;
}

#placesList .item {
   position: relative;
   border-bottom: 1px solid #888;
   overflow: hidden;
   cursor: pointer;
   min-height: 65px;
}

#placesList .item span {
   display: block;
   margin-top: 4px;
}

#placesList .item h5, #placesList .item .info {
   text-overflow: ellipsis;
   overflow: hidden;
   white-space: nowrap;
}

#placesList .item .info {
   padding: 10px 0 10px 55px;
}

#placesList .info .gray {
   color: #8a8a8a;
}

#placesList .info .jibun {
   padding-left: 26px;
   background:
      url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png)
      no-repeat;
}

#placesList .info .tel {
   color: #009900;
}

#placesList .item .markerbg {
   float: left;
   position: absolute;
   width: 36px;
   height: 37px;
   margin: 10px 0 0 10px;
   background:
      url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png)
      no-repeat;
}

#placesList .item .marker_1 {
   background-position: 0 -10px;
}

#placesList .item .marker_2 {
   background-position: 0 -56px;
}

#placesList .item .marker_3 {
   background-position: 0 -102px
}

#placesList .item .marker_4 {
   background-position: 0 -148px;
}

#placesList .item .marker_5 {
   background-position: 0 -194px;
}

#placesList .item .marker_6 {
   background-position: 0 -240px;
}

#placesList .item .marker_7 {
   background-position: 0 -286px;
}

#placesList .item .marker_8 {
   background-position: 0 -332px;
}

#placesList .item .marker_9 {
   background-position: 0 -378px;
}

#placesList .item .marker_10 {
   background-position: 0 -423px;
}

#placesList .item .marker_11 {
   background-position: 0 -470px;
}

#placesList .item .marker_12 {
   background-position: 0 -516px;
}

#placesList .item .marker_13 {
   background-position: 0 -562px;
}

#placesList .item .marker_14 {
   background-position: 0 -608px;
}

#placesList .item .marker_15 {
   background-position: 0 -654px;
}

#pagination {
   margin: 10px auto;
   text-align: center;
}

#pagination a {
   display: inline-block;
   margin-right: 10px;
}

#pagination .on {
   font-weight: bold;
   cursor: default;
   color: #777;
}
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
				<li  class="active"><a href="${pageContext.request.contextPath }/">메인페이지</a></li>
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
			<article>
   <!-- 지도 내부 객체 -->
   <div class="map_wrap">
      <!-- 지도에 대한 설정 -->
      <div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;">

      <!-- 카테고리를 나누어 표시한다. -->
         <div id="categorylist" class="category">
              <ul>
                  <li id="allMenu" onclick="changeMarker('all')">
                      <span class="ico_comm ico_coffee"><b>ALL</b></span>
                      모두보기
                  </li>
                  <li id="koreanMenu" onclick="changeMarker('한식')">
                      <div><img height="20px" width="20px" src="resources/images/korea.png"></div>
                      한식
                  </li>
                  <li id="japaneseMenu" onclick="changeMarker('일식')">
                      <div><img height="20px" width="20px" src="resources/images/japan.png"></div>
                     일식
                  </li>
                      <li id="americanMenu" onclick="changeMarker('양식')">
                      <div><img height="20px" width="20px" src="resources/images/usa.png"></div>
                     양식
                  </li>
                      <li id="chineseMenu" onclick="changeMarker('중식')">
                      <div><img height="20px" width="20px" src="resources/images/china.png"></div>
                     중식
                  </li>
                      <li id="cafeMenu" onclick="changeMarker('카페')">
                      <div><img height="20px" width="20px" src="resources/images/cafe.png"></div>
                     카페
                  </li>
                      <li id="otherMenu" onclick="changeMarker('기타')">
                      <div><img height="20px" width="20px" src="resources/images/other.png"></div>
                     기타
                  </li>

              </ul>
          </div>
</div>	
      <!-- 정렬방식 변경 -->
      <div id="menu_wrap" class="bg_white">
         <div class="option">
            <div>
               <!--                <form onsubmit="searchPlaces(); return false;"> -->
               <select id="placelist">
<!--                   <option value="better">평점순</option> -->
                  <option value="range">거리순</option>
                  <option value="view">조회순</option>
               </select>
               <button onclick="searchPlaces()">검색</button>
               <!--                </form> -->
            </div>
         </div>
         <hr>
         <ul id="placesList"></ul>
         <div id="pagination"></div>
      </div>
	
   </div>
   	</article>
   			<footer>
				<form method="POST">
					<input type="button" value="이전으로" onclick="Back()" />
				</form>
			</footer>
			<div id="copyright">
				<ul><li>&copy; Untitled</li><li>Design: <a href="https://html5up.net">HTML5 UP</a></li></ul>
			</div>
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
   <script
      src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script src="http://code.jquery.com/jquery-1.12.1.js"></script>
   <script type="text/javascript"
      src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ec2b54c04ec761a948b34fefea022c0&libraries=services"></script>
   <script type="text/javascript">
   if($('#user').val()==''){
		 alert('로그인 하셔야 사용이가능합니다.');
		 location.href="${pageContext.request.contextPath}";
	 }else{
      var map;
      var mapContainer = document.getElementById("map");
      var markerPosition;
      var mymarker;
      var marketmarker = new Array();
      var latitude = ${x};
      var longitude = ${y};
      var mapoption;
      var geocoder = new kakao.maps.services.Geocoder();
      var placeOverlay = new kakao.maps.CustomOverlay({zIndex : 1}),
         contentNode = document.createElement('div'), 
         currCategory = '';
      var mapOption = {
         center : new daum.maps.LatLng(latitude, longitude) // 지도의 중심좌표
         , level : 6 // 지도의 확대레벨
      };
      
      // 지도를 생성
      map = new daum.maps.Map(mapContainer, mapOption);

      // 마커가 표시될 위치
      markerPosition = new daum.maps.LatLng(latitude, longitude);
      
      
//       function setCategori(menu){
//          var request = new XMLHttpRequest();
//          request.open("GET", "${cpath}/" + id +"?x="+latitude+"&y="+longitude);
//          request.onreadystatechange = function(){
//             if ( request.readyState == 4 && request.status == 200) {
//                document.getElementById(id).innerHTML = request.responseText;
//             }
//          }
//          request.send();
//       }
      var overlaylist = new Array();
      
      var imageSrc = new kakao.maps.MarkerImage("resources/images/mymarker.png", new kakao.maps.Size(27, 35));
      // 마커를 생성
      mymarker = new daum.maps.Marker({
    	 position : markerPosition,
         map : map,
         title : "ME!!",
         image : imageSrc
      });
      var storelist = new Array();
      //storename 배열
      var marketlist = new Array();
      //storeX
      var marketplacelat = new Array();
      //StoreY
      var marketplacelng = new Array();
      //음식종류
      var foodtype = new Array();
      //주소
      var address = new Array();
      //프라이머리 키
      var key = new Array();
      //조회수
      var viewcount = new Array();
      //추천수
//       var good = new Array();
      //전화번호
      var phonenum = new Array();
      //                 db에 있는 여러개 가게 list를 배열로 순차적으로 받게하여 배열순서대로 가게가 들어감.
      <c:forEach items="${storelist}" var="item" >
      storelist.push("${item}");
      marketlist.push("${item.storename}");
      //                    원하는 db값을 배열을 생성한뒤 만들어서 배열에 넣어 사용하는 방식
      phonenum.push("${item.storenumber}");
      //                    storemarker.push("${item.runtime}");
      //                    storemarker.push("${item.parking}");
      //                    storemarker.push("${item.breaktime}");
      //                    storemarker.push("${item.price}");
      foodtype.push("${item.foodtype}");
      //                    storemarker.push("${item.wridate}");
      //                    storemarker.push("${item.writer}");
      viewcount.push("${item.viewcount}");
      address.push("${item.address}");
      key.push("${item.key}");
      marketplacelat.push("${item.adlocationy}");
      marketplacelng.push("${item.adlocationx}");
	  
      //                    storemarker.push("${item.adlocationy}");
      </c:forEach>

      // 마커 이미지의 이미지 주소입니다
      
      var markeroverlay = new Array();
      var koreaflag = "resources/images/koreaflag.png";
      var japanflag = "resources/images/japanflag.png";
      var chinaflag = "resources/images/chinaflag.png";
      var usaflag = "resources/images/usaflag.png";
      var otherflag = "resources/images/otherflag.png";
      var cafeflag = "resources/images/cafeflag.png";
      
      for (var i = 0; i < marketlist.length; i++) {
         // 마커 이미지의 이미지 크기 입니다
         var imageSize = new kakao.maps.Size(28, 42);
         // 마커 이미지를 종류별로 생성합니다 
         if(foodtype[i] == '한식'){
            var markerImage = new kakao.maps.MarkerImage(koreaflag, imageSize);   
         }else if(foodtype[i] == '일식'){
            var markerImage = new kakao.maps.MarkerImage(japanflag, imageSize);   
         }else if(foodtype[i] == '중식'){
            var markerImage = new kakao.maps.MarkerImage(chinaflag, imageSize);   
         }else if(foodtype[i] == '양식'){
            var markerImage = new kakao.maps.MarkerImage(usaflag, imageSize);   
         }else if(foodtype[i] == '카페'){
        	var markerImage = new kakao.maps.MarkerImage(cafeflag, imageSize);
         }else{
            var markerImage = new kakao.maps.MarkerImage(otherflag, imageSize);   
         }
         
         
         var marketplace = new kakao.maps.LatLng(marketplacelat[i], marketplacelng[i]); // 마커를 표시할 위치
         // 마커를 생성합니다
         
         addMarker(marketplace, marketlist[i], address[i], key[i], phonenum[i], markerImage);
         
         
      }
      
      
      function addMarker(marketplace, marketlist, address, key, phonenum, markerImage){
         var marker = new kakao.maps.Marker({
            map : map, // 마커를 표시할 지도
            position : marketplace,
            title : marketlist, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
            image : markerImage
         });
         marketmarker.push(marker);
         
         var content = '<div class="wrap">' + 
         '      <div class="info">' +
         '         <div class="title">' + marketlist +
         '            <div id="close" class="close" onclick="closeOverlay()" title="닫기"></div>' + 
         '        </div>' +
         '        <div class="body">' + 
         '            <div class="img">' +
         '                <img src="viewB?key='+key+'"  width="73" height="70">' +
         '           </div>' + 
         '            <div class="desc">'+ 
         '            <div>'+address +'</div>' +
         '            <h5>'+phonenum+'</h5>'+
         '                <div><a href="${pageContext.request.contextPath}/storeview?key='+ key + '" target="_blank" class="link">예약하기</a></div>' +
         '            </div>' + 
         '        </div>' + 
         '    </div>' +    
         '</div>';
         
         var overlay = new kakao.maps.CustomOverlay({
            content:content,
            map : map,
            position : marketplace
         });
      	overlaylist.push(overlay);
         var closebtn = document.getElementById('close');
         closebtn.addEventListener('click', function (){
        	overlay.setMap(null);
         });

        
        
         //마커 클릭시
         kakao.maps.event.addListener(marketmarker[i], 'click', function() {
           	for(var i =0; i<overlaylist.length; i++){
           		overlaylist[i].setMap(null);
           	}
        	 overlay.setMap(map);            
             });
         kakao.maps.event.addListener(marketmarker[i], 'dbclick', function() {
                       
              });
         overlay.setMap(null);
      }
      
      
      
      function changeMarker(type){
         var allMenu = document.getElementById('allMenu');
         var koreanMenu = document.getElementById('koreanMenu');
         var japaneseMenu = document.getElementById('japaneseMenu');
         var americanMenu = document.getElementById('americanMenu');
         var chineseMenu = document.getElementById('chineseMenu');
         var cafeMenu = document.getElementById('cafeMenu');
         var otherMenu = document.getElementById('otherMenu');
         for(var i =0; i<overlaylist.length; i++){
        		overlaylist[i].setMap(null);
        	}
         
         if(type === 'all'){
            allMenu.className = 'menu_selected';
            koreanMenu.className = '';
            japaneseMenu.className = '';
            americanMenu.className = '';
            chineseMenu.className = '';
            cafeMenu.className = '';
            otherMenu.className = '';
            
            
            setkoreanmarker(map);
            setjapanesemarker(map);
            setamericanmarker(map);
            setchinesemarker(map);
            setcafemarker(map);
            setothermarker(map);
         } else if(type === '한식'){
            
            allMenu.className = '';
            koreanMenu.className = 'menu_selected';
            japaneseMenu.className = '';
            americanMenu.className = '';
            chineseMenu.className = '';
            cafeMenu.className = '';
            otherMenu.className = '';
            
            setkoreanmarker(map);
            setjapanesemarker(null);
            setamericanmarker(null);
            setchinesemarker(null);
            setcafemarker(null);
            setothermarker(null);
         } else if(type === '일식'){
            koreanMenu.className = '';
            allMenu.className = '';
            japaneseMenu.className = 'menu_selected';
            americanMenu.className = '';
            chineseMenu.className = '';
            cafeMenu.className = '';
            otherMenu.className = '';
            
            setkoreanmarker(null);
            setjapanesemarker(map);
            setamericanmarker(null);
            setchinesemarker(null);
            setcafemarker(null);
            setothermarker(null);
            
         }else if(type ==='양식'){
        	 koreanMenu.className = '';
             allMenu.className = '';
             japaneseMenu.className = '';
             americanMenu.className = 'menu_selected';
             chineseMenu.className = '';
             cafeMenu.className = '';
             otherMenu.className = '';
             
             setkoreanmarker(null);
             setjapanesemarker(null);
             setamericanmarker(map);
             setchinesemarker(null);
             setcafemarker(null);
             setothermarker(null);
         }else if(type === '중식'){
        	 koreanMenu.className = '';
             allMenu.className = '';
             japaneseMenu.className = '';
             americanMenu.className = '';
             chineseMenu.className = 'menu_selected';
             cafeMenu.className = '';
             otherMenu.className = '';
             
             setkoreanmarker(null);
             setjapanesemarker(null);
             setamericanmarker(null);
             setchinesemarker(map);
             setcafemarker(null);
             setothermarker(null);
         }else if(type === '카페'){
        	 koreanMenu.className = '';
             allMenu.className = '';
             japaneseMenu.className = '';
             americanMenu.className = '';
             chineseMenu.className = '';
             cafeMenu.className = 'menu_selected';
             otherMenu.className = '';
             
             setkoreanmarker(null);
             setjapanesemarker(null);
             setamericanmarker(null);
             setchinesemarker(null);
             setcafemarker(map);
             setothermarker(null);
         }else if(type === '기타'){
        	 koreanMenu.className = '';
             allMenu.className = '';
             japaneseMenu.className = '';
             americanMenu.className = '';
             chineseMenu.className = '';
             cafeMenu.className = '';
             otherMenu.className = 'menu_selected';
        	 
             setkoreanmarker(null);
             setjapanesemarker(null);
             setamericanmarker(null);
             setchinesemarker(null);
             setcafemarker(null);
             setothermarker(map);
         }
         searchPlaces(type);
      }
      kakao.maps.event.addListener(map, 'dragstart', function(){
    	 for(var i=0; overlaylist.length; i++){
    		 overlaylist[i].setMap(null);	 
    	 }
      });
      function setkoreanmarker(map){
         for(var i=0; i< marketlist.length;i++){
            if(foodtype[i] === '한식'){
               marketmarker[i].setMap(map);
            }
         }
      }
      function setjapanesemarker(map){
         for(var i=0; i< marketlist.length;i++){
            if(foodtype[i] === '일식'){
               marketmarker[i].setMap(map);
            }
         }
      }
      function setchinesemarker(map){
         for(var i=0; i< marketlist.length;i++){
            if(foodtype[i] === '중식'){
               marketmarker[i].setMap(map);
            }
         }
      }
      function setamericanmarker(map){
         for(var i=0; i< marketlist.length;i++){
            if(foodtype[i] === '양식'){
               marketmarker[i].setMap(map);
            }
         }
      }
      function setcafemarker(map){
    	  for(var i=0; i< marketlist.length;i++){
              if(foodtype[i] === '카페'){
                 marketmarker[i].setMap(map);
              }
           }
      }
      function setothermarker(map){
    	  for(var i=0; i< marketlist.length;i++){
              if(foodtype[i] === '기타'){
                 marketmarker[i].setMap(map);
              }
           }
      }
   function setRange() {
         
      for(var i =0; i< marketlist.length-1; i++){
         for(var j=i+1; j<marketlist.length; j++){
            var array = new Array();
            array.push(latitude);
            array.push(longitude);
            array.push(marketplacelat[i]);
            array.push(marketplacelng[i]);
            var array1 = new Array();
            array1.push(latitude);
            array1.push(longitude);
            array1.push(marketplacelat[j]);
            array1.push(marketplacelng[j]);
            if((getDistanceFromLatLonInKm(array))>(getDistanceFromLatLonInKm(array1))){
                var foodt, addr, ki, viewc, gd, marketname, marketx, markety, number, over;
                marketname = marketlist[i];
                marketlist[i] = marketlist[j];
                marketlist[j] = marketname;
                
                marketx = marketplacelat[i];
                marketplacelat[i] = marketplacelat[j];
                marketplacelat[j] = marketx;
                
                markety = marketplacelng[i];
                marketplacelng[i] = marketplacelng[j];
                marketplacelng[j] = markety;
                
                foodt = foodtype[i];
                foodtype[i] = foodtype[j];
                foodtype[j] = foodt;
                
                addr = address[i];
                address[i] = address[j];
                address[j] = addr;
                
                ki = key[i];
                key[i] = key[j];
                key[j] = ki;
                
                viewc = viewcount[i];
                viewcount[i] = viewcount[j];
                viewcount[j] = viewc;
                
                
                number = phonenum[i];
                phonenum[i] = phonenum[j];
                phonenum[j] = number;
                
                over = overlaylist[i];
                overlaylist[i] = overlaylist[j];
                overlaylist[j] = over;
            }
         }
      }
   }
   function setView(){
      for(var i =0; i< marketlist.length-1; i++){
         for(var j=i+1; j<marketlist.length; j++){
            if(viewcount[i]< viewcount[j]){
                var marketname;
                var marketx, markety;
                var foodt, addr, ki, viewc, number;
                var over;
                marketname = marketlist[i];
                marketlist[i] = marketlist[j];
                marketlist[j] = marketname;
                
                marketx = marketplacelat[i];
                marketplacelat[i] = marketplacelat[j];
                marketplacelat[j] = marketx;
                
                markety = marketplacelng[i];
                marketplacelng[i] = marketplacelng[j];
                marketplacelng[j] = markety;
                
                foodt = foodtype[i];
                foodtype[i] = foodtype[j];
                foodtype[j] = foodt;
                
                addr = address[i];
                address[i] = address[j];
                address[j] = addr;
                
                ki = key[i];
                key[i] = key[j];
                key[j] = ki;
                
                viewc = viewcount[i];
                viewcount[i] = viewcount[j];
                viewcount[j] = viewc;
               
                number = phonenum[i];
                phonenum[i] = phonenum[j];
                phonenum[j] = number;
                
                over = overlaylist[i];
                overlaylist[i] = overlaylist[j];
                overlaylist[j] = over;
            }
         }
      }
   }
   
   // 키워드로 장소를 검색합니다
   searchPlaces();
   
   // 키워드 검색을 요청하는 함수입니다
   function searchPlaces() {
       var keyword = document.getElementById('placelist').value;
       
      
       if(keyword === 'range'){
          setRange();
       }else if(keyword === 'view'){
          setView();
       }else{
//           setgood();
       }
       displayPlaces();
       // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
//        ps.keywordSearch( keyword, placesSearchCB); 
   }
   
   // 키워드 검색을 요청하는 함수입니다
   function searchPlaces(type) {
       var keyword = document.getElementById('placelist').value;
       
     
       displayPlaces(type);
       // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
//        ps.keywordSearch( keyword, placesSearchCB); 
   }
   
   
   
   // 검색 결과 목록과 마커를 표출하는 함수입니다
   function displayPlaces() {
      var listEl = document.getElementById('placesList'), 
       menuEl = document.getElementById('menu_wrap'),
       fragment = document.createDocumentFragment(), 
       bounds = new kakao.maps.LatLngBounds(), 
       listStr = '';
       
       // 검색 결과 목록에 추가된 항목들을 제거합니다
       removeAllChildNods(listEl);

       // 지도에 표시되고 있는 마커를 제거합니다
//        removeMarker();
       
           
       for(var i=0; i<marketlist.length; i++ ) {
          // 마커를 생성하고 지도에 표시합니다
          // 평점 추가시 good[i] 추가하기
           var itemEl = getListItem(i, marketlist[i], foodtype[i], address[i], viewcount[i], phonenum[i], key[i]); // 검색 결과 항목 Element를 생성합니다
           itemEl.onmouseover = function () {
        	   for(var j=0; j<overlaylist.length; j++){
             		overlaylist[j].setMap(null);
             	}
        	   overlaylist[i].setMap(map);
           }
           itemEl.onclick = function() {
        	   	overlaylist[i].setMap(map);
           }
           itemEl.onmouseout = function () {
           	overlaylist[i].setMap(null);
           }
         fragment.appendChild(itemEl);
       }

       // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
       listEl.appendChild(fragment);
       menuEl.scrollTop = 0;
   }
   
   // 검색 결과 목록과 마커를 표출하는 함수입니다
   function displayPlaces(type) {
      var listEl = document.getElementById('placesList'), 
       menuEl = document.getElementById('menu_wrap'),
       fragment = document.createDocumentFragment(), 
       bounds = new kakao.maps.LatLngBounds(), 
       listStr = '';
       
       // 검색 결과 목록에 추가된 항목들을 제거합니다
       removeAllChildNods(listEl);

       // 지도에 표시되고 있는 마커를 제거합니다
//        removeMarker();
       
       for(var i=0; i<marketlist.length; i++ ) {
          // 마커를 생성하고 지도에 표시합니다
          
          if(type === foodtype[i]){
            var itemEl = getListItem(i, marketlist[i], foodtype[i], address[i], viewcount[i], phonenum[i], key[i]); // 검색 결과 항목 Element를 생성합니다
            itemEl.onmouseover = function () {
            	for(var j =0; j<overlaylist.length; j++){
              		overlaylist[j].setMap(null);
              	}
            	overlaylist[i].setMap(map);
            }
            itemEl.onclick = function(){
         	   	overlaylist[i].setMap(map);
            }
            itemEl.onmouseout = function () {
            	overlaylist[i].setMap(null);
            }
            fragment.appendChild(itemEl);
           
          }else if(type === 'all' || type === undefined){
            var itemEl = getListItem(i, marketlist[i], foodtype[i], address[i], viewcount[i], phonenum[i], key[i]); // 검색 결과 항목 Element를 생성합니다
            itemEl.onmouseover = function () {
            	for(var j =0; j<overlaylist.length; j++){
              		overlaylist[j].setMap(null);
              	}
            	overlaylist[i].setMap(map);
            }
            itemEl.onclick = function(){
         	   	overlaylist[i].setMap(map);
            }
            itemEl.onmouseout = function () {
            	overlaylist[i].setMap(null);
            }
            fragment.appendChild(itemEl);   
          }
        
       }

       // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
       listEl.appendChild(fragment);
       menuEl.scrollTop = 0;
   }
   
   function displayInfowindow(overlaylist) {
	  overlaylist.setMap(map);
	}
   // 검색결과 항목을 Element로 반환하는 함수입니다
   function getListItem(index, marketlist, foodtype, address, viewcount, phonenum, key) {
       var el = document.createElement('li'),
       itemStr = '        <span class="listimg">' +
      '           <img src="viewB?key='+key+'" width="73" height="110">' +
      '           </span>' + 
      '<span class="desc">' +
                   '   <h4>' + marketlist + '</h4>';
      itemStr += '    <span>' +  address  + '</span>'; 
       itemStr += '  <span class="tel">' + phonenum  + '</span>' +
                   '</span>';           

       el.innerHTML = itemStr;
       el.className = 'item';
      
       return el;
   }
   // 검색결과 목록의 자식 Element를 제거하는 함수입니다
   function removeAllChildNods(el) {   
       while (el.hasChildNodes()) {
           el.removeChild(el.lastChild);
       }
   }
   
   function getDistanceFromLatLonInKm(array) {
       var lat1 = array[0];
       var lng1 = array[1];
       var lat2 = array[2];
       var lng2 = array[3];
       
       //거리계산
       function deg2rad(deg) {
           return deg * (Math.PI/180)
       }
       var r = 6371; //지구의 반지름(km)
       var dLat = deg2rad(lat2-lat1);
       var dLon = deg2rad(lng2-lng1);
       var a = Math.sin(dLat/2) * Math.sin(dLat/2) + Math.cos(deg2rad(lat1)) * Math.cos(deg2rad(lat2)) * Math.sin(dLon/2) * Math.sin(dLon/2);
       var c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
       var d = r * c; // Distance in km
       return Math.round(d*1000);
   }
   var menuwrap = document.getElementById("menu_wrap");
   menuwrap.addEventListener("click", function(){
	   for(var i =0; i<overlaylist.length; i++){
      		overlaylist[i].setMap(null);
      	}
   });
	 }
   function Back(){
	   history.go(-1);
   }
   </script>
   <input id="user" type="hidden" value="${member.userid }">
   <a href="searchmap" style="text-decoration: none">지도가 보이지 않습니다.</a>

</body>
</html>