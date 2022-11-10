<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
	<title>Insert title here</title>
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
				<input type="button" class="search1" value="검색" onclick="location_popup1();">
				<input type="button" id="addWay" value="+">
			</div>
		</div>
		<div id="route2">
			<input type="text" class="sightName2" class="goalTxt" value="" placeholder="도착지" readonly>
			<input class="locationIdx_input2" readonly="readonly" type="hidden" />
			<input type="button" class="search2" value="검색" onclick="location_popup2();">
		</div>
	</div>
	<br>
	<div><textarea id="content" placeholder="내용을 입력하세요"></textarea></div>
	<div id="file">
			<label for="file_test">파일 업로드:</label>
			<input type="file"  id="file_test" name="file_test" >				
	</div>
	<br>
	<div><input id="makeRoute" type="button" value="작성하기"></div>
<!-- 	<div id="map" style="width:50%;height:400px;margin:auto;"></div> -->
<!-- 	<tr> -->
<!-- 		<td> -->
<!-- 			<input type="text" id="sightName" value=""> -->
<!-- 			<input type="button" id="search" value="검색"> -->
<!-- 		</td> -->
<!-- 	</tr> -->

</body>
<script>
var data1;
var data2;


// $(document).on("click",".search1",function search1() {	
// 	var sight = $(".sightName1").val();	
// 	$.ajax({	
// 	    type: 'POST',	
// 	    url: 'trans',	
// 	    data: {'sight':sight},  
// 	    dataType: 'json',	
// 	     timeout: 10000,	
// 	     cache: false,	
// 	     error:function(x,e){	
// 	        alert('요청하신 작업을 수행하던 중 예상치 않게 중지되었습니다.\n\n다시 시도해 주십시오.');	
// 	     },	
// 	     success: function(data, sight) {	
// 	        var LatLng1 = {
// 	        		X:data.X,
// 	        		Y:data.Y
// 	        		}
// 	        data1 = LatLng1;
// 	        console.log(data1);
// 	     }	
// 	   });
// 	});

// $(document).on("click",".search2",function search2() {	
// 	var sight = $(".sightName2").val();	
// 	$.ajax({	
// 	    type: 'POST',	
// 	    url: 'trans',	
// 	    data: {'sight':sight},
// 	    dataType: 'json',	
// 	     timeout: 10000,	
// 	     cache: false,	
// 	     error:function(x,e){	
// 	        alert('요청하신 작업을 수행하던 중 예상치 않게 중지되었습니다.\n\n다시 시도해 주십시오.');	
// 	     },	
// 	     success: function(data, sight) {		
// 	    	 var LatLng2 = {
// 		        		X:data.X,
// 		        		Y:data.Y
// 		        		}
// 	    	 data2 = LatLng2;
// 		        console.log(data2);
// 	     }	
// 	   });
// 	});
// $(document).on("click",".search3",function search3() {	
// 	var sight = $(".sightName3").val();	
// 	$.ajax({	
// 	    type: 'POST',	
// 	    url: 'trans',	
// 	    data: {'sight':sight},
// 	    dataType: 'json',	
// 	     timeout: 10000,	
// 	     cache: false,	
// 	     error:function(x,e){	
// 	        alert('요청하신 작업을 수행하던 중 예상치 않게 중지되었습니다.\n\n다시 시도해 주십시오.');	
// 	     },	
// 	     success: function(data, sight) {		
// 	        var LatLng3 = {
// 	        		X:data.X,
// 	        		Y:data.Y
// 	        		}
// 	        data3 = LatLng3;
// 	        console.log(data3);
// 	     }	
	     	
// 	   });
// 	});
// $(document).on("click",".search4",function search4() {	
// 	var sight = $(".sightName4").val();	
// 	$.ajax({	
// 	    type: 'POST',	
// 	    url: 'trans',	
// 	    data: {'sight':sight},
// 	    dataType: 'json',	
// 	     timeout: 10000,	
// 	     cache: false,	
// 	     error:function(x,e){	
// 	        alert('요청하신 작업을 수행하던 중 예상치 않게 중지되었습니다.\n\n다시 시도해 주십시오.');	
// 	     },	
// 	     success: function(data, sight) {		
// 	        var LatLng4 = {
// 	        		X:data.X,
// 	        		Y:data.Y
// 	        		}
// 	        data4 = LatLng4;
// 	        console.log(data4);
// 	     }	
	     	
