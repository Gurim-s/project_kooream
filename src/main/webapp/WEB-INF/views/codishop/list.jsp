<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!-- <link rel="stylesheet" href="/resources/css/codi/codi.css" /> -->
<jsp:include page="../include/header.jsp"/>
<link rel="stylesheet" type="text/css" href="/resources/css/codi/list.css">
<body class="cordishop">
	
	<div class="codi_box">

		<div class="social_title">
			<h1>Codi Shop</h1>
		</div>
		<br/>
		<div class="container social">
			<div class="keyword_brand">
				<div id="tag_List">
								
				</div>
			</div>
		</div>
		<div class="codi_search">
			<div class="search_btn">
				<select name="searchType" id="searchType">
					<option value="codi_title">제목</option>
					<option value="codi_content">내용</option>
					<option value="titcont">제목+내용</option>
					<option value="codimodel_name">모델명</option>
				</select>
				<input type="text" id="searchName"  name="searchName" placeholder="검색어 입력">
				<button id="searchBtn" class="btn_search search-btn">검색</button>
			</div>
		</div>
		<br/>
		<hr/>
		<sec:authorize access="hasAnyRole('ROLE_ADMIN')">
		<div class="codi_insert">
			<div class="insert_btn">
				<a href="/codishop/register" class="btn_search">코디 등록</a>
			</div>
			<br/>
			<hr/>
			<br/>
		</div>
		</sec:authorize>
		
		<div id="codi-list" class="clearfix">
			<div class="list-column" id="first">
			</div>
			<div class="list-column" id="second">
			</div>
			<div class="list-column" id="third">
			</div>
			<div class="list-column" id="force">
			</div>
		</div>
		<div class="More_btn">
			<a href="#" id="load" class="btn_More">더보기(MORE)</a>
		</div>
		
	</div>
</body>

<script type="module" src="/resources/js/codi/list.js"></script>

</html>
<jsp:include page="../include/footer.jsp"/>