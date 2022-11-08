<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<style>
	table,th,td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
	}
</style>
</head>
<body>
	<div style="display:inline-block;">
		<button onclick="location.href='infoWriteForm'">글쓰기</button>
	</div>
	<table>
		<thead>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody id="list">
		</tbody>
		<tr id="tr">
			<td colspan="4" id="paging">
				<div class="container">
					<nav aria-label="Page navigation" style="text-align: center">
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
		type:'get',
		url:'placeInfoList',
		data:{page:page},
		dataType:'JSON',
		success:function(data){
			drawList(data.list);
			
			if(data.list.length==0){
				$("#pagination").twbsPagination("destroy");
			} else {
			
				$('#pagination').twbsPagination({
					startPage:1,
					totalPages:data.total, 
					visiblePages:5,
					onPageClick:function(e,page){ 
						listCall(page);
						console.log($("#pagination"));
					}
				});
			}
		},
		error:function(e){
			console.log(e);
		}
	});
}

function drawList(list){
	var content = '';
	if(list.length>0){
		for(var i=0; i<list.length; i++){
			content += '<tr>';
			//content += '<td>'+list[i].board_subject+'</td>';
			content += '<td><a href="detail" class="subject">'+list[i].board_subject+'</a></td>';
			content += '<td>'+list[i].id+'</td>';
			
			var date = new Date(list[i].reg_date);
			content += '<td>'+date.toLocaleDateString('ko-KR')+'</td>';
			content += '<td>'+list[i].hit+'</td>';
			content += '</tr>';
		}
	}
	$('#list').empty();
	$('#list').append(content);
}




</script>
</html>