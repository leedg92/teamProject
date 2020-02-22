<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Massively by HTML5 UP</title>
<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="resources/assets/css/main.css" />
</head>

<body>

	<!-- Wrapper -->
	<div id="wrapper" class="fade-in">

		<!-- 헤더 -->
		<header id="header">
			<a href="${pageContext.request.contextPath}/" class="logo">맛.ZIP</a>
		</header>

		<!-- 상단 바 -->
		<nav id="nav">
			<ul class="links">
				<li><a
					href="${pageContext.request.contextPath }/">게시판</a></li>
				<li ><a
					href="myPage">마이페이지</a></li>
				<li><a 
					href="${pageContext.request.contextPath }/community">커뮤니티</a></li>
			</ul>
		</nav>

		<div id="main">
			<article class="post featured" style="height: 1500px;">
				<header class="major">
					<span style="font-size: large;" class="date">게시글 작성</span>
					<section style="all: unset;">
							<form style="all: unset;" method="post" enctype="multipart/form-data">
										<label>음식점 이름</label>
										${member.username }					
									
										<label>작성자</label>
										${member.userid }
																			
										<label>전화번호</label>
										<input name="storenumber"/>
									
									
										<label>주소</label>
										<%@include file="add_adress.jsp" %>
									
										<label>운영 시간</label>
										<input name="runtime"/>
									
									
										<label>쉬는 시간</label>
										<input name="breaktime"/>
									
									
										<label>음식 종류</label>
										<div class="col-6 col-12-small">
											<input type="radio" id="foodtype1" name="foodtype" value="한식" required>
											<label for="foodtype1">한식</label> &nbsp;
											<input type="radio" id="foodtype2" name="foodtype" value="중식" required>
											<label for="foodtype2">중식</label>
											<input type="radio" id="foodtype3" name="foodtype" value="양식" required>
											<label for="foodtype3">양식</label>
										</div>				
									
										<label>평균 가격대</label>
										<input name="price"/>
										
										<label>음식사진</label>
										<p><input type="file" name="file">
										
										<input type="file" name="file">
										<input type="file" name="file">
										<input type="file" name="file">
										<input style="visibility: hidden;" type="file" name="file">
										</p>
										<div align="center">
											<input type="button" value="돌아가기" onclick="location.replace('${pageContext.request.contextPath}/')">
												<input type="submit" value="작성" />
										</div>
							</form>
						</section>
				</header>
			</article>
			<div id="copyright"> </div>
		</div>
	</div>

</body>
</html>