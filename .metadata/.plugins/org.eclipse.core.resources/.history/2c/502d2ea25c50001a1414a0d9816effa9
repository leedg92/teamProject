<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
　　table.sample { 
　　　width: 520px; 
　　}
     
　　table.sample td { 
    　width:100%;
    　border: 1px solid #c7c7bc; 
    　color: #404040; 
 　  }
  
　　table.sample td a{
    　display:block;
    　width:100%;
      height:100%;
 　  } 
　　table.sample td a:hover{
　　  background-color: #f49d9d;
 　  } 
  </style>     
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
<!-- <script type="text/javascript" src="js/addons/datatables.min.js"></script> -->
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
</head>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				<li><a href="${pageContext.request.contextPath }/">메인페이지</a></li>
				<li><a href="${pageContext.request.contextPath }/storemain">맛집</a></li>
				<li class="active"><a href="${pageContext.request.contextPath }/community">커뮤니티</a></li>
			</ul>
		</nav>
		<nav id="nav1">
			<ul class="links">
				<li><a href="${pageContext.request.contextPath }/myPage">마이페이지</a></li>
				<li><a href="${pageContext.request.contextPath }/logout">로그아웃</a></li>
			</ul>
		</nav>

	<div id="main">
	
	
	
	<section>
		<table border="1" style="width: 100%; height: 200px; table-layout: fixed;" class="sample">
				<tr>
<!-- 					<th>글 번호</th> -->
					<th>제목</th>
					<th>본문</th>
					<th>글쓴이</th>
				</tr>
				
			<c:forEach var="file" items="${list }" varStatus="st">	
			<tr>
<%-- 				<td style="width: 20%;"><a href="board?bnum=${file.bnum}">${file.bnum }</a></td> --%>
				<td style="width: 20%;"><a href="board?bnum=${file.bnum}">${file.title }</a></td>
				<td style="width: 50%; text-overflow:ellipsis; overflow:hidden; white-space:nowrap;"><a href="board?bnum=${file.bnum}"><img src="viewBlob?filename=${file.STORED_FILE_NAME }" style="height: 80px; width: 150px;">${file.context }</a></td>
				<td style="width: 10%;"><a href="board?bnum=${file.bnum}">${file.userid}</a></td>		
			</tr>
			
			</c:forEach>		
			</table>
			<c:forEach var="i" items="${pageCount }" varStatus="st">
				<a href="community?page=${i }">${i }</a>
			</c:forEach>
			<br>

			

		 <input type="button" value="글쓰기" onclick="location.replace('${pageContext.request.contextPath}/communityWriteForm')">
		 <input type="button" value="메인으로" onclick="location.replace('${pageContext.request.contextPath}')">
	</section>
</div>
		<div id="copyright">
			<ul><li>&copy; </li></ul>
		</div>
		<input id="user" type="hidden" value="${member.userid }">
		
		<script src="resources/assets/js/jquery.min.js?ver=2"></script>
		<script src="resources/assets/js/jquery.scrollex.min.js?ver=3"></script>
		<script src="resources/assets/js/jquery.scrolly.min.js?ver=4"></script>
		<script src="resources/assets/js/browser.min.js?ver=5"></script>
		<script src="resources/assets/js/breakpoints.min.js?ver=6"></script>
		<script src="resources/assets/js/util.js?ver=7"></script>
		<script src="resources/assets/js/main.js?ver=8"></script>
</body>
</html>