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
<table>
		<tr>
			<th>아이디</th>
			<td>${detail.id}</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>${detail.user_name}</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>${detail.gender}</td>
		</tr>
		<tr>
			<th>나이</th>
			<td>${detail.age}</td>
		</tr>
		<tr>
			<th>EMAIL</th>
			<td>${detail.email}</td>
		</tr>
		<tr>
			<th colspan="2"><a href="MypageUpdateForm?id=${detail.id}">회원정보 수정</a></th>
		</tr>
		<tr>
			<th colspan="2"><a href="withdraw?id=${detail.id}">회원 탈퇴</th>
		</tr>

	</table>


</body>
<script>
var msg="${msg}";
if(msg != ""){
	alert(msg);
	location.href='./';
}
</script>
</html>