// 	   });
// 	});
// $(document).on("click",".search5",function search5() {	
// 	var sight = $(".sightName5").val();	
// 	$.ajax({	
// 	    type: 'POST',	
// 	    url: 'trans',	
// 	    data: {'sight':sight},
// 	    dataType: 'json',	
// 	     timeout: 10000,	
// 	     cache: false,	
// 	     error:function(x,e){	
// 	        alert('요청하신 작업을 수행하던 중 예상치 않게 중지되었습니다.\n\n다시 시도해 주십시오.');	
// 	     },	
// 	     success: function(data, sight) {		
// 	    	 var LatLng5 = {
// 		        		X:data.X,
// 		        		Y:data.Y
// 		        		}
// 		        data5 = LatLng5;
// 		        console.log(data5);
// 		     }	
	     	
// 	   });
// 	});
// $(document).on("click",".search6",function search6() {	
// 	var sight = $(".sightName6").val();	
// 	$.ajax({	
// 	    type: 'POST',	
// 	    url: 'trans',	
// 	    data: {'sight':sight},
// 	    dataType: 'json',	
// 	     timeout: 10000,	
// 	     cache: false,	
// 	     error:function(x,e){	
// 	        alert('요청하신 작업을 수행하던 중 예상치 않게 중지되었습니다.\n\n다시 시도해 주십시오.');	
// 	     },	
// 	     success: function(data, sight) {		
// 	    	 var LatLng6 = {
// 		        		X:data.X,
// 		        		Y:data.Y
// 		        		}
// 		        data6 = LatLng6;
// 		        console.log(data6);
// 		     }	
	     	
// 	   });
// 	});
// $(document).on("click",".search7",function search7() {	
// 	var sight = $(".sightName7").val();	
// 	$.ajax({	
// 	    type: 'POST',	
// 	    url: 'trans',	
// 	    data: {'sight':sight},
// 	    dataType: 'json',	
// 	     timeout: 10000,	
// 	     cache: false,	
// 	     error:function(x,e){	
// 	        alert('요청하신 작업을 수행하던 중 예상치 않게 중지되었습니다.\n\n다시 시도해 주십시오.');	
// 	     },	
// 	     success: function(data, sight) {		
// 	    	 var LatLng7 = {
// 		        		X:data.X,
// 		        		Y:data.Y
// 		        		}
// 		        data7 = LatLng7;
// 		        console.log(data7);
// 		     }	
	     	
// 	   });
// 	});
   
$('#addWay').on('click',function() {
	var wayPoint = '';
	var cnt = $('#route1 div').length;
	if(cnt < 6) {
	wayPoint += '<div class="wayPoint'+cnt+'">';
	wayPoint += '<input type="text" class="sightName'+(cnt+2)+'" class="wpTxt'+cnt+'" value="" placeholder="경유지" readonly>';
	wayPoint += '<input class="locationIdx_input'+(cnt+2)+'" readonly="readonly" type="hidden" />';
// 	wayPoint += '<input class="X'+(cnt+2)+'" readonly="readonly" type="hidden" />';
// 	wayPoint += '<input class="Y'+(cnt+2)+'" readonly="readonly" type="hidden" />';
	wayPoint += '<input type="button" class="search'+(cnt+2)+'" value="검색" '+'onclick="location_popup'+(cnt+2)+'();">';
	wayPoint += '<input type="button" class="delWay'+cnt+'" value="-">';
	wayPoint += '</div>';
	$('#route1').append(wayPoint);
	} else {
		return false;
	}

});

