<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
		alert('댓글이 삭제 되었습니다');
		location.replace('${pageContext.request.contextPath}/board?bnum=${bnum}');
</script>
</body>
</html>