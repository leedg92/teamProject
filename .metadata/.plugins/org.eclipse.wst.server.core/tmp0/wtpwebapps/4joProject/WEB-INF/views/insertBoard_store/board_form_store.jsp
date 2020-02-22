<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 등록(내 가게)</title>
</head>
<body>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0ec2b54c04ec761a948b34fefea022c0&libraries=services"></script>

	<h1>내 가게 등록</h1>
	<hr>
	<form method="POST">
		<p>가게명 <input name="storename"></p>
		<p>전화번호<input name="storenumber"></p>
		<p>영업시간<input name="runtime"></p>
		<p>주차여부<input name="parking" type="radio" value="o">가능
				<input name="parking" type="radio" value="x">불가능</p>
		<p>Break Time<input name="breaktime"></p>
		<p>가격<input name="price"></p>
		<p>음식 종류<select name="foodtype">
			<option value="한식">한식</option>
			<option value="중식">중식</option>
			<option value="양식">양식</option>
			<option value="일식">일식</option>
			<option value="세계음식">세계음식</option>
			<option value="카페">카페</option>
			<option value="술">술</option>
		</select></p>
		주소

		<script>
		 $(function() {
		  $('#AjaxStart').click(function() {
		   $("#map").css('display','block');
		   $.ajax({ 
		    type : "POST",
		    //dataType: "json",
		    dataType : 'text',
		    data : "test1="+$("#var1").val(),
		    url : "ajax",
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
		//     	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
		//     	        infowindow.open(map, marker);
		//     	        location.replace('${pageContext.request.contextPath}?name='+place.address_name+'&x='+place.x);
						$.ajax({ 
							type : "POST",
						    dataType : 'text',
						    data : "address="+place.address_name,
						    url : "checkAddress",
						    success : function(data) {
						    	if(data=='true'){
						    		  $("#var1").val(place.address_name);
						    	      $("#map").css('display', 'none');
						    	}
						    	else {
						    		$("#var1").val(' ');
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
		<input type="text" id="var1" name="address">
		<input type="button" id="AjaxStart" value="검색">
		<div id="map" style="width:100%;height:350px; display: none;"></div>
	
		<p><input type="submit" value="등록"></p>
	</form>
</body>
</html>