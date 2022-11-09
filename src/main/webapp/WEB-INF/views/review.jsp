<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<script src="resources/js/jquery.twbsPagination.js"></script>
<style>
	table, th, tr, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
	}
</style>
</head>
<body>
<!-- <button onclick="location.href='./reviewWriteForm'">글쓰기</button> -->
<button onclick="location.href='./whatPage?page=후기글쓰기'">글쓰기</button>

	<table>
		<thead>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
				<th>좋아요</th>
			</tr>
		</thead>
		<tbody id="reviewList">
		
		</tbody>
		<tr>
			<td colspan="5" id="paging">
				<div>
					<nav aria-label="Page navigation" style="text-align:center">
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</td>
		</tr>
	</table>
</body>
<script>

var showPage = 1;
	reviewListCall(showPage);

	reviewListCall();


var showPage = 1;
	reviewListCall(showPage);


	function reviewListCall(page){
		$.ajax({
			type:'get',
			url:'reviewListCall',
			data:{page:page},
			dataType:"JSON",
			success:function(data){
				console.log(data.total);
				drawList(data.list);
				$("#pagination").twbsPagination({
					startPage:1,
					totalPages:data.total,
					visiblePages:5,
					onPageClick:function(e, page){
						console.log(e);
						console.log(page);
						reviewListCall(page);
					}
				});
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	function drawList(list){
		var content="";
		for(var i=0;i<list.length;i++){
			//console.log(list[i]);
			content += "<tr>";
			content += "<td>";
			content += "<a href='reviewDetail?board_idx="+list[i].board_idx+"'>"+list[i].board_subject+"</a>"
			content += "</td>";
			content += "<td>"+list[i].id+"</td>";
			var date = new Date(list[i].reg_date);
			content += "<td>"+date.toLocaleDateString('ko-KR')+"</td>";
			content += "<td>"+list[i].hit+"</td>";
			content += "<td>0</td>";
			content += "</tr>";
		}
		$("#reviewList").empty();
		$("#reviewList").append(content);
	}
</script>
</html>