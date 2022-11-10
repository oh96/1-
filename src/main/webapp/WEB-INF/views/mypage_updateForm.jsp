<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<style>
table, th, td {
	border: 1px solid;
	border-collapse: collapse;
	padding: 5px 10px;
}
</style>
</head>
<body>

<<<<<<< HEAD
=======
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
				<form action="#" class="searchform order-lg-last">
					<div class="form-group d-flex">
						<input type="text" class="form-control pl-3" placeholder="Search">
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
>>>>>>> origin/master
	<form action="MypageUpdate" method="POST">
		<table>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" value="${info.id}" readonly /></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="user_name" value="${info.user_name}" /></td>
			</tr>
			<tr>
				<th>나이</th>
				<td><input type="text" name="age" value="${info.age}" /></td>
			</tr>
			<tr>
				<th>GENDER</th>
				<td>
				<input type="radio" name="gender" value="남자" 
				<c:if test="${info.gender eq '남자'}">checked</c:if>/>남자
					&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="radio" name="gender" value="여자" 
				<c:if test="${info.gender eq '여자'}">checked</c:if>/>여자
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" value="${info.email}" /></td>
			</tr>
			<tr>
				<th colspan="2"><input type="submit" value="수정" /></th><!-- id="correction" -->
			</tr>


		</table>
	</form>

</body>
<script>
var msg="${msg}";//문자열로 포함되기때문에 ""
if(msg!=""){
	alert(msg);
}
</script>
</html>