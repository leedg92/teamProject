<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
	<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
	<link rel="stylesheet" href="//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.css">
	<script src="//cdn.rawgit.com/fgelinas/timepicker/master/jquery.ui.timepicker.js"></script>
	<script src="//code.jquery.com/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>예약 수정 페이지</title>


<script>
	$(function(){
		var resname = $("#resname").val();
		
		$.ajax({
			url: "getUser",
			method: "GET",
			data: {resname: resname},
			dataType: "text",
			success: function(data2){
				if(jQuery.isEmptyObject(data2)){
					$("#listMsg").text('예약자가 존재 하지 않습니다.\n');
					$("#listView").html('');
				}
				else{
					var obj = JSON.parse(data2);
					$("#chName").val(obj['resname']);
					var html = '<ul>';
					for(key in obj){
						html += '<li>' + obj[key] + '</li>';
					}
					html += '</ul>'
						$("#listMsg").text(resname);
					$("#listView").html(html);
					$("#Open")
				}
			},
			error: function(data2){
				$("#listView").text('서버와의 연결이 실패');
			}
		})
	});
</script>
</head>
<body>


<h1>예약 수정</h1>

예약자 검색: <input id="resname" value="${resname }" placeholder="이름"> <input id="search" type="button" value="Search" onclick="getUser();">
<div id="listMsg"></div>
<div id="listView"></div>
<hr>
<%@include file="calendar.jsp" %>
	<script>
		$(function(){
			//에약자 검색 후 변경사항 
			
			$("#Open").hide();
			$("#search").click(function(){
				
				$("#Open").show();
			})
			
			
			//날짜 변경 
			 
			$("#chDate").hide();
			$("#selec").change(function(){
				if($("#selec").val() == "1"){
					$("#chDate").show();
				}else{
					$("#chDate").hide();
				}
			 })
			 
			//시간 변경 
			$('.chHour').hide();
			$("#selec").change(function(){
				if($("#selec").val() == "2"){
					$('.chHour').show();
				}else{
					$('.chHour').hide();
				}
				
			})
			

			
			//인원 수 변경
			
				$("#chPeople").hide();
				$("#selec").change(function(){
					if($("#selec").val() == "3"){
						$("#chPeople").show();
							$("#chPeople").append('<option>1</option>','<option>2</option>','<option>3</option>','<option>4</option>','<option>5</option>',
												  '<option>6</option>','<option>7</option>','<option>8</option>','<option>9</option>','<option>10</option>')
					}else{
						$("#chPeople").hide();
					}
				})
				

		});
		
	</script>
<div id="Open">

<!-- 상단의 select box에서  선택 시 나타날 input box -->
<form action="reserModify" method="POST">
<select id="selec" name="type">
	<option value="0">변경 사항 선택</option>
	<option value="1" >날짜 변경</option>
	<option value="2" >시간 변경</option>
<!-- 	<option value="3" >이름변경</option> -->
	<option value="3" >인원변경</option>
<!-- 	<option value="5">연락처변경</option> -->
</select>
<input type="text" id="chDate" name="resdate">
<input type="text" class='chHour' name="reshour">
<input  type="hidden" id="chName" name="resname">
<select id="chPeople" name="respeople">
	<option>명</option>
</select>
<!-- <input type="text" id="chNum" name="resnum"> -->
<hr>
<input type="submit" value="변경">
</form>
</div>
</body>
</html>