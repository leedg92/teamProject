<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<head>
<script>
   $(function() {
      $('.prevbutton').click(function(e) {
         e.preventDefault();

         // 이미지 현재의 위치 
         var imgOn = $("#imgBox").find(".on").index();
         // 이미지 총 개수 
         var imgLen = $("#imgBox .mvimg").length;
         console.log(imgOn)
         // imgBox안의 img 중 imgOn 번째의 on 클래스 삭제 
         $("#imgBox .mvimg").eq(imgOn).removeClass("on");
         // imgBox안의 img 중 imgOn 번째 숨기기 
            $("#imgBox .mvimg").eq(imgOn).css("display", "none");
         // 이전의 위치로 돌아가야함으로 
         imgOn = imgOn - 1;
         if (imgOn < 0) {
            // 돌아가 위치가 -1일 경우 
            // 이미지의 마지막으로 돌아간다 
            $("#imgBox .mvimg").eq(imgOn).css("display", "inherit");
            $("#imgBox .mvimg").eq(imgOn).css("opacity", 0);
            $("#imgBox .mvimg").eq(imgOn).animate({opacity: "1"},100);
            $("#imgBox .mvimg").eq(imgLen - 1).addClass("on");
         } else {
            // 돌아갈 위치가 -1이 아닌 경우
            $("#imgBox .mvimg").eq(imgOn).css("display", "inherit");
            $("#imgBox .mvimg").eq(imgOn).css("opacity", 0);
            $("#imgBox .mvimg").eq(imgOn).animate({opacity: "1"},100);
            $("#imgBox .mvimg").eq(imgOn).addClass("on");
         }
      });
      
      $('.nextbutton').click(function(e) {
         e.preventDefault();
         // 위에 동일
         var imgOn = $("#imgBox").find(".on").index();
         var imgLen = $("#imgBox .mvimg").length;
         // 위에 동일
         $("#imgBox .mvimg").eq(imgOn).removeClass("on");
         $("#imgBox .mvimg").eq(imgOn).css("display", "none");

         // 다음의 위치로 알아야 되기 때문에
         imgOn = imgOn + 1;
         if (imgOn === imgLen) {
            // 다음의 위치가 총 개수보다 클 경우
            // 처음의 위치로 돌아간다
            $("#imgBox .mvimg").eq(0).css("display", "inherit");
            $("#imgBox .mvimg").eq(0).css("opacity", 0);
            $("#imgBox .mvimg").eq(0).animate({opacity: "1"},300);
            $("#imgBox .mvimg").eq(0).addClass("on");
         } else {
            // 다음 위치가 있는 경우
            $("#imgBox .mvimg").eq(imgOn).css("display", "inherit");
            $("#imgBox .mvimg").eq(imgOn).css("opacity", 0);
            $("#imgBox .mvimg").eq(imgOn).animate({opacity: "1"},300);
            $("#imgBox .mvimg").eq(imgOn).addClass("on");
         }
      });
   });
</script>
<style>
.mvimg {
   width: 500px;
   height: 500px;
   display: none;
   background-size: cover;
}

.mvimg:first-child {
   display: inherit;
   background-size: cover;
}

.best5Label{
   color: white;
   text-shadow: yellow;
}

.nextbutton{
   all: unset;
}
.nextbutton img{
   all: unset;
   -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
   width: 6em;
   height: 6em;   
   cursor: pointer;
}
.prevbutton{
   all: unset;
}
.prevbutton img{
   all: unset;
   -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
   width: 6em;
   height: 6em;
   cursor: pointer;
   -moz-transform: scaleX(-1);
   -o-transform: scaleX(-1);
   -webkit-transform: scaleX(-1);
   transform: scaleX(-1);
}

.imgBox img{
   text-align: center;
}
</style>
</head>
<body>
<div id="imgBox" align="center">
                     <div class="mvimg on"
                        style="background-image: url('store_viewBlob?key=${bestBoard[0].key }');">
                        <div style="height: 200px;"></div>
                        <div style="height: 200px;">
                        <button style="float: left;" class="prevbutton">
                           <img src="resources/images/arrow.svg">
                        </button>
                        <button style="float: right;" class="nextbutton">
                           <img src="resources/images/arrow.svg">
                        </button>
                     </div>
                        <div style="height: 100px; z-index: 1; background-color: black; opacity: 0.5; color: white;">
                              <label class="best5Label"><a style="text-decoration: none;" href="${pageContext.request.contextPath }/storeview?key=${bestBoard[0].key }">${bestBoard[0].storename }</a></label>
                              <label class="best5Label">조회수 : ${bestBoard[0].viewcount }</label>
                              <label class="best5Label">가격대 : ${bestBoard[0].price }</label>
                           </div>
                     </div>
                     <c:forEach items="${bestBoard }" var="board" varStatus="i">
                     <c:if test="${i.index ne 0}">
                        <div class="mvimg"
                           style="background-image: url('store_viewBlob?key=${board.key }');">
                           <div style="height: 200px;"></div>
                           <div style="height: 200px;">
                              <button style="float: left;" class="prevbutton">
                              <img src="resources/images/arrow.svg">
                           </button>
                        <button style="float: right;" class="nextbutton">
                              <img src="resources/images/arrow.svg">
                           </button>
                           </div>
                           <div style="height: 100px; background-color: black; opacity: 0.5; color: white;">
                           <label class="best5Label"><a style="text-decoration: none;" href="${pageContext.request.contextPath }/storeview?key=${board.key }">${board.storename }</a></label>
                              <label class="best5Label">조회수 : ${board.viewcount }</label>
                              <label class="best5Label">가격대 : ${board.price }</label>
                           </div>
                        </div>
                        </c:if>
                     </c:forEach>
                  </div>
</body>