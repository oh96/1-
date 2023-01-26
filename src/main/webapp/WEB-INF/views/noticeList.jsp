<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<script src="resources/js/jquery.twbsPagination.js"></script>
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
   <div style="display:inline-block;">
      <c:if test="${sessionScope.user_grade >= 1}">
         <button onclick="location.href='./whatPage?page=공지글쓰기'">글쓰기</button>
      </c:if>
   </div>
   <table>
      <thead>
         <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
         </tr>
      </thead>
      <tbody id="noticeList">
      </tbody>
      <tr>
         <td colspan="5" id="paging">   
            <div class="container">
               <nav aria-label="Page navigation" style="test-align:center">
                  <ul class="pagination" id="pagination"></ul>
               </nav>
            </div>
         </td>
      </tr>
   </table>
</body>
<script>
var showPage = 1;
noticelistCall(showPage);

var user_grade = "${sessionScope.user_grade}";

function noticelistCall(page){
   $.ajax({
      type:'GET',
      url:'noticelistCall',
      data:{page:page}, //페이지란 이름으로 현재 받은 페이지를 넣기-->홈컨트롤러로 requestparam으로 page받기
      dataType:'JSON',
      success:function(data){
         console.log(data);
         drawList(data.noticeList);   
         //플러그인 적용하기
         $('#pagination').twbsPagination({
            startPage:1, //시작페이지
            totalPages:data.total, //총 페이지 수 
            visiblePages:5, //기본으로 보여줄 페이지 수
            onPageClick:function(e, page){ //클릭했을때 실행 내용
               console.log(page);
               noticelistCall(page);
            }
         });
      },
      error:function(e){
         console.log(e);
      }
   });
}

function drawList(list){  
   var content='';
   if(user_grade == 2){
      for(var i=0; i<list.length; i++){
         content +='<tr>';
         content +='<td>'+list[i].board_idx+'</td>';
         content +='<td><a href="noticedetail?board_idx='+list[i].board_idx+'">'+list[i].board_subject+'</td>';
         
         content += "<td class='dropdown'><a href='#' data-toggle='dropdown'>"+list[i].id+"</a>";
          content += '<ul class="dropdown-menu">';
          content += '<li><a href="userPageReviewListCall?userId='+list[i].id+'">유저페이지</a></li>';
          content += '<li><a href="#" onclick="userGrade_popup(\''+list[i].id+'\')">상태변경</a></li>';
          content += '</ul></td>';
         
         var date = new Date(list[i].reg_date);
         content +='<td>'+date.toLocaleDateString('ko-kr')+'</td>';
         content +='<td>'+list[i].hit+'</td>';
         content +='</tr>';
      }
      
      $("#noticeList").empty(); 
      $("#noticeList").append(content);
   }else{
      for(var i=0; i<list.length; i++){
            content +='<tr>';
            content +='<td>'+list[i].board_idx+'</td>';
            
            content +='<td><a href="noticedetail?board_idx='+list[i].board_idx+'">'+list[i].board_subject+'</td>';
            
            content += "<td>"+list[i].id+"</td>";
            var date = new Date(list[i].reg_date);
            content +='<td>'+date.toLocaleDateString('ko-kr')+'</td>';
            content +='<td>'+list[i].hit+'</td>';
            content +='</tr>';
         }
         
         $("#noticeList").empty(); 
         $("#noticeList").append(content);
   }
   
}
</script>
</html>