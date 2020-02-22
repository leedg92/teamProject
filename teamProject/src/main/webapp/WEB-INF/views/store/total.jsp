<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
			<h2>총 숫자 : <span id="maxnum">${max}</span><br></h2>
			<h2></h2>
	<h2><span id='mynum'></span></h2>
	<br>


	<script>
		$(function(){
			setInterval(function() {
				$.ajax({
					type : "POST",
					dataType : 'text',
					data : "key="+$('#key').val(),
					url : "getMaxNum",
					success : function(data) {
						document.getElementById("maxnum").innerHTML = data;
					}
					});
				}, 3000);
			setInterval(function() {
				$.ajax({
					type : "POST",
					dataType : 'text',
					data : "userid="+$('#userid').val()+"&key="+$("#key").val(),
					url : "getmynum",
					success : function(data) {
						document.getElementById("mynum").innerHTML = '내 번호 : '+data;
						if(data==0) {
							$('#sbbutton').css("display","block");
							document.getElementById("mynum").innerHTML = '';
						}
						
					}
					});
				}, 3000);
		});
	</script>
	
	
	<form action="${pageContext.request.contextPath }/total" method="post">
	<input type="submit" value="번호 예약" id="sbbutton" style="display: none;">
	<input type="hidden" id="userid" name="userid" value="${member.userid }">
	<input type="hidden" id="key" name="key" value="${board.key }">
	</form>

	