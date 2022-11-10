<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script> -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet"><!-- pagenation을 위해 -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script><!-- 위에 링크 추가후 변경3.6.1.min.js->3.2.1.min.js -->
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> <!-- 추가 -->

<script src="resources/js/jquery.twbsPagination.js"></script><!-- js폴더 밑에js파일 경로 -->
<!-- jquery-bootstrap-jquery 순서 중요 -->
<style>
	table, th, tr, td{
		border: 1px solid black;
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
	<div><button onclick="MyreviewDelete()">삭제</button></div>
	<table>
		<thead>
			<tr>
				<th><input type="checkbox" id="all"/></th>
				<th>제목</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody id="list">
		</tbody>
		<!-- 페이징 -->
		<tr>
			<td colspan="5" id="paging">
				<div class="container">
					<nav aria-label="Page navigation"><!--  style="text-align: center" -->
						<ul class="pagination" id="pagination"></ul>
					</nav>
				</div>
			</td>
		</tr>
		<!-- 페이징 -->
	</table>
</body>
<script>
var url=window.location.search.split('?id=')[1];//script에서는 window.location.search 라는 함수를 사용하면 url뒤에 있는 값을
console.log(url);								//가져올 수 있고 split을 이용하여 ?id까지 잘라주고 [1]로 뒤에값을불러온다
var showPage=1;
listCall(showPage);

function listCall(page){
	console.log("테스트");
	$.ajax({
		type:'get',
		url:'Myreview',
		data:{"id":url, "page":page},
		dataType:'json',
		success:function(data){
			//console.log("성공");
			console.log(data);
			drawList(data.list);//리스트를 그려줬고
			//플러그인 적용
			//console.log(data.total);
			//페이징
			$('#pagination').twbsPagination({
					startPage:1,//시작페이지
					totalPages:data.total,//총페이지수
					visiblePages:10,//기본으로 보여줄 페이지수
					onPageClick:function(e,page){//클릭했을떄 실행내용
					//console.log(e);
					listCall(page);	
				}
			});
			//페이징
		},
		error:function(e){
			//console.log("실패");
			console.log(e);
		}
	});
	
}

function drawList(list){
	var content = '';

		
	for(var i=0;i<list.length;i++){
		content += '<tr>';
		content +='<td><input type="checkbox" value="'+list[i].board_idx+'"/></td>';
		//content += '<td>'+list[i].board_subject+'</td>';
		
		//String num = request.getParameter("board_idx");
		
		content += '<td><a href="reviewDetail?board_idx='+list[i].board_idx+'">'+list[i].board_subject+'</a></td>';
		
		var date = new Date(list[i].reg_date);
		content += '<td>'+date.toLocaleDateString('ko-KR')+'</td>';
		//reg_date에 toLocaleDateString사용해 날짜를 찍어준다
		
		//content += '<td>'+list[i].reg_date+'</td>';
		content += '<td>'+list[i].hit+'</td>';
		content += '</tr>';
	}
	
	$('#list').empty();//밑에 붙기때문에 한번다 지워주고
	$('#list').append(content);//붙여준다
	
}

$("#all").click(function(){
	var $chk = $('input[type="checkbox"]');
	//console.log($chk);
	//attr:정적인 속성을 다룰때
	//prop:동적인 속성을 다룰때
	if($(this).is(':checked')){
		$chk.prop('checked',true);//prop로 속성을 바꿔준다
	}else{
		$chk.prop('checked',false);
	}
});

function MyreviewDelete(){
	
	var chkArr=[];//배열을 만들어주고

	$('input[type="checkbox"]:checked').each(function(idx,item){
	//console.log(item);
	if($(this).val()!='on'){
	chkArr.push($(this).val());//배열에 push로 데이터를 넣어준다
	}
});
	
	console.log(chkArr);//console로 확인 //data:delList라는 이름으로 chkArr준다
	$.ajax({
		type:'get',
		url:'MyreviewDelete',
		data:{'MyreviewDeleteList':chkArr},
		dataType:'JSON',
		success:function(data){
			console.log(data);
			if(data.msg != ""){
				alert(data.msg);
				//삭제가 완료되면 ajax는 기본적으로 페이지를 새로고침 하지 않는다
				//그래서 리스트를 다시 호출해 그려야 한다.
				listCall(page);
			}
		},
		error:function(e){
			console.log(e);
		}
	});
	
}


</script>
</html>