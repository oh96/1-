<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="resources/common.css" type="text/css"> 
<style></style>
</head>
<body>
	<form action="update" method="POST" enctype="multipart/form-data">
	<input type="hidden" name="idx" value="${board2.board_idx}"/>
	<table>
		<tr>
			<th>제목</th>
			<td><input type="text" name="subject" value="${board2.board_subject}"/></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="user_name" value="${board2.user_name}"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content">${board2.board_content}</textarea></td>
		</tr>
		
		<tr>
			<th>이미지</th>
			<td>
			<p><input type="file" name="photo"/><p>
			<c:forEach items="${fileList}" var="file">
				<img src="/photo/${file.newFileName}"/><br/><br/>
			</c:forEach>
			</td>
		</tr>
		
		<tr>
			<td colspan="2" class="btn_area">
				<button type="button" onclick="location.href='./'">리스트</button> <!--버튼태그다른곳으로 이동시키려면 type을 지정하고 onclick으로 주소를 지정해주어야한다-->
				<button>저장</button> <!--폼안의 그냥버튼태그를 실행하면 form action="update"가 실행된다-->
			</td>
		</tr>
		
	</table>
	</form>
</body>
<script></script>
</html>