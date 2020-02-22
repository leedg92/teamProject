<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<script type="text/javascript">
	$(function() {
		  $('#btn').click(function() {
		   $.ajax({ 
		    type : "GET",
		    //dataType: "json",
		    dataType : 'json',
		    data : "type="+$('#type').val()+"&search="+$("#search").val(),
		    url : "test",
		    success : function(data) {
		    		alert(data.writer);
		    	},
		   error:function(data){
			   alert(data);
		   }
		    });
		   });
		  });
	</script>
	<select name="type" id="type">
		<option value="foodtype">음식종류
		<option value="raname">식당이름
		<option value="writer">작성자
		<option value="address">주소
	</select>
	<input name="search" id="search">
	<input type="button" id="btn" value="검색">
</body>
</html>