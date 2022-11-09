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
	
<script src="https://unpkg.com/@yaireo/tagify"></script>
<script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
<!-- 해시태그 -->
<style>
table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px 10px;
}

th {
	width:150px;
}
	
button {
	margin: 5px;
}
	
table {
	width: 800px;
}

.btn_area {
	text-align: center;
}

input[type='text'] {
	width: 100%;
}

textarea {
	resize: none;
	width: 100%;
	height: 150px;
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
						</li>
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

		<table>
			<tr>
				<th>제목</th>
				<td><input type="text" name="subject" id="board_subject"></td>
			</tr>
			<tr>
				<th>여행지 위치</th>
				<td><input type="button" name="subject" value="여행지찾기"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content"  id="board_content"></textarea>
				</td>
			</tr>
			<tr>
				<th>사진</th>
				<td  id="file_loc">
					<input type="button" value="파일 추가" onClick="addFile()"><br>
				</td>
			</tr>
			<tr>
				<th>해시태그</th>
				<td><input name='basic'></td>
			</tr>
			<tr>
				<td colspan="2" class="btn_area">
					<button type="button" onclick="location.href='review'">리스트</button>
					<button id="reviewWrite">저장</button>
				</td>
			</tr>
		</table>
</body>
<script>
	var cnt = 1;
	function addFile(){
	    $("#file_loc").append("<br>" + "<input type='file' name='file" + cnt + "' />");
	    cnt++;
	}
	//파일업로드 관련
	
	 const input = document.querySelector('input[name=basic]');
	    let tagify = new Tagify(input); // initialize Tagify
	    
	    // 태그가 추가되면 이벤트 발생
	    tagify.on('add', function() {
	      console.log(tagify.value); // 입력된 태그 정보 객체
	  });
	  //해시태그 관련 

	    
$('#reviewWrite').click(function(){
	
		$subject = $("#board_subject");
		$content = $("#board_content");
		
		console.log($subject.val());
		console.log($content.val());
		
		if ($subject.val()=='') {
			alert('제목을 입력해주세요');
			$subject.focus();
		}else if ($content.val()==''){
			alert('내용을 입력해주세요');
			$content.focus();
		}else{
			console.log('서버로 전송');
			var param={};
			param.subject = $subject.val();
			param.content = $content.val();
			console.log(param);
			
			$.ajax({
				type:'post',
				url:'reviewWrite',
				data:{param:param},
				dataType:'json',
				success:function(data){
					console.log(data);
					location.href="./review";
					alert("저장");
				},
				error:function(e){
					console.log(e);
				}
				
			});
		
	}
});
</script>
</html>