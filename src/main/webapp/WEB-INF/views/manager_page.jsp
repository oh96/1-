<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<style>
table, th, td {
   border: 1px solid;
   border-collapse: collapse;
   padding: 5px 10px;
}
</style>
</head>
<body>
    <div>
      <a href="userlist">유저</a>&nbsp;&nbsp;
      <a href="AdminInfoList">여행지</a>&nbsp;&nbsp;
      <a href="allList">전체게시물</a>&nbsp;&nbsp;
      <a href="blindList">블라인드</a>
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
         <th colspan="2"><a href="withdraw?id=${detail.id}">회원 탈퇴</a></th>
      </tr>


</table>

</body>
<script></script>
</html>