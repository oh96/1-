<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
<style></style>
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
							<a href="./whatPage?page=근처여행지찾기"
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
				<div class="searchform order-lg-last">
					<form action="SearchGo" class="form-group d-flex">
						<input type="text" class="form-control pl-3" placeholder="Search" id="searchInput" name="searchContent">
						<button id="searchBtn" placeholder="" class="form-control search">
							<span class="fa fa-search"></span>
						</button>
					</form>
				</div>
				<div class="collapse navbar-collapse" id="ftco-nav">
					<ul class="navbar-nav mr-auto">
						
						<li class="nav-item <c:if test="${page eq '여행지정보'}">active</c:if>">
							<a href="./whatPage?page=여행지정보" class="nav-link">여행지 정보</a>
						</li>
						<li class="nav-item <c:if test="${page eq '여행지후기'}">active</c:if>">
							<a href="./whatPage?page=여행지후기" class="nav-link">여행지 후기</a></li>
						<li class="nav-item <c:if test="${page eq '여행지경로'}">active</c:if>">
							<a href="./whatPage?page=여행지경로" class="nav-link">여행지 경로</a>
						</li>
						<li class="nav-item <c:if test="${page eq '공지'}">active</c:if>">
							<a href="./whatPage?page=공지" class="nav-link">공지</a>
						</li>
					</ul>
				</div>
			</div>
		</nav>
		<!-- END nav -->
	</section>

	<script src="<%=request.getContextPath()%>/resources/js/popper.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/main.js"></script>
	

</body>
<script>
	/*
	$("#searchBtn").click(function(){
		console.log($("#searchInput").val());
		$.ajax({
			type:'get',
			url:'searchListCall',
			data:{
				'searchContent':$("#searchInput").val()
			},
			dataType:'JSON',
			success:function(data){
				console.log(data);
				location.href="./whatPage?page=검색";
			},
			error:function(e){
				console.log(data);
			}
		});
	});*/
	/*
	$("#searchBtn").click(function(){
		//console.log($("#searchInput").val());
		$.ajax({
			type:'get',
			url:'searchListCall',
			data:{
				'searchContent':$("#searchInput").val()
			},
			dataType:'JSON',
			success:function(data){
				console.log(data.searchList);
				location.href="./whatPage?page=검색";
			},
			error:function(e){
				console.log(data);
			}
		});
	});
	*/
</script>
</html>