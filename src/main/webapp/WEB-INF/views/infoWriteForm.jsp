<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>여행지 정보 글쓰기</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	function location_popup(){
		var url="infoList";
		var name="위치 찾기";
		var option="width=400,height=500,left=50,top=50";
		
		window.open(url,name,option);
	}
</script>
<style>
</style>
</head>
<body>
	<form action="infoWrite" method="post"> 
	<table>
		<tr>
			<td><input id="board_subject" name="title" type="text" readonly="readonly" placeholder="제목을 입력하세요"/></td>
		</tr>
		<tr>
			<td><input type="file" name="photo"/><button>작성</button></td>
		</tr>
		<tr>
			<td><input id="location_input" readonly="readonly" placeholder="여행지를 선택하세요" />
			<input id="locationIdx_input" name="loc_idx" readonly="readonly" type="hidden" />
			<button type="button" onclick="location_popup();">위치 찾기</button></td>
		</tr>
		<tr>
			<td><textarea name="content" placeholder="내용을 입력하세요"></textarea></td>
		</tr>
	</table>
	</form>
</body>
<script>


</script>
</html>