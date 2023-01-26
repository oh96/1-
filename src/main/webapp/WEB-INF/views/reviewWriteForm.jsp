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
   
<script src="https://unpkg.com/@yaireo/tagify"></script>
<script src="https://unpkg.com/@yaireo/tagify/dist/tagify.polyfills.min.js"></script>
<link href="https://unpkg.com/@yaireo/tagify/dist/tagify.css" rel="stylesheet" type="text/css" />
<!-- 해시태그 -->
<style>
table, th, td {
   border: 1px solid black;
   border-collapse: collapse;
   padding: 5px 10px;
}

th {
   width:150px;
}
   
button {
   margin: 5px;
}
   
table {
   width: 800px;
}

.btn_area {
   text-align: center;
}

input[type='text'] {
   width: 100%;
}

textarea {
   resize: none;
   width: 100%;
   height: 150px;
}
</style>
</head>
<body>

      <table>
         <tr>
            <th>제목</th>
            <td><input type="text" name="subject" id="board_subject"></td>
         </tr>
         <tr>
            <th>여행지 위치</th>
            <td>
               <input id="location_input" readonly="readonly" placeholder="여행지를 선택하세요" />
               <input id="locationIdx_input" name="loc_idx" readonly="readonly" type="hidden" />
               <button type="button" onclick="location_popup();">위치 찾기</button>
            </td>
         </tr>
         <tr>
            <th>내용</th>
            <td>
               <textarea name="content"  id="board_content"></textarea>
            </td>
         </tr>
         <tr>
            <th>사진</th>
            <td  id="file_loc">
               <input type="button" value="파일 추가" onClick="addFile()"><br>
            </td>
         </tr>
         <tr>
            <td colspan="2" class="btn_area">
               <button type="button" onclick="location.href='./whatPage?page=여행지후기'">리스트</button>
               <button id="reviewWrite">저장</button>
            </td>
         </tr>
      </table>
</body>
<script>
   var cnt = 1;
   function addFile(){
       $("#file_loc").append("<br>" + "<input type='file' name='file" + cnt + "' />");
       cnt++;
   }
   //파일업로드 관련
   
    
$('#reviewWrite').click(function(){
   
      $subject = $("#board_subject");
      $content = $("#board_content");
      $location_input = $("#location_input");
      
      console.log($subject.val());
      console.log($content.val());
      console.log($location_input);
      
      var subject = $subject.val();
      var content = $content.val();
      var loc_idx = $location_input.val();
      
      if ($subject.val()=='') {
         alert('제목을 입력해주세요');
         $subject.focus();
      }else if ($content.val()==''){
         alert('내용을 입력해주세요');
         $content.focus();
      }else if($location_input.val()==''){
         alert('내용을 입력해주세요');
         $location_input.focus();
      }
      {
         console.log('서버로 전송');
      }
      var subject1 = $('#board_subject').val();
      var content1 = $('#board_content').val();
      var loc_idx1 = $('#locationIdx_input').val();
      
//          param.subject = $subject.val();
//          param.content = $content.val();
//          console.log(param);
         
         $.ajax({
            type:'post',
            url:'reviewWrite',
            data:{
               subject : subject1,
               content : content1,
               loc_idx : loc_idx1,
               
            },
            dataType:'json',
            success:function(data){
               console.log(data);
               location.href='./whatPage?page=여행지후기';
               
            },
            error:function(e){
               console.log(e);
            }
            
         });
      
   
});
     
function location_popup(){
   var url="reviewListPopup";
   var name="위치 찾기";
   var option="width=400,height=500,left=50,top=50";
   
   window.open(url,name,option);
}
</script>
</html>