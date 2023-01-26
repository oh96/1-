<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta charset="UTF-8">
<title>위치 찾기</title>
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<script src="resources/js/jquery.twbsPagination.js" type="text/javascript"></script>
<script>

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
      <thead>
         <tr>
            <td colspan="3"><input type="text" id="search_place"
               placeholder="여행지를 검색하세요" />
               <button onclick="search_place();">검색</button></td>
         </tr>
      </thead>
      <tbody id="list">
      </tbody>
      <tr id="tr">
         <td colspan="3" id="paging">
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

function listCall(page){
   $.ajax({
      type:'get',
      url:'reviewListPop',
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
//                   redraw(page);
               }
            });
         }
      },
      error:function(e){
         console.log(e);
      }
   });
}

/*
var flag = true;   //이거 완전 중요함. 

function redraw(page){
   
   if(flag){
      flag = false;
      $.ajax({
         url : "searchPlace",
         data: {
            "page" : page
         },
         dataType:"JSON",
         contextType : "application/json",
         success: function(json){
            
            console.log(json);
            $("#pagination-div").twbsPagination("changeTotalPages", json[0].TOTALPAGECNT , page);
            
                // 여기 아래에 컨텐츠를 만드는 로직 추가
                // ex) $("content").html(html);
            search_place();
      
         },
         complete: function(){   // 이부분 중요
            flag = true;   //호출 완료되면 flag 값을 사용가능하게 변경
         }
         
      });
   }
   
}
*/

function drawList(list){
   var content = '';
   if(list.length>0){
      for(var i=0; i<list.length; i++){
         content += '<tr>';
         content += '<td>'+list[i].loc_idx+'</td>';
         content += '<td><span id="move" onclick="move(\''+list[i].loc_name+','+list[i].loc_idx+'\')" style="cursor:pointer;">' + list[i].loc_name +'</span></td>';
         content += '<td>'+list[i].road_address+'</td>';
         content += '</tr>';
      }
   }
   $('#list').empty();
   $('#list').append(content);
}




function search_place(){
   var keyword = document.getElementById('search_place').value;
   console.log("검색어: "+keyword);
   $.ajax({
      url:"reviewsearchPlace",
      type:"get",
      dataType:"JSON",
      data:{"keyword":keyword},
      success:function(data){
         console.log(data);
         if(data.list.length>0){
            var content = '';
            for(var i=0; i<data.list.length; i++){
               content += '<tr>';
               content += '<td>'+data.list[i].loc_idx+'</td>';
               content += '<td><span id="title" onclick="move(\''+data.list[i].loc_name+','+data.list[i].loc_idx+'\')" style="cursor:pointer;">'+data.list[i].loc_name+'</span></td>';
               content += '<td>'+data.list[i].road_address+'</td>';
               content += '</tr>';
            }
         }
         
         console.log(data.total);
         $('#list').empty();
         $('#list').append(content);   
         $('#tr').empty();
      }
         
   })
}


function move(param){
   
   name = param.substring(0,param.indexOf(","));
   idx = param.substring(param.lastIndexOf(",")+1);
   console.log(name);
   console.log(idx);
   $(opener.document).find("#location_input").val(name);
   $(opener.document).find("#locationIdx_input").val(idx);
   

   window.close();
}

</script>
</html>