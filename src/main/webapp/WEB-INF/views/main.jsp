<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<style>
	
</style>
</head>
<body>
	    <div id="wrap">
        <div id="header">
            <jsp:include page="header.jsp" />
        </div>
        <div></div>
        <c:choose>
            <c:when test="${page eq '여행지정보'}">
                <div id="main">
                    <jsp:include page="infoList.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '여행지후기'}">
                <div id="main">
                    <jsp:include page="reviewList.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '여행지경로'}">
                <div id="main">
                    <jsp:include page="routeList.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '공지'}">
                <div id="main">
                    <jsp:include page="noticeList.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '후기글쓰기'}">
                <div id="main">
                    <jsp:include page="reviewWriteForm.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '검색'}">
                <div id="main">
                    <jsp:include page="search.jsp" />
                </div>
            </c:when>
            <c:otherwise>
                <div id="main">
                    <jsp:include page="home.jsp" />
                </div>
            </c:otherwise>
        </c:choose>
>>>>>>> origin/master
    </div>
</body>
<script>
</script>
</html>