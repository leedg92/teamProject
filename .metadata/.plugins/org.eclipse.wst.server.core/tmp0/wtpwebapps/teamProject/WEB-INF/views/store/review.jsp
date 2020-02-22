<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form method="POST" action="${pageContext.request.contextPath}/review" enctype="multipart/form-data">
				<div class="fields">
					<div class="field">
						<label for="writer">작성자 : ${member.userid } </label>
					</div>

					<div class="field">
						<label for="content">content</label>
						<textarea name="content" id="content" rows="3"></textarea>
					</div>

					<div class="field">
						<label for="score">score</label> <input
							style="width: 20px; height: 25px;" name="score" id="score" />/5
					</div>

					<div class="field">

						<input type="file" name="file"><br> <br> 
						<input type="hidden" value=${board.key } name="key">
						<input type="hidden" value=${member.userid } name="userid">
						<input type="submit" value="작성완료">
					</div>
				</div>
			</form>
			<div>
			
					<table>
			<c:forEach var="file" items="${list }" varStatus="st">
						<tr>
							<td>
							${file.writer }<br>
							<img
								src="${pageContext.request.contextPath }/upload/${file.STORED_FILE_NAME}"
								style="height: 100px; width: 100px; size: auto;"></td>
							<td width="60%">
							${file.content }
							</td>
							<td><br><br><br><div class="star-rating" style="width: ${ file.score * 29.2}px;"></div></td>
						</tr>
						<tr>
						</tr>
			</c:forEach>
					</table>
				</div>