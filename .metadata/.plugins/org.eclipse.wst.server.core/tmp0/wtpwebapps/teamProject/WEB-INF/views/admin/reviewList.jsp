<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<link rel="stylesheet" href="resources/assets/css/main.css?ver=14" />
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js" type="text/javascript"></script>
	<script src="/resources/jquery/jquery-3.3.1.min.js"></script>
	<script>
		$(document).ready(function(){
			var tbl = $("#checkboxTbl");
			
			// 테이블 헤더에 있는 전체 선택 클릭
			$(":checkbox:first", tbl).click(function(){
				if( $(this).is(":checked") ){
					$(":checkbox", tbl).attr("checked", "checked");
				}
				else{
					$(":checkbox", tbl).removeAttr("checked");
				}
				// 모든 체크박스에 change이벤트 발생
				$(":checkbox", tbl).trigger("change");
			});
			
		// 헤더 외의 체크박스 외 다른 체크박스 클릭
		$(":checkbox:not(:first)", tbl).click(function(){
			var allCnt = $(":checkbox:not(:first)", tbl).length;
			var checkCnt = $(":checkbox:not(:first)", tbl).filter(":checked").length;
			
			// 전체 체크박스 갯수와 현재 체크된 체크박스 갯수를 비교해서 헤더에 있는 체크박스 체크할지 말지 판다
			if( allCnt==checkedCnt ){
                $(":checkbox:first", tbl).attr("checked", "checked");
            }
            else{
                $(":checkbox:first", tbl).removeAttr("checked");
            }
        }).change(function(){
            if( $(this).is(":checked") ){
                // 체크박스의 부모 > 부모 니까 tr 이 되고 tr 에 selected 라는 class 를 추가한다.
                $(this).parent().parent().addClass("selected");
            }
            else{
                $(this).parent().parent().removeClass("selected");
            }


		});
		});
	</script>
	
	<style>
		#checkboxTbl {border-collapse: collapse;}
		#checkboxTbl #cb {visible : true;}
		#checkboxTbl td, #checkboxTbl th{padding: 20px;}
		#checkboxTbl th{background-color: #black;}
		#checkboxTbl tr.selected{background-color: blue; color: #fff; font-weight: bold;}
		.delBtn button { font-size:18px; padding: 5px 10px; border:1px solid #eee; background-color: #eee;}
		table tr th input{
		all : unset;
		}
		
	</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrapper" class="fade-in">

		<!-- 헤더 -->
		<header id="header">
			<a href="${pageContext.request.contextPath}/" class="logo">맛.ZIP</a>
		</header>

		<!-- 상단 바 -->
		<nav id="nav">
			<ul class="links">		
				<li><a href="adminUserList">회원조회</a></li>
				<li><a href="adminUserDrop">회원탈퇴</a></li>
				<li><a href="adminReviewList">커뮤니티 삭제</a></li>
			</ul>
		</nav>
		<div id="main">
<h2>커뮤니티 삭제</h2>
<hr>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	
</script>
<table id="checkboxTbl" >
	<colgroup>
		<col width="40px;" />
		<col width="20px;" />
		<col width="100px;" />
	</colgroup>
		<tr>
			<th>
				<div class="col-6 col-12-small" style="width: 1px;">
					<input type="checkbox" name="cb" id="cb0"
						style="border: 2px;"> <label
						for="cb0"> </label>
				</div> <input type="hidden" ></th>
			<th>No</th>
			<th>UerId</th>
			<th>Title</th>
			<th>Name</th>
			<th>Context</th>
			<th>Bnum</th>
		</tr>
	
		<c:forEach var="hashmap" items="${review }" varStatus="st">
		<tr>
			
			<th>
			<div class="col-6 col-12-small" style="width: 1px;">
			<input type="checkbox" name="cb" id="cb${st.index +1}" value="${st.index }" style="border: 2px;">
			<label for="cb${st.index +1}"> </label>
			</div>
			<input type="hidden" id="${st.index}id" value="${hashmap.bnum }"></th>
<%-- 			<th>ㅋㅋ${st.index }id</th> --%>
			<th>${st.count }</th>
			<th>${hashmap.userid }</th>	
			<th>${hashmap.title }</th>	
			<th>${hashmap.username }</th>	
			<th>${hashmap.context }</th>	
			<th>${hashmap.bnum }</th>
		</tr>
			
	
		</c:forEach>
</table>
	<br>
	<div>
	<input type="button" value="선택삭제" class="delBtn">
	<script>
		$(".delBtn").click(function(){
			var confirm_val = confirm("삭제하시겠습니까?")
			
			if(confirm_val){
				var checkArr = new Array();
				
				checkArr.push($(this).attr)
			}
		})
	</script>
	</div>
	
	<script type="text/javascript">
		$(function(){
			var checkBoxArr = [];
			
			$('.delBtn').click(function(){
			$("input[name=cb]:checked").each(function(i){
				$.ajax({ 
				    type : "POST",
				    //dataType: "json",
				    dataType : 'text',
				    data : "testval="+$('#'+($(this).val())+'id').val(),
				    url : "admindeltest",
				    success : function(data) {
				    	alert("삭제 되었습니다.")	;
				    }
				});
				checkBoxArr.push($(this).val());
			});
				alert(checkBoxArr[0]);
				alert(checkBoxArr[1]);
			});
		});
	
	</script></div></div>
			<div id="copyright">
			<ul><li>&copy; </li></ul>
		</div>
			<script src="resources/assets/js/jquery.min.js?ver=2"></script>
		<script src="resources/assets/js/jquery.scrollex.min.js?ver=3"></script>
		<script src="resources/assets/js/jquery.scrolly.min.js?ver=4"></script>
		<script src="resources/assets/js/browser.min.js?ver=5"></script>
		<script src="resources/assets/js/breakpoints.min.js?ver=6"></script>
		<script src="resources/assets/js/util.js?ver=7"></script>
		<script src="resources/assets/js/main.js?ver=8"></script>
</body>
</html>