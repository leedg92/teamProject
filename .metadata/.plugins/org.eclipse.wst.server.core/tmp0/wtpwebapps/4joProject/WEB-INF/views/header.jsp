<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
<link href="https://fonts.googleapis.com/css?family=Montserrat:500&display=swap" rel="stylesheet">


<title>Insert title here</title>
</head>
<body>
     <header>
           
            
             <div>
            <nav>
             <a href="${pageContext.request.contextPath }"><img class="logo" src="${pageContext.request.contextPath}/resources/images/logo.png" alt="logo"/></a>
            
                <ul class="nav__links">
                
                    <li><a href="community">Community</a></li>
                    <li><a href="#">주변 맛집</a></li>
                    <li><a href="#">맛집 검색</a></li>
                    <li><a class="cta" href="#" style="float:right; margin-left: 500px;">user id</a></li>
                </ul>
            </nav>
<!--             <div class="search-box"> -->
<!--       			 <input type="text" name="" class="search-txt" placeholder="Type to search"/> -->
<!--        			<a class="search-btn" href="#"> -->
<!--       			 <i class="fas fa-search"></i> -->
<!--       		 </a> -->
<!--             </div> -->
            	
      		 </div>
      		 <hr>
            
     		
            
            <p onclick="openNav()" class="menu cta">Menu</p>
        </header>

</body>
</html>