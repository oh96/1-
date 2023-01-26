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

   <form action="MypageUpdate" method="POST">
      <table>
      <div style='background-color:black'>
      <a href="MypageDetail?id=${sessionScope.loginId}">내 정보</a>
      &nbsp;&nbsp;&nbsp;&nbsp;
      <a href="MypageReviewListBridge?id=${sessionScope.loginId}">나의 후기글 리스트</a>
      &nbsp;&nbsp;&nbsp;&nbsp;
      <a href="MypageRouteListBridge?id=${sessionScope.loginId}">나의 경로글 리스트</a>
      &nbsp;&nbsp;&nbsp;&nbsp;
      <a href="MypageCommentListBrigde?id=${sessionScope.loginId}">나의 댓글 리스트</a>
      </div>
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
            <th colspan="2">
            <input type="submit" value="수정" /></th><!-- id="correction" -->
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