<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
   <table>
   <div>
      <a href="userlist">유저</a>&nbsp;&nbsp;
      <a href="AdminInfoList">여행지</a>&nbsp;&nbsp;
      <a href="allList">전체게시물</a>&nbsp;&nbsp;
      <a href="blindList">블라인드</a>
   </div>
   <div style="display:inline-block;">
      <c:if test="${sessionScope.user_grade >= 1}">
         <button onclick="location.href='./whatPage?page=여행지정보글쓰기'">글쓰기</button>
      </c:if>
   </div>
   <button onclick="AdminInfoDelete()">삭제</button>
      <thead>
         <tr>
            <th><input type="checkbox" id="all"/></th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
         </tr>
      </thead>
      <tbody id="adminInfoList">
      
      </tbody>
      <tr id="tr">
         <td colspan="5" id="paging">
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
var url=window.location.search.split('?id=')[1];
console.log(url);

var showPage = 1;
listCall(showPage);

var loginId = "${sessionScope.loginId}";
var user_grade = "${sessionScope.user_grade}";

function listCall(page){
   $.ajax({
      type:'get',
      url:'AdminInfoListCall',
      data:{"id":url,"page":page},
      dataType:'JSON',
      success:function(data){
         drawList(data.admininfolist);
         
         if(data.admininfolist.length==0){
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
         for(var i=0; i<list.length; i++){
            content +='<tr>';
            content +='<td><input type="checkbox" value="'+list[i].board_idx+'"/></td>';
            content +='<td>';
            content +="<a href='infoDetail?board_idx="+list[i].board_idx+"'>"+list[i].board_subject+"</a>";
            content +='</td>';

            content += "<td class='dropdown'><a href='#' data-toggle='dropdown'>"+list[i].id+"</a>";
            content += '<ul class="dropdown-menu">';
            content += '<li><a href="userPageReviewListCall?userId='+list[i].id+'">유저페이지</a></li>';
            content += '<li><a href="#" onclick="userGrade_popup(\''+list[i].id+'\')">상태변경</a></li>';
            content += '</ul></td>';

            content +='<td>'+list[i].reg_date+'</td>';
            content +='<td>'+list[i].hit+'</td>';
            content +='</tr>';
         }
    
      
      $('#adminInfoList').empty();
      $('#adminInfoList').append(content);
        
   }else{
      for(var i=0; i<list.length; i++){
            content +='<tr>';
            content +='<td><input type="checkbox" value="'+list[i].board_idx+'"/></td>';
            content +='<td>';
            content +="<a href='infoDetail?board_idx="+list[i].board_idx+"'>"+list[i].board_subject+"</a>";
            content +='</td>';

            content += "<td>"+list[i].id+"</td>";

            content +='<td>'+list[i].reg_date+'</td>';
            content +='<td>'+list[i].hit+'</td>';
            content +='</tr>';
         }
      
      
      $('#adminInfoList').empty();
      $('#adminInfoList').append(content);
   }
}

$("#all").click(function(){
   var $chk = $('input[type="checkbox"]');
   console.log($chk);
   //attr:정적인 속성을 다룰때
   //prop:동적인 속성을 다룰때
   
   if($(this).is(':checked')){
      $chk.prop('checked',true); //prop으로 속성을 바꿔준다
   }else{
      $chk.prop('checked',false);
   }
});

function AdminInfoDelete(){
   var chkArr=[]; //배열을 만들어주고
   
   $('input[type="checkbox"]:checked').each(function(idx,item){
      if($(this).val()!='on'){
         chkArr.push($(this).val()); //배열에 push로 데이터를 넣어준다
      }
   
});
   console.log(chkArr);
   $.ajax({
      type:'get',
      url:'AdminInfoPhotoDelete',
      data:{'AdminInfoPhotoDeleteList':chkArr},
      dataType:'JSON',
      success:function(data){
         console.log(data);
         if(data.msg !=""){
            alert(data.msg);
            listCall(showPage);
         }
      },
      error:function(e){
         console.log(e);
      }
   });
}

</script>
</html>