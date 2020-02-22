<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" %>
<% request.setCharacterEncoding("utf-8"); %>
<% response.setContentType("text/html; charset=utf-8"); %>

<html>
<head>
</head>
<body>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ec2b54c04ec761a948b34fefea022c0&libraries=services"></script>
<script>
 $(function() {
  $('#AjaxStart').click(function() {
   $("#map").css('display','block');
   $.ajax({ 
    type : "POST",
    //dataType: "json",
    dataType : 'text',
    data : "test1="+$("#address").val(),
    url : "add_adress",
    success : function(data) {
       var infowindow = new kakao.maps.InfoWindow({zIndex:1});

       var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
           mapOption = {
               center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
               level: 3 // 지도의 확대 레벨
           };  

       // 지도를 생성합니다    
       var map = new kakao.maps.Map(mapContainer, mapOption); 

       // 장소 검색 객체를 생성합니다
       var ps = new kakao.maps.services.Places(); 

       // 키워드로 장소를 검색합니다
       ps.keywordSearch(data, placesSearchCB); 

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

           // 마커에 클릭이벤트를 등록합니다
           kakao.maps.event.addListener(marker, 'click', function() {
               // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
//                infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
//                infowindow.open(map, marker);
//                location.replace('${pageContext.request.contextPath}?name='+place.address_name+'&x='+place.x);
            $.ajax({ 
               type : "POST",
                dataType : 'text',
                data : "address="+place.address_name,
                url : "checkAddress",
                success : function(data) {
                   if(data=='true'){
                        $("#address").val(place.address_name);
                        $("#adlocationx").val(place.x);
                        $("#adlocationy").val(place.y);
                         $("#map").css('display', 'none');
                         $("#storename").val(place.place_name);
                         document.getElementById("top").innerHTML = place.place_name;
                   }
                   else {
                      $("#address").val(' ');
                      alert("이미 등록된 음식점입니다");
                   }
                },
            })
           });
           
           kakao.maps.event.addListener(marker, 'mouseover', function() {
               // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
               infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
               infowindow.open(map, marker);
           });
           
           kakao.maps.event.addListener(marker, 'mouseout', function() {
               // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
               infowindow.close();
           });
       }
    }
   });
  });
 });
</script>
<input  id="address" name="address" placeholder="ex)이태원 맛집" value="${myStore.address }" required>
<input type="hidden" id="adlocationx" name="adlocationx" value="${myStore.adlocationx}">
<input type="hidden" id="adlocationy" name="adlocationy" value="${myStore.adlocationy}">
<input type="button" id="AjaxStart" value="검색">
<div id="map" style="width:100%;height:350px; display: none;"></div>

</body>
</html>