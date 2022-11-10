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
	<select id="sl1" name="category" onchange="chageLangSelect()">
		<option value="total" selected>통합</option>
		<option value="info">여행지 정보</option>
		<option value="review">여행지 후기</option>
		<option value="route">여행지 경로</option>
	</select>
	<select id="sl2" name="searchKind" onchange="chageLangSelect()">
		<option value="all">전체</option>
		<option value="sub">제목</option>
		<option value="user">작성자</option>
		<option value="tag">해시태그</option>
	</select>
	<hr>
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
		<tbody id="searchList">
		</tbody>
	</table>
</body>
<script>
var searchContent = "${searchContent}";
searchListCall();

function searchListCall(){
	$.ajax({
		type:'get',
		url:'searchListCall',
		data:{
			'searchContent':searchContent
		},
		dataType:"JSON",
		success:function(data){
			console.log(data);
			drawList(data.searchList);
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
		content += "<td>"+list[i].board_subject+"</td>";
		content += "<td>"+list[i].id+"</td>";
		var date = new Date(list[i].reg_date);
		content += "<td>"+date.toLocaleDateString('ko-KR')+"</td>";
		content += "<td>"+list[i].hit+"</td>";
		content += "<td>0</td>";
		content += "</tr>";
	}
	$("#searchList").empty();
	$("#searchList").append(content);
}

function chageLangSelect(){
	var sl1_el = document.getElementById("sl1");
	var sl2_el = document.getElementById("sl2");
    
    // 선택한 option의 value, 텍스트
    var optionVal1 = sl1_el.options[sl1_el.selectedIndex].value;
    var optionVal2 = sl2_el.options[sl2_el.selectedIndex].value;
    console.log(optionVal1);
    console.log(optionVal2);
}
</script>
</html>