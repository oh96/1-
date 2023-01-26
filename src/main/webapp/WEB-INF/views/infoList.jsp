<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<!-- <script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>  -->
<script src="resources/js/jquery.twbsPagination.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
function userGrade_popup(userId){
   var url="userGradePopup?userId="+userId;
   var name="gradePopup";
   var option="width=550,height=550,left=400,top=100";
   //console.log(userId);
   window.open(url,name,option);
}
</script>
<style>
   table,th,td{
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px 10px;
   }
</style>
</head>
<body>
   <c:if test="${sessionScope.user_grade >= 1}">
      <div style="display: inline-block;">
         <button onclick="location.href='./whatPage?page=여행지정보글쓰기'">글쓰기</button>
      </div>
   </c:if>
   <table>
      <thead>
         <tr>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
         </tr>
      </thead>
      <tbody id="list">
      </tbody>
      <tr id="tr">
         <td colspan="4" id="paging">
            <div class="container">
               <nav aria-label="Page navigation" style="text-align: center">
                  <ul class="pagination" id="pagination"></ul>
               </nav>
            </div>
         </td>
      </tr>
   </table>
</body>
<script>

var showPage = 1;
listCall(showPage);

var user_grade = "${sessionScope.user_grade}";

function listCall(page){
   $.ajax({
      type:'get',
      url:'infoList',
      data:{page:page},
      dataType:'JSON',
      success:function(data){
         drawList(data.list);
         
         if(data.list.length==0){
            $("#pagination").twbsPagination("destroy");
         } else {
         
            $('#pagination').twbsPagination({
               startPage:1,
               totalPages:data.total, 
               visiblePages:5,
               onPageClick:function(e,page){ 
                  listCall(page);
                  console.log($("#pagination"));
               }
            });
         }
      },
      error:function(e){
         console.log(e);
      }
   });
}

function drawList(list){
   var content = '';
   if(user_grade == 2){
      if(list.length>0){
         for(var i=0; i<list.length; i++){
            content += '<tr>';
            content += '<td><a href="./infoDetail?board_idx='+list[i].board_idx+'">'+list[i].board_subject+'</a></td>';
            
            content += "<td class='dropdown'><a href='#' data-toggle='dropdown'>"+list[i].id+"</a>";
            content += '<ul class="dropdown-menu">';
            content += '<li><a href="userPageReviewListCall?userId='+list[i].id+'">유저페이지</a></li>';
            content += '<li><a href="#" onclick="userGrade_popup(\''+list[i].id+'\')">상태변경</a></li>';
            content += '</ul></td>';
            
            var date = new Date(list[i].reg_date);
            content += '<td>'+date.toLocaleDateString('ko-KR')+'</td>';
            content += '<td>'+list[i].hit+'</td>';
            content += '</tr>';
         }
      }
      $('#list').empty();
      $('#list').append(content);
   }else{
      for(var i=0; i<list.length; i++){
         content += '<tr>';
         content += '<td><a href="./infoDetail?board_idx='+list[i].board_idx+'">'+list[i].board_subject+'</a></td>';
         content += "<td>"+list[i].id+"</td>";
         var date = new Date(list[i].reg_date);
         content += '<td>'+date.toLocaleDateString('ko-KR')+'</td>';
         content += '<td>'+list[i].hit+'</td>';
         content += '</tr>';
      }
   }
   $('#list').empty();
   $('#list').append(content);
   
}


</script>
</html>