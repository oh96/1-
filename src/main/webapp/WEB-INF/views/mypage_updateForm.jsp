<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
table, th, td {
	border: 1px solid;
	border-collapse: collapse;
	padding: 5px 10px;
}
</style>
</head>
<body>

	<form action="MypageUpdate" method="POST">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" value="${info.id}" readonly /></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="user_name" value="${info.user_name}" /></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="text" name="age" value="${info.age}" /></td>
			</tr>
			<tr>
				<th>GENDER</th>
				<td>
				<input type="radio" name="gender" value="남자" 
				<c:if test="${info.gender eq '남자'}">checked</c:if>/>남자
					&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="radio" name="gender" value="여자" 
				<c:if test="${info.gender eq '여자'}">checked</c:if>/>여자
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" value="${info.email}" /></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="수정" /></th>
			</tr>


		</table>
	</form>

</body>
<script></script>
</html>