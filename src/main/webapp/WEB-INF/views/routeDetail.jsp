<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=i4kv2usz7y"></script>
<script src="resources/js/jquery.twbsPagination.js"></script>
<style>
.pagination{padding: 0px 150px;}
#body {width: 50%; margin: auto;}
.list {float: right;}
#map {margin-top: 300px;}
.author{float: right;}
.subject{text-align: center;}
.topInfo {
   margin-bottom: 20px;
   padding: 14px 10px 16px;
   background: #f8f8f8;

}

.date {
   float: left;
}

.hit {
   float: right;
}

.rateStar {
   text-align: center;
}

table {
   color: black;
   width: 100%;
}

thead {
   border-bottom: 1px solid black;
   border-top: 1px solid black;
}

.content {
   border-bottom: 1px solid black;
}

#comment_Area {
   width: 50%;
   margin: auto;
}

#commentTxt {
   width: 100%;
   height: 100px;
}

.submit_comment {
   width: 115px;
   float: right;
   
}

.star-rating {
  display: flex;
  flex-direction: row-reverse;
  font-size: 2.25rem;
  line-height: 2.5rem;
  justify-content: space-around;
  padding: 0 0.2em;
  text-align: center;
  width: 5em;
}
 
.star-rating input {
  display: none;
}
 
.star-rating label {
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 2.3px;
  -webkit-text-stroke-color: #2b2a29;
  cursor: pointer;
}
 
.star-rating :checked ~ label {
  -webkit-text-fill-color: gold;
}
 
.star-rating label:hover, .star-rating label:hover ~ label {
  -webkit-text-fill-color: #fff58c;
}


</style>
</head>
<body>
   <div id="top">
   <div class="topInfo">
      <span class="date">작성일 : ${routeDetailInfo.reg_date}</span>
      <span class="hit">조회수 : ${routeDetailInfo.hit}</span>
   </div>
   <div id="infoSubject">
      <h3 class="subject">${routeDetailInfo.board_subject}</h3>
      <span class="author">작성자 : ${routeDetailInfo.id}</span>
      <c:if test="${sessionScope.loginId == routeDetailInfo.id }">
      <button type="button" onclick="location.href='routeUpdateForm?board_idx='+${routeDetailInfo.board_idx}">수정</button>
      <button id="delete" type="button" onclick="make(event)">삭제</button>
      </c:if>
      <c:if test="${sessionScope.user_grade >= 1 }">
         <button type="button" onclick="location.href='routeBlindForm?board_idx='+${routeDetailInfo.board_idx}">블라인드</button>
      </c:if>
   </div>
   </div>
   <br><hr><br>
   
   <div id="map" style="width:50%;height:400px; margin:auto;"></div>
   <br><br>
   <div id="body">
      <p>${routeDetailInfo.board_content}</p>
      <button class="list" type="button" onclick="location.href='./whatPage?page=여행지경로'">목록</button>
   </div>
   <br><br>
   <div id="comment_Area">
   <div id="starAvg"></div>
   <table>
   <c:if test="${(sessionScope.loginId != routeDetailInfo.id && sessionScope.user_grade == 0) || sessionScope.loginId == null}">
   <thead>
   <tr>
      <td class="rateStar"> 별점 주기 : </td>
      <td>
         <div id="comment_Star">
            <div class="star-rating space-x-4 mx-auto">
               <input type="radio" id="5-stars" name="rating" class="rating" value="5"/>
               <label for="5-stars" class="star pr-4">★</label>
               <input type="radio" id="4-stars" name="rating" class="rating"  value="4"/>
               <label for="4-stars" class="star">★</label>
               <input type="radio" id="3-stars" name="rating" class="rating"  value="3"/>
               <label for="3-stars" class="star">★</label>
               <input type="radio" id="2-stars" name="rating" class="rating"  value="2"/>
               <label for="2-stars" class="star">★</label>
               <input type="radio" id="1-star" name="rating" class="rating"  value="1" />
               <label for="1-star" class="star">★</label>
            </div>
         </div>
      </td>
      <td></td>
   </tr>
   <tr>
      <td colspan="2"><input type="text" class="commentTxt" placeholder="내용을 입력하세요."></td>
      <td><input type="button" onclick="submitComment();" class="submit_comment" value="댓글 작성하기" id="commentWrite"></td>
   </tr>
   <tr><td colspan="3"></td></tr>
   </thead>
   </c:if>   
   <tbody id="comment_List">
   
   </tbody>
   <tfoot>
    <tr>
       <td colspan="3" id="paging">
          <div>
             <nav aria-label="Page navigation" style="text-align:center">
                <ul class="pagination" id="pagination"></ul>
             </nav>
          </div>
       </td>
    </tr>
    </tfoot>
   </table>
   </div>   
   <br><br>
   
</body>
<script>

function make(e){
	if(confirm("정말 삭제하시겠습니까?") == false){
		e.preventDefault();
	}else{
		location.href="routeErase?board_idx=${routeDetailInfo.board_idx}";
	}
}

var board = "${routeDetailInfo.board_idx}";
var showPage = 1;
commentListCall(showPage, board);
var starAvg;

