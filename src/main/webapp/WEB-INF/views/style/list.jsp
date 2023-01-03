<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<jsp:include page="../include/header.jsp"/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style/list.css'/>">
	<div id="content">
		<div id="listTitle"></div>
		<div id="categories">
			<button id="hot" class="on">인기</button>
			<button id="recent" class="">최신</button>
			<button id="following" class="">팔로잉</button>
			<button id="search" class="">검색</button>
		</div>
		<div id="styleList">
			<div class="list-column">
			</div>
			<div class="list-column">
			</div>
			<div class="list-column">
			</div>
			<div class="list-column">
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<c:url value='/resources/js/style/list.js'/>"></script>
<jsp:include page="../include/footer.jsp"/>