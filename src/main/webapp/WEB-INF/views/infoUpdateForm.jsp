<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>여행지 정보 글쓰기</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
   function location_popup(){
      var url="infoListPopup";
      var name="위치 찾기";
      var option="width=400,height=500,left=50,top=50";
      
      window.open(url,name,option);
   }
</script>
<style>
</style>
</head>
<body>
   <form action="infoUpdate" method="post" enctype="multipart/form-data">
   <input type="hidden" name="board_idx" value="${boarddto.board_idx}"/>
   <table>
      <tr>
         <td><input id="board_subject" name="board_subject" type="text" placeholder="제목을 입력하세요" value="${boarddto.board_subject}" readonly/></td>
      </tr>
      <tr>
         <td><input type="file" name="photo" multiple/><button>저장</button></td>
         <c:if test = "${photolist.size()>0}">
            <c:forEach items="${photolist}" var="file">
               <img src="/photo/${file.newFileName}" width=400/><br/><br/>
            </c:forEach>
         </c:if>
      </tr>
      <tr>
         <td><input id="location_input" name="location_input" placeholder="여행지를 선택하세요" value="${boarddto.board_subject}" readonly/>
         <input id="locationIdx_input" name="loc_idx" readonly="readonly" value="${loc_idx}" type="hidden" />
         <button type="button" onclick="location_popup();">위치 찾기</button></td>
      </tr>
      <tr>
         <td><textarea id="board_content" name="board_content" placeholder="내용을 입력하세요">${boarddto.board_content}</textarea></td>
      </tr>
   </table>
   </form>
</body>
<script>


</script>
</html>