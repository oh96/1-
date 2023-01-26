<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
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


   table, th, tr, td{
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px 10px;
   }
</style>
</head>
<body>
<!-- <button onclick="location.href='./reviewWriteForm'">글쓰기</button> -->

<button onclick="reviewWriteCheck();">글쓰기</button>

   <table>
      <thead>
         <tr>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
         </tr>
      </thead>
      <tbody id="reviewList">
      
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
reviewListCall(showPage);
   
var loginId = "${sessionScope.loginId}";
var user_grade = "${sessionScope.user_grade}";
//console.log(user_grade);
console.log(typeof(user_grade));
function reviewWriteCheck(){
   if(loginId == ""){
      alert("로그인이 필요한 서비스 입니다.");
      location.href='./whatPage?page=로그인화면';
   }else{
      location.href='./whatPage?page=후기글쓰기';
   }
}

reviewListCall();

   function reviewListCall(page){
      $.ajax({
         type:'get',
         url:'reviewListCall',
         data:{page:page},
         dataType:"JSON",
         success:function(data){
            console.log(data.total);
            drawList(data.list);
            $("#pagination").twbsPagination({
               startPage:1,
               totalPages:data.total,
               visiblePages:5,
               onPageClick:function(e, page){
                  console.log(e);
                  console.log(page);
                  reviewListCall(page);
               }
            });
         },
         error:function(e){
            console.log(e);
         }
      });
   }
   
function drawList(list){   
   var content="";
   if(loginId == ""){
      for(var i=0;i<list.length;i++){
         
            content += "<tr>";
            content += "<td>";
            content += "<a href='reviewDetail?board_idx="+list[i].board_idx+"'>"+list[i].board_subject+"</a>";
            content += "</td>";
            
            content += "<td>"+list[i].id+"</td>";
            
            var date = new Date(list[i].reg_date);
            content += "<td>"+date.toLocaleDateString('ko-KR')+"</td>";
            content += "<td>"+list[i].hit+"</td>";
            content += "</tr>";
      }
      $("#reviewList").empty();
      $("#reviewList").append(content);
   }else if(user_grade >= 1){
      for(var i=0;i<list.length;i++){ 
         var userId = list[i].id;
         content += "<tr>";
            content += "<td>";
            content += "<a href='reviewDetail?board_idx="+list[i].board_idx+"'>"+list[i].board_subject+"</a>";
            content += "</td>";
            if(loginId != userId){
               content += "<td class='dropdown'><a href='#' data-toggle='dropdown'>"+list[i].id+"</a>";
               content += '<ul class="dropdown-menu">';
               content += '<li><a href="userPageReviewListCall?userId='+list[i].id+'">유저페이지</a></li>';
               content += '<li><a href="#" onclick="userGrade_popup(\''+list[i].id+'\')">상태변경</a></li>';
               content += '</ul></td>';
            }else{
               content += '<td><a href="MypageDetail?id='+list[i].id+'">'+list[i].id+'</a></td>';
            }
            
            
            var date = new Date(list[i].reg_date);
            content += "<td>"+date.toLocaleDateString('ko-KR')+"</td>";
            content += "<td>"+list[i].hit+"</td>";
            content += "</tr>";
      }
      $("#reviewList").empty();
      $("#reviewList").append(content);
   }else if(user_grade == 0){
      for(var i=0;i<list.length;i++){
            content += "<tr>";
            content += "<td>";
            content += "<a href='reviewDetail?board_idx="+list[i].board_idx+"'>"+list[i].board_subject+"</a>";
            content += "</td>";
            
            content += '<td><a href="userPageReviewListCall?userId='+list[i].id+'">'+list[i].id+'</a></td>';
            
            var date = new Date(list[i].reg_date);
            content += "<td>"+date.toLocaleDateString('ko-KR')+"</td>";
            content += "<td>"+list[i].hit+"</td>";
            content += "</tr>";
      }
      $("#reviewList").empty();
      $("#reviewList").append(content);
   }
}      
</script>
</html>