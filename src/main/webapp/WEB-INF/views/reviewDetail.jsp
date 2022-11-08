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
	<table>
		<tr>
			<th>제목</th>
			<td>${board.board_subject}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${board.id}</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${board.board_content}</td>
		</tr>
		<tr>
			<td colspan="2" class="btn_area">
				<button type="button" onclick="location.href='./review'">리스트</button>
				<button type="button" onclick="location.href='./reviewUpdateForm?board_idx=${board.board_idx}'">수정하기</button>
			</td>
		</tr>
	</table>
</body>
<script></script>
</html>