$(document).on("click",".delWay1",function(){
	$('.wayPoint1').remove();
	
// 	data3 = {};
// 	data3 = data4;
// 	data4 = {};
// 	data4 = data5;
// 	data5 = {};
// 	data5 = data6;
// 	data6 = {};
// 	data6 = data7;
// 	data7 = {};
	
	for(var i=0; i<4; i++){
		$(".wayPoint"+(i+2)).attr("class","wayPoint"+(i+1));
		$(".sightName"+(i+4)).attr("class","sightName"+(i+3));
		$(".search"+(i+4)).attr("class","search"+(i+3));
		$(".delWay"+(i+2)).attr("class","delWay"+(i+1));
	}

});
$(document).on("click",".delWay2",function(){
	$('.wayPoint2').remove();
// 	data4 = {};
// 	data4 = data5;
// 	data5 = {};
// 	data5 = data6;
// 	data6 = {};
// 	data6 = data7;
// 	data7 = {};
	for(var i=0; i<3; i++){
		$(".wayPoint"+(i+3)).attr("class","wayPoint"+(i+2));
		$(".sightName"+(i+5)).attr("class","sightName"+(i+4));
		$(".search"+(i+5)).attr("class","search"+(i+4));
		$(".delWay"+(i+3)).attr("class","delWay"+(i+2));
	}
	
});
$(document).on("click",".delWay3",function(){
	$('.wayPoint3').remove();
// 	data5 = {};
// 	data5 = data6;
// 	data6 = {};
// 	data6 = data7;
// 	data7 = {};
	for(var i=0; i<2; i++){
		$(".wayPoint"+(i+4)).attr("class","wayPoint"+(i+3));
		$(".sightName"+(i+6)).attr("class","sightName"+(i+5));
		$(".search"+(i+6)).attr("class","search"+(i+5));
		$(".delWay"+(i+4)).attr("class","delWay"+(i+3));
	}

});
$(document).on("click",".delWay4",function(){
	$('.wayPoint4').remove();
// 	data6 = {};
// 	data6 = data7;
// 	data7 = {};
	$(".wayPoint5").attr("class","wayPoint4");
	$(".sightName7").attr("class","sightName6");
	$(".search7").attr("class","search6");
	$(".delWay5").attr("class","delWay4");
// 	search6();
	
	
});
$(document).on("click",".delWay5",function(){
	$('.wayPoint5').remove();
// 	data7 = {};
});



$(document).on('click','#makeRoute',function() {
	console.log($('#route1').children().length);
	var sight1 = [];
	var locIdx1 = [];
	for(var i=0; i<$('#route1').children().length+1; i++) {		
		sight1[i] = $(".sightName"+(i+1)).val();
		console.log(sight1[i]);
		locIdx1[i] = $(".locationIdx_input"+(i+1)).val();
		console.log(locIdx1[i]);
	}
	console.log(sight1);
	console.log(locIdx1);
	var startTxt = $('.sightName1').val();
	console.log(startTxt);
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
	
	// 제목
	console.log($('#title').val());
	var title1 = $('#title').val();
	// 작성자
	console.log("${sessionScope.loginId}");
	var loginId1 = "${sessionScope.loginId}";
	//${sessionScope.loginId}
	// 내용
	console.log($('#content').val());
	var content1 = $('#content').val();
	// 파일
	
	// 경로순서
	
	$.ajax({
		url: 'trans',
		dataType: 'json',
		type: 'post',
		data : {
			sight : sight1,
			locIdx : locIdx1,
			content : content1,
			loginId : loginId1,
			title : title1
		},
		success: function(data) {
			alert("Success");
			console.log(data);
			//location.href="/routeDetail?data="+data;
		
		},
		});

});







function polyshit(polypath) {
	
	var map = new naver.maps.Map('map', {
		center : new naver.maps.LatLng(37.3674001, 127.1181196),
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
		    position: new naver.maps.LatLng(data3.Y, data3.X),
		    map: map
		});
	 var marker = new naver.maps.Marker({
		    position: new naver.maps.LatLng(data4.Y, data4.X),
		    map: map
		});
	 var marker = new naver.maps.Marker({
		    position: new naver.maps.LatLng(data5.Y, data5.X),
		    map: map
		});
	 var marker = new naver.maps.Marker({
		    position: new naver.maps.LatLng(data6.Y, data6.X),
		    map: map
		});
	 var marker = new naver.maps.Marker({
		    position: new naver.maps.LatLng(data7.Y, data7.X),
		    map: map
		});	 
}

</script>
</html>
