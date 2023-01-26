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
<style>
   table, th, tr, td{
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px 10px;
   }
</style>
</head>
<body>

<body>
<form action="reviewUpdate" method="POST">
<input type="hidden" name="board_idx" value="${board.board_idx}">
   <table>
      <tr>
         <th>제목</th>
         <td>
            <input type="text" name="board_subject" value="${board.board_subject}"/></td>
      </tr>
      <tr>
         <th>여행지 위치</th>
         <td><input id="location_input" placeholder="여행지를 선택하세요" value="${loc_Name}" readonly/>
         <input id="locationIdx_input" name="loc_idx" readonly="readonly" value="${loc_idx}" type="hidden" />
         <button type="button" onclick="location_popup();">위치 찾기</button>
         </td>
      </tr>
      
      <tr>
         <th>내용</th>
         <td>
            <textarea name="board_content">${board.board_content}</textarea></td>
      </tr>
      <tr>
         <td colspan="2" class="btn_area">
            <button type="button" onclick="location.href='./whatPage?page=여행지후기'">리스트</button>
            <button>저장</button>
         </td>
      </tr>
   </table>
</form>
</body>
<script type="text/javascript">
   function location_popup(){
      var url="infoListPopup";
      var name="위치 찾기";
      var option="width=400,height=500,left=50,top=50";
      
      window.open(url,name,option);
   }
   
</script>
</html>