<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<jsp:include page="../include/header.jsp"/>
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/style/detail.css'/>">
<div id="content">
	<div id="listTitle"></div>
	<div id="styleList" class="clearfix">
		<div class="list-column">
		</div>
	</div>
	<div id="btnContainer">
		<button id="more">더 보기 +</button>
	</div>
</div>
<script type="text/javascript" src="<c:url value='/resources/js/style/detail.js'/>"></script>
<jsp:include page="../include/footer.jsp"/>