<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="margin: 20px;">
							<button style="position: absolute; margin-left: 20px;" class="button primary small" id="gdgd">정보 수정</button>
							</div>
							<input type="checkbox" id="popup"><label style="visibility: hidden;" for="popup">변경</label>
								<div>
									<div>			
										<%@include file="mystoreModify.jsp" %>
									<label for="popup"></label>
									</div>
									<label for="popup"></label>
								</div>
							<div>
								<c:forEach begin="1" end="${blobsize }" var="i">
									<img width="200px" src="myStoreImage?key=${myStore.key }&num=${i}">
								</c:forEach>
							</div>

						<table>
							<tr>
								<th>가게명</th>
								<td>${myStore.storename }</td>			
							</tr>
							<tr>
								<th>음식 분류</th>
								<td>${myStore.foodtype }</td>
							</tr>
							<tr>
								<th>주소</th>
								<td>${myStore.address }</td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td>${myStore.storenumber }</td>
							</tr>
							<tr>
								<th>운영시간</th>
								<td>${myStore.runtime }</td>
							</tr>
							<tr>
								<th>브레이크타임</th>
								<td>${myStore.breaktime }</td>
							</tr>
							<tr>
								<th>평균 가격</th>
								<td>${myStore.price }</td>
							</tr>

						</table>
</body>
</html>