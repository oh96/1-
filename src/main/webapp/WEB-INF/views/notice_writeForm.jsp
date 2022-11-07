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
	<form action="notice_write" method="POST" enctype="multipart/form-data">
	<table>
		<tr>
			<th>작성자</th>
			<td><input type="text" name="user_name"/></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="board_subject"/></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="board_content"></textarea></td>
		</tr>
		<tr>
			<th>사진</th>
			<td><input type="file" name="photo"/></td>
		</tr>
		<tr>
			<td colspan="2" class="btn_area">
				<button type="button" onclick="location.href='./notice'">리스트</button>
				<button>저장</button> <!--폼안의 버튼태그는 submit이 발동되므로 위의버튼태그처럼 작성-->
			</td>
		</tr>
	</table>
	</form>
</body>
<script></script>
</html>