<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style></style>
</head>
<body>
<p>사유</p>
<input type="text" id="reason">
<input type="button" id="submitBlind" value="작성완료">
</body>
<script>


$("#submitBlind").on("click", function(){
   var board_idx = "${board_idx}";
   var authorId = "${authorId}";
   var reason = $("#reason").val();
   
   $.ajax({
      url: 'routeBlind',
      dataType: 'json',
      type: 'post',
      data : {
         board_idx:board_idx,
         authorId:authorId,
         reason:reason
      },
      success: function(data) {
         alert("블라인드 글 작성을 완료하였습니다.");
         location.href="./whatPage?page=여행지경로";
      }
      });
   
});

</script>
</html>