<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
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
   <span style="background-color: #F1BC31; font-size: 30px;">여행지 정보 TOP5</span>
   <table>
      <tbody id="infolist">
      </tbody>
   </table>
   <span style="background-color: #F1BC31; font-size: 30px;">여행지 후기 TOP5</span>
   <table>
<!--       <thead> -->
<!--          <tr> -->
<!--             <th>제목</th> -->
<!--             <th>작성자</th> -->
<!--             <th>작성일</th> -->
<!--             <th>조회수</th> -->
<!--          </tr> -->
<!--       </thead> -->
      <tbody id="reviewlist">
      </tbody>
   </table>
   <span style="background-color: #F1BC31; font-size: 30px;">여행지 경로 TOP5</span>
   <table>
      <tbody id="routelist">
      </tbody>
   </table>
</body>
<script>
var showPage=1;
InfolistCall(showPage);
reviewlistCall(showPage);
routelistCall(showPage);

function InfolistCall(page){
   console.log("check1");
   $.ajax({
      type:'get',
      url:'locationTop',
      data:{"page":page},
      dataType:'json',
      success:function(data){
         console.log("성공");
         console.log(data);
         drawList1(data.infolist);
         
         $('#pagination').twbsPagination({
            startPage:1,
            totalPages:data.total,
            visiblePages:5,
            onPageClick:function(e,page){
            console.log(e);
            InfolistCall(page);
            }
         });
      },
      error:function(e){
         console.log("실패");
         console.log(e);
      }
   });

}

function drawList1(infolist){
   var content = '';
   
   for (var i = 0; i < infolist.length; i++) {
      content += '<tr>';
      content += '<th>'+(i+1)+'</th>'
      content +='<td><a href="infoDetail?board_idx='+infolist[i].board_idx+'">'+infolist[i].board_subject+'</a></td>';
//       content +='<td>'+infolist[i].id+'</td>';
       
//       var date = new Date(infolist[i].reg_date);
//        content += '<td>'+date.toLocaleDateString('ko-KR')+'</td>';
      
//        content +='<td>'+infolist[i].hit+'</td>';
       content +='</tr>';
   }
   
   $('#infolist').empty();//밑에 붙기때문에 한번다 지워주고
   $('#infolist').append(content);//붙여준다
}


function reviewlistCall(page){
   console.log("check1");
   $.ajax({
      type:'get',
      url:'reviewTop',
      data:{"page":page},
      dataType:'json',
      success:function(data){
         console.log("성공");
         console.log(data);
         drawList2(data.reviewlist);
         
         $('#pagination').twbsPagination({
            startPage:1,
            totalPages:data.total,
            visiblePages:5,
            onPageClick:function(e,page){
            console.log(e);
            reviewlistCall(page);
            }
         });
      },
      error:function(e){
         console.log("실패");
         console.log(e);
      }
   });

}

function drawList2(reviewlist){
   var content = '';
   
   for (var i = 0; i < reviewlist.length; i++) {
      content += '<tr>';
      content += '<th>'+(i+1)+'</th>'
      content +='<td><a href="reviewDetail?board_idx='+reviewlist[i].board_idx+'">'+reviewlist[i].board_subject+'</a></td>';
//       content +='<td>'+reviewlist[i].id+'</td>';
       
//       var date = new Date(reviewlist[i].reg_date);
//        content += '<td>'+date.toLocaleDateString('ko-KR')+'</td>';
      
//        content +='<td>'+reviewlist[i].hit+'</td>';
       content +='</tr>';
   }
   
   $('#reviewlist').empty();//밑에 붙기때문에 한번다 지워주고
   $('#reviewlist').append(content);//붙여준다
}

function routelistCall(page){
   console.log("check1");
   $.ajax({
      type:'get',
      url:'routeTop',
      data:{"page":page},
      dataType:'json',
      success:function(data){
         console.log("성공");
         console.log(data);
         drawList3(data.routelist);
         
         $('#pagination').twbsPagination({
            startPage:1,
            totalPages:data.total,
            visiblePages:5,
            onPageClick:function(e,page){
            console.log(e);
            routelistCall(page);
            }
         });
      },
      error:function(e){
         console.log("실패");
         console.log(e);
      }
   });

}

function drawList3(routelist){
   var content = '';
   
   for (var i = 0; i < routelist.length; i++) {
      content += '<tr>';
      content += '<th>'+(i+1)+'</th>'
      content +='<td><a href="routeDetail?board_idx='+routelist[i].board_idx+'">'+routelist[i].board_subject+'</a></td>';
//       content +='<td>'+routelist[i].id+'</td>';
       
//       var date = new Date(routelist[i].reg_date);
//        content += '<td>'+date.toLocaleDateString('ko-KR')+'</td>';
      
//        content +='<td>'+routelist[i].hit+'</td>';
       content +='</tr>';
   }
   
   $('#routelist').empty();//밑에 붙기때문에 한번다 지워주고
   $('#routelist').append(content);//붙여준다
}
   
</script>
</html>