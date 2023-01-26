<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
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
	<select id="sl1" name="category">
		<option value="통합" selected>통합</option>
		<option value="여행지 정보">여행지 정보</option>
		<option value="여행지 후기">여행지 후기</option>
		<option value="여행지 경로">여행지 경로</option>
	</select>
	<select id="sl2" name="searchKind">
		<option value="전체" selected>전체</option>
		<option value="제목">제목</option>
		<option value="작성자">작성자</option>
	</select>
	<input type="text" placeholder="검색어 입력" name="detailContent" id="detailContent">
	<button onclick="flags(); detailSearch(1)">검색</button>
	<hr>
	<table>
		<thead>
			<tr>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody id="searchList">
		</tbody>
			<tr id="page">
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
var searchContent = "${searchContent}";
var showPage = 1;
searchListCall(showPage);

function searchListCall(page){
	$.ajax({
		type:'get',
		url:'searchListCall',
		data:{
			'searchContent':searchContent,
			'page':page
		},
		dataType:"JSON",
		success:function(data){
			console.log(data);
			drawList(data.list);
			$("#pagination").twbsPagination({
				startPage:1,
				totalPages:data.total,
				visiblePages:5,
				onPageClick:function(e, page){
					searchListCall(page);
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
		
		if(list[i].cls_code == 1){
			content += "<tr>";
			
			content += "<td><a href='./infoDetail?board_idx="+list[i].board_idx+"'>"+list[i].board_subject+'</td>';
			
			content += "<td>"+list[i].id+"</td>";
			var date = new Date(list[i].reg_date);
			content += "<td>"+date.toLocaleDateString('ko-KR')+"</td>";
			content += "<td>"+list[i].hit+"</td>";
			content += "</tr>";
		}else if(list[i].cls_code == 2){
			content += "<tr>";
			
			content += "<td><a href='reviewDetail?board_idx="+list[i].board_idx+"'>"+list[i].board_subject+"</td>";
			
			content += "<td>"+list[i].id+"</td>";
			var date = new Date(list[i].reg_date);
			content += "<td>"+date.toLocaleDateString('ko-KR')+"</td>";
			content += "<td>"+list[i].hit+"</td>";
			content += "</tr>";
		}else if(list[i].cls_code == 3){
			content += "<tr>";
			
			content += "<td><a href='routeDetail?board_idx="+list[i].board_idx+"'>"+list[i].board_subject+"</td>";
			
			content += "<td>"+list[i].id+"</td>";
			var date = new Date(list[i].reg_date);
			content += "<td>"+date.toLocaleDateString('ko-KR')+"</td>";
			content += "<td>"+list[i].hit+"</td>";
			content += "</tr>";
		}else if(list[i].cls_code == 4){	
			content += "<tr>";
			
			content += "<td><a href='noticedetail?board_idx="+list[i].board_idx+"'>"+list[i].board_subject+"</td>";
			
			content += "<td>"+list[i].id+"</td>";
			var date = new Date(list[i].reg_date);
			content += "<td>"+date.toLocaleDateString('ko-KR')+"</td>";
			content += "<td>"+list[i].hit+"</td>";
			content += "</tr>";
		}
	}
	$("#searchList").empty();
	$("#searchList").append(content);
}

function drawPage(){
	var paging = "";
	$("#page").empty();
	paging += "<td colspan='5' id='paging'>";
	paging += "<div>";
	paging += "<nav aria-label='Page navigation' style='text-align:center'>";
	paging += "<ul class='pagination' id='pagination'></ul>"
	paging += "</nav></div></td>";
	$("#page").append(paging);
}

var flag = true;

function flags(){
	if(!flag){
		flag = true;
	}
}

function detailSearch(page) {
	if(flag){
		drawPage();
	}
	var detailContent = $("#detailContent").val();
	var sl1 = document.getElementById("sl1");
	var sl2 = document.getElementById("sl2");
	console.log(sl1.options[sl1.selectedIndex].value);
	console.log(sl2.options[sl2.selectedIndex].value);

	$.ajax({
		type:'get',
		url:'detailSearch',
		data:{
			'detailContent': detailContent,
			'sl1': sl1.options[sl1.selectedIndex].value,
			'sl2': sl2.options[sl2.selectedIndex].value,
			'page':page
		},
		dataType:"JSON",
		success:function(data){
			console.log(data.total);
			drawList(data.list);
		if(data.total >= 1){
			$("#pagination").twbsPagination({
				startPage:1,
				totalPages:data.total,
				visiblePages:5,
				onPageClick:function(e, page){
					detailSearch(page);
					flag = false;
					
				}
			});
		}
			
		},
		error:function(e){
			console.log(e);
		}
	});
}
</script>
</html>