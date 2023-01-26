<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="resources/js/jquery.twbsPagination.js"></script>
<style>
   table, th, tr, td{
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px 10px;
   }
</style>
</head>
<body>
   <table>
      <div style='background-color: black'>
         <a href="userPageReviewListCall?userId=${userId}">${userId}의 후기글</a>
         &nbsp;&nbsp;&nbsp;&nbsp; <a
            href="userPageRouteListCall?userId=${userId}">${userId}의 경로글</a>
         &nbsp;&nbsp;&nbsp;&nbsp; <a
            href="userPageCommentListCall?userId=${userId}">${userId}의 댓글</a>
      </div>
      <thead>
         <tr>
            <th>별점</th>
            <th>댓글내용</th>
            <th>작성일</th>
         </tr>
      </thead>
      <tbody id="list">
      </tbody>
      <tr>
         <td colspan="3" id="paging">
            <div class="container">
               <nav aria-label="Page navigation">
                  <!--  style="text-align: center" -->
                  <ul class="pagination" id="pagination"></ul>
               </nav>
            </div>
         </td>
      </tr>
   </table>
</body>
<script>
var userId = "${userId}";
console.log(userId);
var showPage=1;
listCall(showPage);

function listCall(page){
      console.log("테스트");
      $.ajax({
         type:'get',
         url:'userPageCommentList',
         data:{"userId":userId, "page":page},
         dataType:'json',
         success:function(data){
            console.log("성공");
            console.log(data);
            drawList(data.list);
            $('#pagination').twbsPagination({
                  startPage:1,
                  totalPages:data.total,
                  visiblePages:10,
                  onPageClick:function(e,page){
                  listCall(page);   
               }
            });
         },
         error:function(e){
            console.log(e);
         }
      });
      
   }

   function drawList(list){
      var content = '';

      for(var i=0;i<list.length;i++){
         content += '<tr>';
         content +='<td>'+list[i].star+'</td>';
         content += "<td><a href='routeDetail?board_idx="+list[i].board_idx+"'>"+list[i].comment_content+"</td>";
         var date = new Date(list[i].comment_date);
         content += '<td>'+date.toLocaleDateString('ko-KR')+'</td>';

         content += '</tr>';
      }
      
      $('#list').empty();//밑에 붙기때문에 한번다 지워주고
      $('#list').append(content);//붙여준다
      
   }

</script>
</html>