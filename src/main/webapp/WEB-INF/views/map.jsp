<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style></style>
</head>
<body>
	<div id="map" style="width:1000px;height:600px;"></div>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=812465dab319d921e8f09747798528a1&libraries=clusterer"></script>
	
</body>
<script>
	
	//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {
	
	// GeoLocation을 이용해서 접속 위치를 얻어옵니다
	navigator.geolocation.getCurrentPosition(function(position) {
	    
	    var lat = position.coords.latitude, // 위도
	        lon = position.coords.longitude; // 경도
	    
	    var locPosition = new kakao.maps.LatLng(lat, lon) // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	    
	    // 마커와 인포윈도우를 표시합니다
	    markCall(locPosition);
	        
	  });
	
	}
	
	function markCall(locPosition){
		$.ajax({
			type:'post',
			url:'markCall',
			data:{},
			dataType:"JSON",
			success:function(data){
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div
				
				mapOption = {
					center: new kakao.maps.LatLng(37.56682, 126.97865), // 지도의 중심좌표
				    level: 8, // 지도의 확대 레벨
				    mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
				}; 
				
				// 지도를 생성한다 
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				// 마커 클러스터러를 생성합니다 
				var clusterer = new kakao.maps.MarkerClusterer({
				    map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
				    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
				    minLevel: 10 // 클러스터 할 최소 지도 레벨 
				});
				
				var markers=[];
				
				for(var i=0;i<data.mapList.length;i++){
					// 지도에 마커를 생성하고 표시한다
					var marker = new kakao.maps.Marker({
					    position: new kakao.maps.LatLng(data.mapList[i].loc_lat, data.mapList[i].loc_lon), // 마커의 좌표
					    map: map // 마커를 표시할 지도 객체
					});
					
					var iwContent = '<div style="padding:5px;">'+data.mapList[i].loc_name+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
				    iwPosition = new kakao.maps.LatLng(data.mapList[i].loc_lat, data.mapList[i].loc_lon); //인포윈도우 표시 위치입니다

					// 인포윈도우를 생성합니다
					var infowindow = new kakao.maps.InfoWindow({
					    position : iwPosition, 
					    content : iwContent 
					});
					
					
					markers.push(marker);
					
					kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
				    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
				}
				clusterer.addMarkers(markers);
				
				// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
				function makeOverListener(map, marker, infowindow) {
				    return function() {
				        infowindow.open(map, marker);
				    };
				}

				// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
				function makeOutListener(infowindow) {
				    return function() {
				        infowindow.close();
				    };
				}
				
				map.setCenter(locPosition);
			},
			error:function(e){
				console.log(e);
			}
		});
	}
	
	//markCall();
	
</script>
</html>