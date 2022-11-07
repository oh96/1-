<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<script src="resources/js/jquery.twbsPagination.js"></script>
<style>
	table,th,td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
	}
	table{
		width: 100%;
	}
</style>
</head>
<body>
	<button onclick="location.href='notice_writeForm'">글쓰기</button>
	<table>
		<thead>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		</thead>
		<tbody id="notice_list">
		</tbody>
		<tr>
			<td colspan="5" id="paging">	
				<div class="container">
					<nav aria-label="Page navigation" style="test-align:center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</td>
		</tr>
	</table>
</body>
<script>
var showPage = 1;
listCall(showPage);

function listCall(page){
	$.ajax({
		type:'GET',
		url:'notice_list',
		data:{page:page}, //페이지란 이름으로 현재 받은 페이지를 넣기-->홈컨트롤러로 requestparam으로 page받기
		dataType:'JSON',
		success:function(data){
			console.log(data);
			drawList(data.list);	
			//플러그인 적용하기
			$('#pagination').twbsPagination({
				startPage:1, 
				totalPages:data.total,
				visiblePages:5,
				onPageClick:function(e, page){ 
					listCall(page);
				}
			});
		},
		error:function(e){
			console.log(e);
		}
	});
}

function drawList(list){  
	var content='';
	
	for(var i=0; i<list.length; i++){
		content +='<tr>';
		content +='<td>'+list[i].board_idx+'</td>';
		content +='<td>'+list[i].board_subject+'</td>';
		content +='<td>'+list[i].id+'</td>';
		
		var date = new Date(list[i].reg_date);
		content +='<td>'+date.toLocaleDateString('ko-kr')+'</td>';
		
		content +='<td>'+list[i].hit+'</td>';
		
		content +='</tr>';
	}
	
	$("#list").empty(); 
	$("#list").append(content);
}


</script>
</html>