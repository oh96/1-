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
<div style='background-color:black'>
   <a href="MypageDetail?id=${sessionScope.loginId}">내 정보</a>
   &nbsp;&nbsp;&nbsp;&nbsp;
   <a href="MypageReviewListBridge?id=${sessionScope.loginId}">나의 후기글 리스트</a>
   &nbsp;&nbsp;&nbsp;&nbsp;
   <a href="MypageRouteListBridge?id=${sessionScope.loginId}">나의 경로글 리스트</a>
   &nbsp;&nbsp;&nbsp;&nbsp;
   <a href="MypageCommentListBrigde?id=${sessionScope.loginId}">나의 댓글 리스트</a>
</div>
   <table>
      <tr>
         <th>아이디</th>
         <td>${detail.id}</td>
      </tr>
      <tr>
         <th>이름</th>
         <td>${detail.user_name}</td>
      </tr>
      <tr>
         <th>성별</th>
         <td>${detail.gender}</td>
      </tr>
      <tr>
         <th>나이</th>
         <td>${detail.age}</td>
      </tr>
      <tr>
         <th>EMAIL</th>
         <td>${detail.email}</td>
      </tr>
      <tr>
         <th colspan="2"><a href="MypageUpdateForm?id=${detail.id}">회원정보 수정</a></th>
      </tr>
      <tr>
         <th colspan="2"><a onclick="make(event)" href="MypageQuit?id=${detail.id}">회원 탈퇴</a></th>
      </tr>

   </table>


</body>
<script>

function make(e){
	if(confirm("정말 탈퇴하시겠습니까?") == false){
		e.preventDefault();
	}
}

</script>
</html>