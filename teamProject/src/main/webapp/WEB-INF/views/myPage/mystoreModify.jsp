<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function CancelEnterKey(){
		var evt = (evt) ? evt : ((event) ? event : null);
		var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
		if ((evt.keyCode == 13) && (node.type == "text")) { return false; }
	}
	document.onkeypress = CancelEnterKey;
</script>
</head>
<body>
<section style="all: unset;">
		<form style="all: unset; text-align: center;" action="mystoreModify" method="POST" enctype="multipart/form-data">				
					<input type="hidden" name="key" value="${myStore.key }">	
					<input type="hidden" id="storename" name="storename"/>			
					<label style="margin-top: 100px;">전화번호</label>
					<div style="text-align: center;"><input name="storenumber" value="${myStore.storenumber }" required/></div>
				
					<label>주소</label>
					<div style="text-align: center;"><%@include file="../insertBoard_store/add_adress.jsp" %></div>
				
					<label>운영 시간</label>
					<div style="text-align: center;"><input name="runtime" value="${myStore.runtime }" required/></div>
				
					<label>쉬는 시간</label>
					<div style="text-align: center;"><input name="breaktime" value="${myStore.breaktime }" required/></div>
				
					<label>음식 종류</label>
					<div style="text-align: center;"><input name="foodtype" placeholder="ex)한식" value="${myStore.foodtype }" required></div>

				
					<label>평균 가격대</label>
					<div style="text-align: center;"><input name="price" value="${myStore.price }" required/></div>
					

					<div align="center" style="margin-top: 50px;">
						<input type="submit" value="작성" />
					</div>
					</form>
	</section>
</body>
</html>