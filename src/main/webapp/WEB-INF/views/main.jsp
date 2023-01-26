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
        	<c:when test="${page eq '회원가입'}">
                <div id="main">
                    <jsp:include page="joinForm.jsp" />
                </div>
            </c:when>
        	<c:when test="${page eq '근처여행지찾기'}">
                <div id="main">
                    <jsp:include page="map.jsp" />
                </div>
            </c:when>
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
            <c:when test="${page eq '후기상세보기'}">
                <div id="main">
                    <jsp:include page="reviewDetail.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '후기글수정'}">
                <div id="main">
                    <jsp:include page="reviewUpdateForm.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '여행지경로'}">
                <div id="main">
                    <jsp:include page="routeList.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '후기글쓰기'}">
                <div id="main">
                    <jsp:include page="reviewWriteForm.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '로그인화면'}">
                <div id="main">
                    <jsp:include page="loginForm.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '검색'}">
                <div id="main">
                    <jsp:include page="search.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '여행지정보글쓰기'}">
                <div id="main">
                    <jsp:include page="infoWriteForm.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '여행지정보상세보기'}">
                <div id="main">
                    <jsp:include page="infoDetail.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '여행지정보수정하기'}">
                <div id="main">
                    <jsp:include page="infoUpdateForm.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '여행지경로상세보기'}">
                <div id="main">
                    <jsp:include page="routeDetail.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '경로글쓰기'}">
                <div id="main">
                    <jsp:include page="routeWrite.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '여행지경로수정하기'}">
                <div id="main">
                    <jsp:include page="routeUpdateForm.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '마이페이지상세보기'}">
                <div id="main">
                    <jsp:include page="mypage_detail.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '마이페이지수정'}">
                <div id="main">
                    <jsp:include page="mypage_updateForm.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '나의 후기글 리스트'}">
                <div id="main">
                    <jsp:include page="mypage_review.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '나의 경로글 리스트'}">
                <div id="main">
                    <jsp:include page="mypage_route.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '나의 댓글 리스트'}">
                <div id="main">
                    <jsp:include page="mypage_comment.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '유저후기글리스트'}">
                <div id="main">
                    <jsp:include page="userpage_review.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '유저경로글리스트'}">
                <div id="main">
                    <jsp:include page="userpage_route.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '유저댓글리스트'}">
                <div id="main">
                    <jsp:include page="userpage_comment.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '공지'}">
                <div id="main">
                    <jsp:include page="noticeList.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '유저리스트'}">
                <div id="main">
                    <jsp:include page="userlist.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '관리자여행지정보'}">
                <div id="main">
                    <jsp:include page="AdminInfoList.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '공지글쓰기'}">
                <div id="main">
                    <jsp:include page="noticeWriteForm.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '공지정보상세보기'}">
                <div id="main">
                    <jsp:include page="noticedetail.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '공지수정하기'}">
                <div id="main">
                    <jsp:include page="noticeUpdateForm.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '관리자내정보'}">
                <div id="main">
                    <jsp:include page="manager_page.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '전체게시물'}">
                <div id="main">
                    <jsp:include page="allList.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '블라인드'}">
                <div id="main">
                    <jsp:include page="blindList.jsp" />
                </div>
            </c:when>
            <c:when test="${page eq '경로블라인드글쓰기'}">
                <div id="main">
                    <jsp:include page="routeBlindForm.jsp" />
                </div>
            </c:when>
            <c:otherwise>
                <div id="main">
                    <jsp:include page="home.jsp" />
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
<script>
</script>
</html>