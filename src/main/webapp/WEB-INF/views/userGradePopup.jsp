<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
</style>
</head>
<body>
<form action="userGradeUpdate">
<br/>
   <div>
      <h3>${userId}</h3>
      <input name="userId" id="userId" value="${userId}" type="hidden" />
      <!-- <span>제재 횟수: </span> -->
   </div>
   <hr>
      <div>
         <span>상태: </span> <select name="gradeState" id="gradeState">
            <c:choose>
               <c:when test="${loginUserGrade eq 2}">
                  <c:choose>
                     <c:when test="${userGrade eq '1'}">
                        <option value="1">정상</option>
                        <option value="2">정지</option>
                        <option value="3" selected="selected">관리자</option>
                     </c:when>
                     <c:when test="${userState eq '정상'}">
                        <option value="1" selected="selected">정상</option>
                        <option value="2">정지</option>
                        <option value="3">관리자</option>
                     </c:when>
                     <c:when test="${userState eq '정지'}">
                        <option value="1">정상</option>
                        <option value="2" selected="selected">정지</option>
                        <option value="3">관리자</option>
                     </c:when>
                  </c:choose>
               </c:when>
            </c:choose>
            <c:choose>
               <c:when test="${loginUserGrade ne 2}">
                  <c:choose>
                     <c:when test="${userState eq '정상'}">
                        <option value="1" selected="selected">정상</option>
                        <option value="2">정지</option>
                     </c:when>
                     <c:when test="${userState eq '정지'}">
                        <option value="1">정상</option>
                        <option value="2" selected="selected">정지</option>
                     </c:when>
                  </c:choose>
               </c:when>
            </c:choose>
         </select>
      </div>
      <br/><br/>
   <button>저장</button>
</form>
</body>
<script>
</script>
</html>