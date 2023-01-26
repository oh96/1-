<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<script src="resources/js/jquery.twbsPagination.js"></script>
<style>
   table,th,td{
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
   
   <button onclick="AdminBlindDelete()">해제</button>
      <thead>
         <tr>
            <th><input type="checkbox" id="all"/></th>
            <th>사유</th>
            <th>제목</th>
            <th>관리자아이디</th>
            <th>블라인드일자</th>
            <th>제재아이디</th>
         </tr>
      </thead>
      <tbody id="blindInfoList">
      
      </tbody>
      <tr id="tr">
         <td colspan="6" id="paging">
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
//var url=window.location.search.split('?id=')[1];
//console.log(url);

var showPage = 1;
listCall(showPage);

function listCall(page){
   $.ajax({
      type:'get',
      url:'blindListCall',
      data:{"page":page},
      dataType:'JSON',
      success:function(data){
         console.log(data.list);
         drawList(data.list);
         $('#pagination').twbsPagination({
            startPage:1,
            totalPages:data.total, 
            visiblePages:5,
            onPageClick:function(e,page){ 
            listCall(page);
                  //console.log($("#pagination"));
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
   
      for(var i=0; i<list.length; i++){
         content +='<tr>';
         content +='<td><input type="checkbox" value="'+list[i].blind_idx+'"/></td>';
         content +='<td>'+list[i].reason+'</td>'
         content +='<td>'+list[i].board_subject+'</td>'
         content +='<td>'+list[i].manager+'</td>'
         
         var date = new Date(list[i].blind_date);
         content +='<td>'+date.toLocaleDateString('ko-KR')+'</td>'
         content +='<td>'+list[i].block_id+'</td>'
         content +='</tr>';
      }
   
   $('#blindInfoList').empty();
   $('#blindInfoList').append(content);
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

function AdminBlindDelete(){
   var chkArr=[]; //배열을 만들어주고
   
   $('input[type="checkbox"]:checked').each(function(idx,item){
      if($(this).val()!='on'){
         chkArr.push($(this).val()); //배열에 push로 데이터를 넣어준다
      }
   
});
    console.log(chkArr);
   $.ajax({
      type:'get',
      url:'AdminBlindDelete',
      data:{'AdminBlindDeleteList':chkArr},
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