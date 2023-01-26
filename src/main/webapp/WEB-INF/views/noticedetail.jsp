<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<link rel="stylesheet" href="resources/common.css" type="text/css"> 
<style></style>
</head>
<body>
   <table>
      <tr>
         <th>작성자</th>
         <td>${boarddto.id}</td>
      </tr>
      <tr>
         <th>제목</th>
         <td>${boarddto.board_subject}</td>
      </tr>
      
      <tr>
         <th>내용</th>
         <td>${boarddto.board_content}</td>
      </tr>
      <c:if test="${fileList.size()>0}">
       <tr>
         <th>이미지</th>
         <td>
         <c:forEach items="${fileList}" var="file">
            <img src="/photo/${file.newFileName}"/><br/><br/>
         </c:forEach>
         </td>
      </tr> 
      </c:if>
      <tr>
         <td colspan="2" class="btn_area">
            <button type="button" onclick="location.href='./whatPage?page=공지'">공지리스트</button>
            <c:if test="${sessionScope.user_grade >= 1}">
	            <button type="button" onclick="location.href='./whatPage?page=공지수정하기'">수정하기</button>
            </c:if>
         </td>
      </tr>
   </table>
</body>
<script></script>
</html>