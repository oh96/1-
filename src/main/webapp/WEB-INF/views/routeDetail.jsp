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
<style></style>
</head>
<body>
	<div id="infoDate">
		<span>작성일 : ${boarddto.reg_date}</span>
		<span>조회수 : ${boarddto.hit}</span>
	</div>
	<div id="infoSubject">
		<h3>${boarddto.board_subject}</h3>
		<button type="button" onclick="location.href='infoUpdateForm'">수정</button>
		<span>작성자 : ${boarddto.id}</span>
	</div>
	<hr>
	
	
	<div id="map" style="width:50%;height:400px;margin:auto;"></div>


	<div>
		${boarddto.board_content}
	</div>
	<button type="button" onclick="location.href='placeInfo'">목록</button>
</body>
<script>
//	var map = new naver.maps.Map('map', {
//	center : new naver.maps.LatLng(37.3674001, 127.1181196),
//	zoom: 10
//});

//var polyline = new naver.maps.Polyline({
//	 map : map,
//	 path : polypath,
//	 strokeColor : '#5347AA',
//	 strokeWeight : 2
//});
//var marker = new naver.maps.Marker({
//	    position: polypath[0],
//	    map: map
//	});
//var marker = new naver.maps.Marker({
//	    position: polypath[polypath.length -1],
//	    map: map
//	});
//var marker = new naver.maps.Marker({
//	    position: new naver.maps.LatLng(data3.Y, data3.X),
//	    map: map
//	});
//var marker = new naver.maps.Marker({
//	    position: new naver.maps.LatLng(data4.Y, data4.X),
//	    map: map
//	});
//var marker = new naver.maps.Marker({
//	    position: new naver.maps.LatLng(data5.Y, data5.X),
//	    map: map
//	});
//var marker = new naver.maps.Marker({
//	    position: new naver.maps.LatLng(data6.Y, data6.X),
//	    map: map
//	});
//var marker = new naver.maps.Marker({
//	    position: new naver.maps.LatLng(data7.Y, data7.X),
//	    map: map
//	});	 
</script>
</html>