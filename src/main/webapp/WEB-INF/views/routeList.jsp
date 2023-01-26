<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<script src="resources/js/jquery.twbsPagination.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">
function userGrade_popup(userId){
   var url="userGradePopup?userId="+userId;
   var name="gradePopup";
   var option="width=550,height=550,left=400,top=100";
   window.open(url,name,option);
}
</script>
<style>
   table, th, tr, td{
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px 10px;
   }
</style>
</head>
<body>
<button onclick="routeWriteCheck();">글쓰기</button>
<table>
      <thead>
         <tr>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
         </tr>
      </thead>
      <tbody id="routeList">
      
      </tbody>
      <tr>
         <td colspan="5" id="paging">
            <div>
               <nav aria-label="Page navigation" style="text-align:center">
                  <ul class="pagination" id="pagination"></ul>
               </nav>
            </div>
         </td>
      </tr>
   </table>
</body>
<script>
var showPage = 1;
   routeListCall(showPage);
   
   var loginId = "${sessionScope.loginId}";
   var user_grade = "${sessionScope.user_grade}";
   
   function routeWriteCheck(){
      if(loginId == ""){
         alert("로그인이 필요한 서비스 입니다.");
         location.href='./whatPage?page=로그인화면';
      }else{
         location.href='./whatPage?page=경로글쓰기';
      }
   }
   
   function routeListCall(page){
      $.ajax({
         type:'get',
         url:'routeListCall',
         data:{page:page},
         dataType:"JSON",
         success:function(data){
            console.log(data.total);
            drawList(data.routelist);
            $("#pagination").twbsPagination({
               startPage:1,
               totalPages:data.total,
               visiblePages:5,
               onPageClick:function(e, page){
                  routeListCall(page);
               }
            });
         },
         error:function(e){
            console.log(e);
         }
      });
   }
   
function drawList(routelist){
   var content="";

   if(loginId == ""){
      for(var i=0;i<routelist.length;i++){
            content += "<tr>";
            content += "<td>";
            content += "<a href='routeDetail?board_idx="+routelist[i].board_idx+"'>"+routelist[i].board_subject+"</a>";
            content += "</td>";
         
            content += "<td>"+routelist[i].id+"</td>";
            
            var date = new Date(routelist[i].reg_date);
            content += "<td>"+date.toLocaleDateString('ko-KR')+"</td>";
            content += "<td>"+routelist[i].hit+"</td>";
            content += "</tr>";
      }
      $("#routeList").empty();
      $("#routeList").append(content);
   }else if(user_grade >= 1){
      for(var i=0;i<routelist.length;i++){
         var userId = routelist[i].id;
            content += "<tr>";
            content += "<td>";
            content += "<a href='routeDetail?board_idx="+routelist[i].board_idx+"'>"+routelist[i].board_subject+"</a>";
            content += "</td>";
            
            if(loginId != userId){
               content += "<td class='dropdown'><a href='#' data-toggle='dropdown'>"+routelist[i].id+"</a>";
                content += '<ul class="dropdown-menu">';
                content += '<li><a href="userPageReviewListCall?userId='+routelist[i].id+'">유저페이지</a></li>';
                content += '<li><a href="#" onclick="userGrade_popup(\''+routelist[i].id+'\')">상태변경</a></li>';
                content += '</ul></td>';
            }else{
               content += '<td><a href="MypageDetail?id='+routelist[i].id+'">'+routelist[i].id+'</a></td>';
            }
            
            var date = new Date(routelist[i].reg_date);
            content += "<td>"+date.toLocaleDateString('ko-KR')+"</td>";
            content += "<td>"+routelist[i].hit+"</td>";
            content += "</tr>";
      }
      $("#routeList").empty();
      $("#routeList").append(content);
   }else if(user_grade == 0){
      for(var i=0;i<routelist.length;i++){
            content += "<tr>";
            content += "<td>";
            content += "<a href='routeDetail?board_idx="+routelist[i].board_idx+"'>"+routelist[i].board_subject+"</a>";
            content += "</td>";
         
            content += '<td><a href="userPageReviewListCall?userId='+routelist[i].id+'">'+routelist[i].id+'</a></td>';
            
            var date = new Date(routelist[i].reg_date);
            content += "<td>"+date.toLocaleDateString('ko-KR')+"</td>";
            content += "<td>"+routelist[i].hit+"</td>";
            content += "</tr>";
      }
      $("#routeList").empty();
      $("#routeList").append(content);
   }
}

</script>
</html>