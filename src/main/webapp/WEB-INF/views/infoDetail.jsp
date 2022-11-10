<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	#infoDate{
		font-size: small;
	}
</style>
</head>
<body>
	<div id="infoDate">
		<span>작성일 : ${boarddto.reg_date}</span>
		<span>조회수 : ${boarddto.hit}</span>
	</div>
	<div id="infoSubject">
		<h3>${boarddto.board_subject}</h3>
		<button type="button" onclick="location.href='infoUpdateForm?board_idx=${boarddto.board_idx}'">수정</button>
		<span>작성자 : ${boarddto.id}</span>
	</div>
	<hr>
	<div id="map" style="width:500px;height:300px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=812465dab319d921e8f09747798528a1"></script>

	<div>
		${boarddto.board_content}
	</div>
	<button type="button" onclick="location.href='infoList'">목록</button>
</body>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
mapOption = { 
    center: new kakao.maps.LatLng(${locatedto.loc_lat}, ${locatedto.loc_lon}), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng(${locatedto.loc_lat}, ${locatedto.loc_lon}); 

//마커를 생성합니다
var marker = new kakao.maps.Marker({
position: markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

//아래 코드는 지도 위의 마커를 제거하는 코드입니다
//marker.setMap(null); 

</script>
</html>