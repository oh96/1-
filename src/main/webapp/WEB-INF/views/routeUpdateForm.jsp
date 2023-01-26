<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
   function location_popup1(){
      var url="routeSearchPopup1";
      var name="위치 찾기";
      var option="width=400,height=500,left=50,top=50";   
      window.open(url,name,option);
   }
   function location_popup2(){
      var url="routeSearchPopup2";
      var name="위치 찾기";
      var option="width=400,height=500,left=50,top=50";   
      window.open(url,name,option);
   }
   function location_popup3(){
      var url="routeSearchPopup3";
      var name="위치 찾기";
      var option="width=400,height=500,left=50,top=50";   
      window.open(url,name,option);
   }
   function location_popup4(){
      var url="routeSearchPopup4";
      var name="위치 찾기";
      var option="width=400,height=500,left=50,top=50";   
      window.open(url,name,option);
   }
   function location_popup5(){
      var url="routeSearchPopup5";
      var name="위치 찾기";
      var option="width=400,height=500,left=50,top=50";   
      window.open(url,name,option);
   }
   function location_popup6(){
      var url="routeSearchPopup6";
      var name="위치 찾기";
      var option="width=400,height=500,left=50,top=50";   
      window.open(url,name,option);
   }
   function location_popup7(){
      var url="routeSearchPopup7";
      var name="위치 찾기";
      var option="width=400,height=500,left=50,top=50";   
      window.open(url,name,option);
   }
</script>
<style></style>
</head>
<body>
<body>
   <div>
      <div>
         <input type="text" id="title" placeholder="제목은 경로에 따라 자동으로 입력됩니다." readonly>
      </div>
      <br>

      <div id="route1">
         <div id="start">
            <c:forEach items="${locName[0]}" var="locName1">
            <input type="text" class="sightName1" value="${locName1}" placeholder="출발지" readonly>
            </c:forEach>
            <input class="locationIdx_input1" readonly="readonly" type="hidden" />
            <input type="button" value="위치찾기" onclick="location_popup1();">
            <input type="button" id="addWay" value="+">
         </div>
         <c:forEach items="${locName}" var="locName"></c:forEach>
         <c:if test="${fn:length(locName) > 2}">
         <div class="wayPoint1">
            <c:forEach items="${locName[2]}" var="locName3">
            <input type="text" class="sightName3" value="${locName3}" placeholder="경유지" readonly>
            </c:forEach>
            <input class="locationIdx_input3" readonly="readonly" type="hidden" />
            <input type="button" value="위치찾기" onclick="location_popup3();">
            <input type="button" class="delWay1" value="-">
         </div>
         </c:if>
         <c:if test="${fn:length(locName) > 3}">
         <div class="wayPoint2">
            <c:forEach items="${locName[3]}" var="locName4">
            <input type="text" class="sightName4" value="${locName4}" placeholder="경유지" readonly>
            </c:forEach>
            <input class="locationIdx_input4" readonly="readonly" type="hidden" />
            <input type="button" value="위치찾기" onclick="location_popup4();">
            <input type="button" class="delWay2" value="-">
         </div>
         </c:if>
         <c:if test="${fn:length(locName) > 4}">
         <div class="wayPoint3">
            <c:forEach items="${locName[4]}" var="locName5">
            <input type="text" class="sightName5" value="${locName5}" placeholder="경유지" readonly>
            </c:forEach>
            <input class="locationIdx_input5" readonly="readonly" type="hidden" />
            <input type="button" value="위치찾기" onclick="location_popup5();">
            <input type="button" class="delWay3" value="-">
         </div>
         </c:if>
         <c:if test="${fn:length(locName) > 5}">
         <div class="wayPoint4">
            <c:forEach items="${locName[5]}" var="locName6">
            <input type="text" class="sightName6" value="${locName6}" placeholder="경유지" readonly>
            </c:forEach>
            <input class="locationIdx_input6" readonly="readonly" type="hidden" />
            <input type="button" value="위치찾기" onclick="location_popup6();">
            <input type="button" class="delWay4" value="-">
         </div>
         </c:if>
         <c:if test="${fn:length(locName) > 6}">
         <div class="wayPoint5">
            <c:forEach items="${locName[6]}" var="locName7">
            <input type="text" class="sightName7" value="${locName7}" placeholder="경유지" readonly>
            </c:forEach>
            <input class="locationIdx_input7" readonly="readonly" type="hidden" />
            <input type="button" value="위치찾기" onclick="location_popup7();">
            <input type="button" class="delWay5" value="-">
         </div>
         </c:if>
      </div>
      <div id="route2">
         <c:forEach items="${locName[1]}" var="locName2">
         <input type="text" class="sightName2" value="${locName2}" placeholder="도착지" readonly>
         </c:forEach>
         <input class="locationIdx_input2" readonly="readonly" type="hidden" />
         <input type="button" value="위치찾기" onclick="location_popup2();">
      </div>


   </div>
   <br>
   <div><textarea id="content" placeholder="내용을 입력하세요"></textarea></div>
   <div id="file">
         <label for="file_test">파일 업로드:</label>
         <input type="file"  id="file_test" name="file_test" >            
   </div>
   <br>
   <div><input id=routeUpdate type="button" value="수정하기"></div>


</body>
</body>
<script>

var locIdx = JSON.parse("${locIdx}");

var subject = "${subject}";

var content = "${content}";



for(var i=0; i<locIdx.length; i++) {
   $(document).find($(".locationIdx_input"+(i+1))).val(locIdx[i]);

}

