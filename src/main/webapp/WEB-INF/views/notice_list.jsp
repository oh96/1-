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
<!-- <link rel="stylesheet" href="resources/common.css" type="text/css">  -->
<style>
	table,th,td{
	border : 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
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
				<th>조회</th>
			</tr>
		</thead>
		<tbody id="list">
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
		url:'list',
		data:{page:page}, //페이지란 이름으로 현재 받은 페이지를 넣기-->홈컨트롤러로 requestparam으로 page받기
		dataType:'JSON',
		success:function(data){
			console.log(data);
			drawList(data.list);	
			//플러그인 적용하기
			$('#pagination').twbsPagination({
				startPage:1, //시작페이지
				totalPages:data.total, //총 페이지 수 
				visiblePages:5, //기본으로 보여줄 페이지 수
				onPageClick:function(e, page){ //클릭했을때 실행 내용
					//console.log(e);
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

<script></script>
</html>