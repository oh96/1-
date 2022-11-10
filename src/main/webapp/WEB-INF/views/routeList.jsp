<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
<button onclick="routeWriteCheck();">글쓰기</button>
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
		<tbody id="routeList">
		
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
	routeListCall(showPage);
	
	var loginId = "${sessionScope.loginId}";
	function routeWriteCheck(){
		if(loginId == ""){
			alert("로그인이 필요한 서비스 입니다.");
			location.href='./whatPage?page=로그인폼';
		}else{
			location.href='./whatPage?page=경로글쓰기';
		}
	}
	
	function routeListCall(page){
		$.ajax({
			type:'get',
			url:'routeListCall',
			data:{page:page},
			dataType:"JSON",
			success:function(data){
				console.log(data.total);
				drawList(data.routelist);
				$("#pagination").twbsPagination({
					startPage:1,
					totalPages:data.total,
					visiblePages:5,
					onPageClick:function(e, page){
						console.log(e);
						console.log(page);
						routeListCall(page);
					}
				});
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	function drawList(routelist){
		var content="";
		for(var i=0;i<routelist.length;i++){
			//console.log(list[i]);
			content += "<tr>";
			content += "<td>";
			content += "<a href='reviewDetail?board_idx="+routelist[i].board_idx+"'>"+routelist[i].board_subject+"</a>"
			content += "</td>";
			content += "<td>"+routelist[i].id+"</td>";
			var date = new Date(routelist[i].reg_date);
			content += "<td>"+date.toLocaleDateString('ko-KR')+"</td>";
			content += "<td>"+routelist[i].hit+"</td>";
			content += "<td>0</td>";
			content += "</tr>";
		}
		$("#routeList").empty();
		$("#routeList").append(content);
	}
</script>
</html>