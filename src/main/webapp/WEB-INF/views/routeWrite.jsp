<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
   <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
   <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=i4kv2usz7y"></script>
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
   // 복붙
</script>
   <style>
   #title, #content {
      width:300px;
   }

   </style>
</head>
<body>
   <div>
      <div>
         <input type="text" id="title" placeholder="제목은 경로에 따라 자동으로 입력됩니다." readonly>
      </div>
      <br>

      <div id="route1">
         <div id="start">
            <input type="text" class="sightName1" class="startTxt" value="" placeholder="출발지" readonly>
            <input class="locationIdx_input1" readonly="readonly" type="hidden" />
            <input type="button" value="위치찾기" onclick="location_popup1();">
            <input type="button" id="addWay" value="+">
         </div>
      </div>
      <div id="route2">
         <input type="text" class="sightName2" class="goalTxt" value="" placeholder="도착지" readonly>
         <input class="locationIdx_input2" readonly="readonly" type="hidden" />
         <input type="button" value="위치찾기" onclick="location_popup2();">
      </div>
   </div>
   <br>
   <div><textarea id="content" placeholder="내용을 입력하세요"></textarea></div>

   <div id="file">
         <input type="file"  name="uploadFile" multiple>            
   </div>
   <br>
   <div><input id="makeRoute" type="button" value="작성하기"></div>



</body>
<script>
var data1;
var data2;

$('#addWay').on('click',function() {
   var wayPoint = '';
   var cnt = $('#route1 div').length;
   if(cnt < 6) {
   wayPoint += '<div class="wayPoint'+cnt+'">';
   wayPoint += '<input type="text" class="sightName'+(cnt+2)+'" class="wpTxt'+cnt+'" value="" placeholder="경유지" readonly>';
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



$(document).on('click','#makeRoute',function() {
   if($(".sightName1").val().length > 0 && $(".sightName2").val().length > 0) {
   var sight1 = [];
   var locIdx1 = [];
   for(var i=0; i<$('#route1').children().length+1; i++) {      
      sight1[i] = $(".sightName"+(i+1)).val();
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
   
//    var formData = new FormData();
   
//    var inputFile = $("input[name='uploadFile']");
   
//    var files = inputFile[0].files;
   
//    for(var i5=0; i5<files.length; i5++) {
//       formData.append("uploadFile", files[i5]);
//    }
   
//    console.log(formData);
   
   
   
   $.ajax({
      url: 'routeWrite1',
      dataType: 'json',
      type: 'post',
      data : {
         locIdx : locIdx1,
         content : content1,
         loginId : loginId1,
         title : title1
      },
      success: function(data) {
         alert("글 작성을 완료하였습니다.");
         board_idx = data.board_idx;
         console.log(board_idx);
         location.href="./routeDetail?board_idx="+board_idx;
      }
      });
   }else {
      alert("최소 출발지, 도착지 입력 바람");
   }
});

</script>
</html>