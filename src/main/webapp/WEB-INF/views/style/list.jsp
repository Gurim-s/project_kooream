<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<jsp:include page="../include/header.jsp"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style/list.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style/detail.css'/>">
	<div id="content">
		<div id="memberDetailInfo" class="hide">
			<img class="profile-img" alt="user-profile-img" src="<c:url value='/resources/img/codi_test.png'/>">
			<span class="nickname"></span>
			<span class="intro"></span>
			<a href="#" class="follow-btn">팔로우</a>
			<a href="/member/profile" class="info-update-btn">프로필 수정</a>
			<div class="member-counter">
				<div></div>
			</div>
		</div>
		<div id="categories" class="hide">
			<a href="/style/list?category=hot" id="hot" class="">인기</a>
			<a href="/style/list?category=recent" id="recent" class="">최신</a>
			<a href="/style/list/following" id="following" class="">팔로잉</a>
<!-- 			<button id="search" class="">검색</button> -->
			<a href="/style/register" id="register">등록</a>
			<div id="listKeyword">
				<h1></h1>
			</div>
		</div>
		<div id="styleList" class="clearfix">
			<div class="list-column">
			</div>
			<div class="list-column">
			</div>
			<div class="list-column">
			</div>
			<div class="list-column">
			</div>
		</div>
		<div id="styleDetailList" class="clearfix">
			<div class="list-column hide">
			</div>
		</div>
		<div id="empty-list" class="hide">
			<img alt="empty-list" src="<c:url value='/resources/img/photo_camera.svg'/>">
			<strong>게시물 없음.</strong>
			<p>게시물이 없습니다. 회원님의 STYLE을 공유해주세요.</p>
		</div>
	</div>
	<script type="module" src="<c:url value='/resources/js/style/list.js'/>"></script>
<jsp:include page="../include/footer.jsp"/>