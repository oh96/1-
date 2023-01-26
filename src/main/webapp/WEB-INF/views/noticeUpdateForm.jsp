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
   <form action="update" method="POST" enctype="multipart/form-data">
   <input type="hidden" name="idx" value="${boarddto.board_idx}"/>
   <table>
      <tr>
         <th>작성자</th>
         <td><input type="text" name="id" value="${boarddto.id}"/></td>
      </tr>
      <tr>
         <th>제목</th>
         <td><input type="text" name="subject" value="${boarddto.board_subject}"/></td>
      </tr>
      <tr>
         <th>내용</th>
         <td><textarea name="content">${boarddto.board_content}</textarea></td>
      </tr>
      
      <%-- <tr>
         <th>이미지</th>
         <td>
         <p><input type="file" name="photo"/><p>
         <c:forEach items="${fileList}" var="file">
            <img src="/photo/${file.newFileName}"/><br/><br/>
         </c:forEach>
         </td>
      </tr> --%>
      
      <tr>
         <td colspan="2" class="btn_area">
            <button type="button" onclick="location.href='./'">리스트</button>
            <button>저장</button> 
         </td>
      </tr>
      
   </table>
   </form>
</body>
<script></script>
</html>