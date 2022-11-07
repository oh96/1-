<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>

</style>
</head>
<body>
	<div>
		안녕하세요 ${sessionScope.loginId} 님 <a href="logout">로그아웃</a>
	</div>
	
	<!--소진-->
	<form action="register.jsp" method="post">
			<button onclick="location.href='register'">공지등록</button>
	</form>
	
	<button onclick="location.href='notice_writeForm'" style="float: right">글쓰기</button>
	<table>
		<tr>
			<th></th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		
		<c:forEach items="${list}" var="board">
		<tr>
			<td>${board.board_subject}</td>
			<td>${board.board_id}</td>
			<td>${board.reg_date}</td>
			<td>${board.hit}</td>
			<%-- <td><a href="delete?idx=${board.idx}">삭제</a></td> --%>
		</tr>
		</c:forEach>
	</table>
	
</body>
<script></script>
</html>