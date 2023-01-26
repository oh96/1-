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
<style>
   table, th, tr, td{
      border: 1px solid black;
      border-collapse: collapse;
      padding: 5px 10px;
   }
</style>
</head>
<body>
   <div>
      <a href="userlist">유저</a>&nbsp;&nbsp;
      <a href="AdminInfoList">여행지</a>&nbsp;&nbsp;
      <a href="allList">전체게시물</a>&nbsp;&nbsp;
      <a href="blindList">블라인드</a>
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
      <tbody id="allList">
      
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
allListCall(showPage);



function allListCall(page){
   $.ajax({
      type:'GET',
      url:'allListCall',
      data:{page:page}, 
      dataType:'JSON',
      success:function(data){
         console.log(data.allList);
         drawList(data.allList);   
         //플러그인 적용하기
         $('#pagination').twbsPagination({
            startPage:1, //시작페이지
            totalPages:data.total, //총 페이지 수 
            visiblePages:10, //기본으로 보여줄 페이지 수
            onPageClick:function(e,page){ //클릭했을때 실행 내용
               console.log(page);
               allListCall(page);
            }
         });
      },
      error:function(e){
         console.log(e);
      }
   });
}

function drawList(allList){  
      var content='';
      
      for(var i=0; i<allList.length; i++){
        var cls_code = allList[i].cls_code;
        // console.log(cls_code);
         content +='<tr>';
         content +='<td>'+allList[i].board_idx+'</td>';
         if(cls_code =='1'){
            content +='<td><a href="infoDetail?board_idx='+allList[i].board_idx+'">'+allList[i].board_subject+'</td>';
         }else if(cls_code =='2'){
            content +='<td><a href="reviewDetail?board_idx='+allList[i].board_idx+'">'+allList[i].board_subject+'</td>';
         }else if(cls_code =='3'){
            content +='<td><a href="routeDetail?board_idx='+allList[i].board_idx+'">'+allList[i].board_subject+'</td>';
         }
         
         content +='<td>'+allList[i].id+'</td>';
         
         var date = new Date(allList[i].reg_date);
         content +='<td>'+allList[i].reg_date+'</td>';
         content +='<td>'+allList[i].hit+'</td>';
         
         content +='</tr>';
      }
      $("#allList").empty(); 
      $("#allList").append(content);
   }



</script>
</html>