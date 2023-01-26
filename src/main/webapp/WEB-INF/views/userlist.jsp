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
   <table>
   <div>
      <a href="userlist">유저</a>&nbsp;&nbsp;
      <a href="AdminInfoList">여행지</a>&nbsp;&nbsp;
      <a href="allList">전체게시물</a>&nbsp;&nbsp;
      <a href="blindList">블라인드</a>
   </div>
      <thead>
         <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>나이</th>
            <th>성별</th>
            <th>이메일</th>
            <th>계정상태</th>
         </tr>
      </thead>
      <tbody id="userlist">
      
      </tbody>
      <tr>
         <td colspan="6" id="paging">   
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
userlistCall(showPage);

var user_grade = "${sessionScope.user_grade}";
var userState ="${userState}";
console.log(userState);

function userlistCall(userpage){
   $.ajax({
      type:'GET',
      url:'userlistCall',
      data:{userpage:userpage}, 
      dataType:'JSON',
      success:function(data){
         console.log(data.userList);
         drawList(data.userList);   
         //플러그인 적용하기
         $('#pagination').twbsPagination({
            startPage:1, //시작페이지
            totalPages:data.total, //총 페이지 수 
            visiblePages:10, //기본으로 보여줄 페이지 수
            onPageClick:function(e, userpage){ //클릭했을때 실행 내용
               console.log(userpage);
               userlistCall(userpage);
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
   
   for(var i=0; i<list.length; i++){
	  
      content +='<tr>';
      
      if(list[i].user_state == "탈퇴"){
    	  content += "<td>"+list[i].id+"</td>";
      }else{
	      content += "<td class='dropdown'><a href='#' data-toggle='dropdown'>"+list[i].id+"</a>";
	      content += '<ul class="dropdown-menu">';
	      content += '<li><a href="userPageReviewListCall?userId='+list[i].id+'">유저페이지</a></li>';
	      content += '<li><a href="#" onclick="userGrade_popup(\''+list[i].id+'\')">상태변경</a></li>';
	      content += '</ul></td>';
      }
      
      content +='<td>'+list[i].user_name+'</td>';
      content +='<td>'+list[i].age+'</td>';
      content +='<td>'+list[i].gender+'</td>';
      content +='<td>'+list[i].email+'</td>';
      content +='<td>'+list[i].user_state+'</td>';
      content +='</tr>';
   }
   $("#userlist").empty(); 
   $("#userlist").append(content);
}


</script>
</html>