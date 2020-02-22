<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>디스 이즈 지도</title>
</head>
<style>
.map_wrap {position:relative;overflow:hidden;width:100%;height:350px;}
.radius_border{border:1px solid #919191;border-radius:5px;}     
.custom_typecontrol {position:absolute;top:10px;right:10px;overflow:hidden;width:130px;height:30px;margin:0;padding:0;z-index:1;font-size:12px;font-family:'Malgun Gothic', '맑은 고딕', sans-serif; text-align:center; cursor:pointer;}
</style>
<body>
	<div class="map_wrap">
	<div id="map" style="width: 100%; height:100%; position:relative;overflow:hidden;"></div>
		<div class="custom_typecontrol radius_border" onclick="Pcode()">
			주소로 위치 설정
		</div>
	</div>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ec2b54c04ec761a948b34fefea022c0&libraries=services"></script>
	<script type="text/javascript">
		var map;
		var mapContainer = document.getElementById("map");
		var markerPosition;
		var marker;
		var geocoder = new daum.maps.services.Geocoder();
		var infowindow;
		var latitude;
		var longitude;
		var mapoption;
	
			 function getLocation(position) {
	            latitude = position.coords.latitude;
	            longitude = position.coords.longitude;
	        	var mapOption = {
	            		enableHighAccuracy: true,	            		
	                   	center : new daum.maps.LatLng(latitude, longitude) // 지도의 중심좌표
                		, level : 5    // 지도의 확대레벨
            	};
	            
	            // 지도를 생성
	            map = new daum.maps.Map(mapContainer, mapOption);
			
	            // 마커가 표시될 위치
	            markerPosition = new daum.maps.LatLng(latitude, longitude);

	            // 마커를 생성
	            marker = new daum.maps.Marker({ 
	            	position:markerPosition,
	            	draggable: true,
	            	map : map
	            	});
				
	            var iwContent = '<div style="padding:5px;">현 위치 지정!</div>',
	            iwPosition = new kakao.maps.LatLng(33.450701, 126.570667); //인포윈도우 표시 위치입니다

	        // 인포윈도우를 생성합니다
	        infowindow = new kakao.maps.InfoWindow({
	            position : iwPosition, 
	            content : iwContent, 
	            removable : true
	        });
	        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	            // 마커 위에 인포윈도우를 표시합니다
	        	alert('위치가 '+mouseEvent.latLng.toString());
	            marker.setPosition(mouseEvent.latLng);
	    	});
	          kakao.maps.event.addListener(marker, 'mouseover', function() {
	        	  // 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
	        	    infowindow.open(map, marker);
	        	});

// 	        	// 마커에 마우스아웃 이벤트를 등록합니다
	        	kakao.maps.event.addListener(marker, 'dragstart', function(ondragstart) {
	        	  
	        	    infowindow.close();
	        	});
	        	kakao.maps.event.addListener(marker, 'dragend', function(ondragend) {
		        	  
	        		 infowindow.open(map, marker);
	        	});
	        	kakao.maps.event.addListener(marker, 'mouseout', function() {
	        		// 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다  
	        	    infowindow.close();
	        	});
	        	
	        	kakao.maps.event.addListener(marker, 'click', function(){
	        		getXY();
	        	});
	        	
	        	
	        }
				
			 //주소를 입력받아 객체의 위도 경도 가져오는 법
			 function Pcode(){
				 	new daum.Postcode({
						oncomplete: function(data){
							var addr = data.address; 
							//최종 주소 담을 변수
							alert(addr);
							geocoder.addressSearch(data.address, function(results, status) {
								if(status === daum.maps.services.Status.OK){
									var result = results[0]; 
									// 첫번 째 결과 값 활용??
									var coords = new daum.maps.LatLng(result.y, result.x);
									 // 해당 주소의 위치 경도, 위도를 받아와서
									mapContainer.style.display = "block";
									map.relayout();
									map.setCenter(coords);
									marker.setPosition(coords)
								}
							});
						}
					}).open();
				}
			    	if(window.navigator.geolocation) {
			            window.navigator.geolocation.getCurrentPosition(getLocation, function(error) {
			                consol.log(error.message);    
			            });
			        }else {
			            alert('Geolocation을 지원하지 않는 브라우저 입니다.');
			        }

	
	 function getXY(){
		 //버튼을 눌러서 위도 경도를 넘겨줌 -1
		 
		 var latitude = marker.getPosition().getLat();
		 var longitude = marker.getPosition().getLng();
		 post_to_url("http://192.168.0.92:8080/teamProject/", {"x":latitude, "y":longitude});
// 		 location.href='http://localhost:8080/fileupload/map?x='+x+'&y='+y;
	 }
	 //경로로 넘길때 파라미터를 POST로 넘기는법 - 2
	 function post_to_url(path, params, method) { 
		    method = method || "post"; 
		    var form = document.createElement("form");
		    form.setAttribute("method", method);
		    form.setAttribute("action", path);

		    for(var key in params) {
		        var hiddenField = document.createElement("input");
		        hiddenField.setAttribute("type", "hidden");
		        hiddenField.setAttribute("name", key);
		        hiddenField.setAttribute("value", params[key]);
		        form.appendChild(hiddenField);
		    }
		    document.body.appendChild(form);
		    form.submit();
		}
	 
	 

	</script>
	<a href="searchmap" style="text-decoration: none">지도가 보이지 않습니다.</a>
	<form method="POST">
	<input type="button" value="여기로 지정" onclick="getXY()"/>
	</form>
</body>
</html>