var lng = JSON.parse("${lng}");
var lat = JSON.parse("${lat}");
var polypath = JSON.parse("${polypath}");




   var map = new naver.maps.Map('map', {
      center : new naver.maps.LatLng(polypath[0]),
      zoom: 10
   });
   var polyline = new naver.maps.Polyline({
       map : map,
       path : polypath,
       strokeColor : '#5347AA',
       strokeWeight : 2
   });
   var marker = new naver.maps.Marker({
          position: polypath[0],
          map: map
      });
   var marker = new naver.maps.Marker({
          position: polypath[polypath.length -1],
          map: map
      });
   var marker = new naver.maps.Marker({
          position: new naver.maps.LatLng(lat[2], lng[2]),
          map: map
      });
   var marker = new naver.maps.Marker({
          position: new naver.maps.LatLng(lat[3], lng[3]),
          map: map
      });
   var marker = new naver.maps.Marker({
          position: new naver.maps.LatLng(lat[4], lng[4]),
          map: map
      });
   var marker = new naver.maps.Marker({
          position: new naver.maps.LatLng(lat[5], lng[5]),
          map: map
      });
   var marker = new naver.maps.Marker({
          position: new naver.maps.LatLng(lat[6], lng[6]),
          map: map
      });    
   
var rating1;   
$(document).on('click','.rating', function(){
   rating1 = $(this).val(); 
   console.log(rating1);
});

var loginId = "${sessionScope.loginId}";
function commentListCall(showPage, board){
   $.ajax({
      type:'get',
      url:'commentListCall',
      data:{
         page:showPage,
         board_idx:board
      },
      dataType:"JSON",
      success:function(data){
         starAvg = data.starAvg;
         console.log(typeof starAvg);
         drawList(data.commentlist, starAvg);
         putStar(data.commentlist);
         $("#pagination").twbsPagination({
            startPage:1,
            totalPages:data.total,
            visiblePages:5,
            onPageClick:function(e, showPage){
            commentListCall(showPage, board);
            }
         });
      },
      error:function(e){

      }
   });
}

// console.log(commentlist);

function drawList(commentlist){
   var content="";
   for(var i=0;i<commentlist.length;i++){
//       var star = "";
//       for(var i1=0; i<${commentlist[i1].star}; i1++) {
//          if(commentlist[i1].star<1) {
//             star += "★";
//          }else {
//             star +="☆";
//          }
//          if(commentlist[i1].star<2) {
//             star += "★";
//          }else {
//             star +="☆";
//          }
//          if(commentlist[i1].star<3) {
//             star += "★";
//          }else {
//             star +="☆";
//          }
//          if(commentlist[i1].star<4) {
//             star += "★";
//          }else {
//             star +="☆";
//          }
//          if(commentlist[i1].star<5) {
//             star += "★";
//          }else {
//             star +="☆";
//          }
//       }
      content += "<tr class='starImg"+i+"'>";
//       content += "<td>별점 : "+commentlist[i].star+"</td>";
      content += "<td>작성자 : "+commentlist[i].id+"</td>";
      var date = new Date(commentlist[i].comment_date);
      content += "<td>작성일 : "+date.toLocaleDateString('ko-KR')+"</td>";
      content += "</tr>";
      content += "<tr>";
      content += "<td colspan='2' class='content'>"+commentlist[i].comment_content+"</td>";
      if(loginId == commentlist[i].id){
         content += "<td><input type='button' onclick='commentDelete(event,"+commentlist[i].comment_idx+")' value='댓글 삭제'></td>";
      }else{
         content += "<td></td>";
      }
      content += "</tr>";
   }
   $("#comment_List").empty();
   $("#comment_List").append(content);
   if($("#starAvg").children().length==0) {
      $("#starAvg").append("<p> 별점 평균 : "+starAvg+"</p>");
   }
}


function submitComment(){
   
   var comment1 = $('.commentTxt').val();
   console.log(comment1);
   if(loginId == ""){
      alert("로그인이 필요한 서비스 입니다.");
      location.href='./whatPage?page=로그인화면';
   }else{
      $.ajax({
         url: 'commentWrite',
         dataType: 'JSON',
         type: 'POST',
         data: {
            rating:rating1,
            comment:comment1,
            board:board,
            loginId:loginId
         },
         success: function(data) {
            alert(data.msg);
            console.log(data.result);
            location.reload(true);
         }
      });
   }
}

function putStar(commentlist) {
   
   for(var i3=0; i3<commentlist.length; i3++) {
      var star = "";
      for(var i4=0; i4<5; i4++) {
         if(i4<commentlist[i3].star) {
            star += "★";
         }else {
            star += "☆";
         }
      }
      $(".starImg"+i3).prepend("<td>별점 : "+star+"</td>");
   }
}

function commentDelete(e, comment_idx) {

   e.preventDefault();
   
   if(confirm("진짜로 댓글 삭제?")) {
      $.ajax({
         type:'post',
         url:'commentDelete',
         data: {
            comment_idx:comment_idx
         },
         dataType:'json',
         success:function(data) {
            location.reload(true);
         }
      });
   } else {
      return false;
   }

}

</script>
</html>