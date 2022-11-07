<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	table, th, tr, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
	}
</style>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody id="list">
		<!-- 
		<c:forEach items="${list}" var="board">
			<tr>
			<td>${board.board_subject}</td>
			<td>${board.reg_date}</td>
			<td>${board.hit}</td>
			</tr>
		</c:forEach>
		 -->
		</tbody>
	</table>
</body>
<script>
listCall();

function listCall(){
	console.log("테스트");
	$.ajax({
		type:'post',
		url:'myreview',
		data:{},
		dataType:'json',
		success:function(data){
			console.log("성공");
			console.log(data);
			drawList(data.list);//리스트를 그려줬고
			//플러그인 적용
		},
		error:function(e){
			console.log("실패");
			console.log(e);
		}
	});
	
}

function drawList(list){
	var content = '';
	
	for(var i=0;i<list.length;i++){
		content += '<tr>';
		content += '<td>'+list[i].board_subject+'</td>';
		content += '<td>'+list[i].reg_date+'</td>';
		content += '<td>'+list[i].hit+'</td>';
		content += '</tr>';
	}
	
	$('#list').empty();//밑에 붙기때문에 한번다 지워주고
	$('#list').append(content);//붙여준다
	
}


</script>
</html>