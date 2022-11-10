<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=i4kv2usz7y&submodules=geocoder"></script>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style></style>
</head>
<body>
<div id="lat"></div>
<div id="lng"></div>
</body>
<script>
$(function() {
	$.ajax({
		url:'https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode',
		data: {
			key:'i4kv2usz7y',
			encoding:'utf-8',
			coord:'LatLng',
			output:'JSON',
			query:'금성당'
		},
		dataType: 'jsonp',
	}).done(function(data) {
		console.log( data.result );
	});
});

</script>
</html>