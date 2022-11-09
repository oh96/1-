<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/style.css">
<style>
	table, th, tr, td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px 10px;
	}
</style>
</head>
<body>
<section class="ftco-section">

		<div class="container">
			<div class="row justify-content-between">
				<div class="col">
					<a class="navbar-brand" href="./"><img
						src="<%=request.getContextPath()%>/resources/img/logo1.png"
						width="200"></a>
				</div>
				<div class="col d-flex justify-content-end">
					<div class="login">
                  <p class="mb-0 d-flex">
                     <c:if test ="${sessionScope.loginId == null}">
                     <a href="loginForm" class="login"><span>로그인</span></a>
                     <a href="joinForm" class="login"><span>회원가입</span></a>
                     </c:if>
                     <c:if test ="${sessionScope.loginId != null}">
                     안녕하세요 ${sessionScope.loginId} 님
                     <a href="logout">로그아웃</a>
                     &nbsp;&nbsp;/&nbsp;&nbsp; 
                     </c:if>
                     
                  </p>
               </div>
					<div class="social-media">
						<p class="mb-0 d-flex"><!-- MypageDetail -->
							<a href="MypageDetail?id=${sessionScope.loginId}"
								class="d-flex align-items-center justify-content-center"><span>
									<img
									src="<%=request.getContextPath()%>/resources/img/mypage.png"
									width="30">
							</span></a> 
							<a href="map"
								class="d-flex align-items-center justify-content-center"><span>
									<img src="<%=request.getContextPath()%>/resources/img/map.png"
									width="30">
							</span></a>
						</p>
					</div>
				</div>
			</div>
		</div>
		<nav
			class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
			id="ftco-navbar">
			<div class="container">

				<button class="navbar-toggler" type="button" data-toggle="collapse"
					data-target="#ftco-nav" aria-controls="ftco-nav"
					aria-expanded="false" aria-label="Toggle navigation">
					<span class="fa fa-bars"></span> Menu
				</button>
				<form action="totalSearch" class="searchform order-lg-last">
					<div class="form-group d-flex">
						<input type="text" class="form-control pl-3" placeholder="Search" name="searchContent">
						<button type="submit" placeholder="" class="form-control search">
							<span class="fa fa-search"></span>
						</button>
					</div>
				</form>
				<div class="collapse navbar-collapse" id="ftco-nav">
					<ul class="navbar-nav mr-auto">
						
						<li class="nav-item"><a href="#" class="nav-link">여행지 정보</a></li>
						<li class="nav-item"><a href="review" class="nav-link">여행지 후기</a></li>
						<li class="nav-item"><a href="#" class="nav-link">여행지 경로</a></li>
						<li class="nav-item"><a href="#" class="nav-link">공지</a></li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- END nav -->

	</section>

	<script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/popper.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>

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