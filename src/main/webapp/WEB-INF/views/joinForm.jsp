<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	table, tr, td {
		border: 1px solid black;
		border-collapse: collapse;
	}
	tr, td {
		padding: 5px;
	}
	*{
		text-align: center;
	}
</style>
</head>
<body>
	<form action="join" method="post">
		<table>
			<tr>
				<td>ID</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="text" name="password"></td>
			</tr>
			<tr>
				<td>NAME</td>
				<td><input type="text" name="user_name"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					남자:<input type="radio" name="gender" value="남자">&nbsp;&nbsp;&nbsp;
					여자:<input type="radio" name="gender" value="여자">
				</td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="age"></td>
			</tr>
			<tr>
				<td>EMAIL</td>
				<td><input type="text" name="email"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="회원가입"></td>
			</tr>
		</table>
	</form>
</body>
<script></script>
</html>