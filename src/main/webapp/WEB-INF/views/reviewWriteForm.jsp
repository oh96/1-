<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
}
	
button {
	margin: 5px;
}
	
table {
	width: 100%;
}

.btn_area {
	text-align: center;
}

input[type='text'] {
	width: 100%;
}

textarea {
	resize: none;
	width: 100%;
	height: 150px;
}
</style>
</head>
<body>
	<form action="reviewWrite" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content"></textarea>
				</td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="photo"></td>
			</tr>
			<tr>
				<td colspan="2" class="btn_area">
					<button type="button" onclick="location.href='review'">리스트</button>
					<button>저장</button>
				</td>
			</tr>
		</table>
	</form>
</body>
<script></script>
</html>