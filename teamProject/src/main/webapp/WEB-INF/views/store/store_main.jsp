<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Massively by HTML5 UP</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="resources/assets/css/main.css" />
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://kit.fontawesome.com/5f6c379a3f.js" crossorigin="anonymous"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<style>
   a{
      all:unset;
   }
</style>
<style>
   a{
    cursor: pointer;
   }
</style>

</head>
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
            <li  class="active"><a href="${pageContext.request.contextPath }/storemain">맛집</a></li>
            <li><a href="${pageContext.request.contextPath }/community">커뮤니티</a></li>
         </ul>
      </nav>
      <nav id="nav1">
         <ul class="links">
            <li><a href="${pageContext.request.contextPath }/myPage">마이페이지</a></li>
            <li><a href="${pageContext.request.contextPath }/logout">로그아웃</a></li>
         </ul>
      </nav>

      <div id="main">
         <article class="post featured" style="height: 800px;">
         
            <header class="major">
            
               <!-- Best5 -->
               <span class="date">Best5</span>
                  <%@include file="store_best5.jsp"%>
                  
            </header>
         </article>

         <!-- 음식점 메인 -->
         <article>
            <div>
            <form style="all: unset;">
               <select style="display:inline-block; width: 100px;" name="type" id="type">
                  <option value="foodtype">음식종류
                  <option value="raname">식당이름
                  <option value="writer">작성자
                  <option value="address">주소
               </select>
               <input style="height: 3.10rem;" name="search" id="search">
               <button class="button primary icon solid fa-search">찾기</button>
            </form>
            <br><br>
            </div>
            <div>
                        <table>
                  <c:forEach var="board" items="${boardList }">
                     <tr>
                        <td><a style="text-decoration: none;" href="${pageContext.request.contextPath }/storeview?key=${board.key }">${board.storename }</a><br>
                           <img width="150px" height="150px" style="size: auto;"
                                    src="store_viewBlob?key=${board.key }">
                        </td>
                        <td width="60%">
                        <label>작성자 : ${board.writer }</label>
                        <label>가격 : ${board.price }</label>
                        </td>
                     </tr>
                  </c:forEach>
               </table>
            </div>

         
                  </article>


         <footer>
            <div class="pagination">
               <c:forEach begin="1" end="${listSize }" var="i">
                  <a href="${pageContext.request.contextPath }/storemain?page=${i}&type=${type}&search=${search}" class="page ${page eq i ? 'active' : ''}">${i }</a>
               </c:forEach>
            </div>
         </footer>
         <div id="copyright">
            <ul><li>&copy; Untitled</li><li>Design: <a href="https://html5up.net">HTML5 UP</a></li></ul>
         </div>
      </div>
   </div>


   <input id="user" type="hidden" value="${member.userid }">
   <!-- Scripts -->
      <script src="resources/assets/js/jquery.min.js?ver=2"></script>
      <script src="resources/assets/js/jquery.scrollex.min.js?ver=3"></script>
      <script src="resources/assets/js/jquery.scrolly.min.js?ver=4"></script>
      <script src="resources/assets/js/browser.min.js?ver=5"></script>
      <script src="resources/assets/js/breakpoints.min.js?ver=6"></script>
      <script src="resources/assets/js/util.js?ver=7"></script>
      <script src="resources/assets/js/main.js?ver=8"></script>
</body>
</html>