$(document).find("#content").val(content);
$(document).find("#title").val(subject);

$('#addWay').on('click',function() {
   var wayPoint = '';
   var cnt = $('#route1 div').length;
   if(cnt < 6) {
   wayPoint += '<div class="wayPoint'+cnt+'">';
   wayPoint += '<input type="text" class="sightName'+(cnt+2)+'" value="" placeholder="경유지" readonly>';
   wayPoint += '<input class="locationIdx_input'+(cnt+2)+'" readonly="readonly" type="hidden" />';
   wayPoint += '<input type="button" value="위치찾기" '+'onclick="location_popup'+(cnt+2)+'();">';
   wayPoint += '<input type="button" class="delWay'+cnt+'" value="-">';
   wayPoint += '</div>';
   $('#route1').append(wayPoint);
   } else {
      return false;
   }
});

$(document).on("click",".delWay1",function(){
   $('.wayPoint1').remove();
   
   for(var i=0; i<4; i++){
      $(".wayPoint"+(i+2)).attr("class","wayPoint"+(i+1));
      $(".sightName"+(i+4)).attr("class","sightName"+(i+3));
      $(".locationIdx_input"+(i+4)).attr("class","locationIdx_input"+(i+3));
      $(".search"+(i+4)).attr("class","search"+(i+3));
      $(".delWay"+(i+2)).attr("class","delWay"+(i+1));
   }
   
});
$(document).on("click",".delWay2",function(){
   $('.wayPoint2').remove();
   for(var i=0; i<3; i++){
      $(".wayPoint"+(i+3)).attr("class","wayPoint"+(i+2));
      $(".sightName"+(i+5)).attr("class","sightName"+(i+4));
      $(".locationIdx_input"+(i+5)).attr("class","locationIdx_input"+(i+4));
      $(".search"+(i+5)).attr("class","search"+(i+4));
      $(".delWay"+(i+3)).attr("class","delWay"+(i+2));
   }
   
});
$(document).on("click",".delWay3",function(){
   $('.wayPoint3').remove();
   for(var i=0; i<2; i++){
      $(".wayPoint"+(i+4)).attr("class","wayPoint"+(i+3));
      $(".sightName"+(i+6)).attr("class","sightName"+(i+5));
      $(".locationIdx_input"+(i+6)).attr("class","locationIdx_input"+(i+5));
      $(".search"+(i+6)).attr("class","search"+(i+5));
      $(".delWay"+(i+4)).attr("class","delWay"+(i+3));
   }
});
$(document).on("click",".delWay4",function(){
   $('.wayPoint4').remove();
   $(".wayPoint5").attr("class","wayPoint4");
   $(".sightName7").attr("class","sightName6");
   $(".locationIdx_input"+(i+7)).attr("class","locationIdx_input"+(i+6));
   $(".search7").attr("class","search6");
   $(".delWay5").attr("class","delWay4");
});
$(document).on("click",".delWay5",function(){
   $('.wayPoint5').remove();
});


$(document).on('click','#routeUpdate',function() {

   var sight1 = [];
   var locIdx1 = [];
   for(var i=0; i<$('#route1').children().length+1; i++) {      
      locIdx1[i] = $(".locationIdx_input"+(i+1)).val();

   }

   var startTxt = $('.sightName1').val();

   var wayPointTxt1 = $('.sightName3').val();
   var wayPointTxt2 = $('.sightName4').val();

   var wayPointTxt3 = $('.sightName5').val();
   var wayPointTxt4 = $('.sightName6').val();
   var wayPointTxt5 = $('.sightName7').val();
   var goalTxt = $('.sightName2').val();
   
   if($('#route1').children().length+1 == 2) {
      $(document).find("#title").val(startTxt+"-"+goalTxt);
   }else if($('#route1').children().length+1 == 3) {
      $(document).find("#title").val(startTxt+"-"+wayPointTxt1+"-"+goalTxt);
   }else if($('#route1').children().length+1 == 4) {
      $(document).find("#title").val(startTxt+"-"+wayPointTxt1+"-"+wayPointTxt2+"-"+goalTxt);
   }else if($('#route1').children().length+1 == 5) {
      $(document).find("#title").val(startTxt+"-"+wayPointTxt1+"-"+wayPointTxt2+"-"+wayPointTxt3+"-"+goalTxt);
   }else if($('#route1').children().length+1 == 6) {
      $(document).find("#title").val(startTxt+"-"+wayPointTxt1+"-"+wayPointTxt2+"-"+wayPointTxt3+"-"+wayPointTxt4+"-"+goalTxt);
   }else {
      $(document).find("#title").val(startTxt+"-"+wayPointTxt1+"-"+wayPointTxt2+"-"+wayPointTxt3+"-"+wayPointTxt4+"-"+wayPointTxt5+"-"+goalTxt);
   }
   
   var title1 = $('#title').val();

   var loginId1 = "${sessionScope.loginId}";


   var content1 = $('#content').val();

   var board_idx1 = "${board_idx}";
   
   $.ajax({
      url: 'routeUpdate',
      dataType: 'json',
      type: 'post',
      data : {
         board_idx : board_idx1,
         locIdx : locIdx1,
         content : content1,
         loginId : loginId1,
         title : title1
      },
      success: function(data) {
         alert("게시글 수정을 완료하였습니다.");
         var board_idx = data.board_idx;
         location.href="./routeDetail?board_idx="+board_idx;
      }
      });

});
</script>
</html>