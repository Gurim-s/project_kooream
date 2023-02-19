<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %><!-- 시큐리티 태그 -->

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>KOOREAM</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/common/common.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/common/header.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/common/main.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/common/footer.css'/>">
	<script type="text/javascript" src="<c:url value='/resources/js/common/jquery/jquery-3.4.1.js'/>"></script>
	<script  type="text/javascript">
		// 로그아웃시 토큰 보내주기 위한 함수
		function listView(){
		    var f = document.createElement('form');
		    var csrf = "${_csrf.parameterName }";
		    var csrf_value = "${_csrf.token } ";
		    var obj;
		    obj = document.createElement('input');
		    obj.setAttribute('type', 'hidden');
		    obj.setAttribute('name', csrf);
		    obj.setAttribute('value', csrf_value);
		    
		    f.appendChild(obj);
		    f.setAttribute('method', 'post');
		    f.setAttribute('action', '/logout');
		    document.body.appendChild(f);
		    f.submit();
		}
	</script>
</head>
<body>
	<header>
		<sec:authentication property="principal" var="pri"/>
		<c:if test="${pri eq 'anonymousUser' }">
			<c:set var="m_no" value="${pri}"/>
		</c:if>
		<c:if test="${pri ne 'anonymousUser' }">
			<c:set var="m_no" value="${pri.member.m_no }"/>
			<c:set var="m_nickname" value="${pri.member.m_nickname }"/>
			<c:url value="/displayImage" var="profileImgSrc"><!-- c:url 자동 인코딩  -->
				<c:param name="fileName" value="${pri.member.uploadPath }/${pri.member.uuid }_${pri.member.fileName }"></c:param>
			</c:url>
			<input type="hidden" name="pri_m_profile_img_src" value="${profileImgSrc }"/>
			<input type="hidden" name="pri_m_nickname" value="${m_nickname }"/>		
		</c:if>
		<input type="hidden" name="pri_m_no" value="${m_no }"/>		
		<div class="header-top">
			<div class="member-nav clearfix">
				<ul>
					<li><a href="#">고객센터</a></li>
					<li><a href="/rental/interestList">관심상품</a></li>
						<sec:authorize access="hasRole('ROLE_USER')">
							<li><a href="/brandCart/brandCart">장바구니</a></li>
						</sec:authorize>
						<sec:authorize access="hasRole('ROLE_USER')">
							<li><a href="/member/profile">마이페이지</a></li>
						</sec:authorize>
					<li>
						<sec:authorize access="isAnonymous()">
							<a href="/member/loginPage">로그인</a>
						</sec:authorize>
						<sec:authorize access="isAuthenticated()">
							<a href="javascript:listView()">로그아웃</a>
						</sec:authorize>
					</li>
				</ul>
			</div>
		</div>
		<div class="header-bottom clearfix">
			<div class="logo-container">
				<a href="/member/mainPage">
					<img alt="로고이미지" src="<c:url value='/resources/img/kooream.png'/>">
				</a>
			</div>
			<div id="mainMenuNav">
				<ul>
					<li>
						<a id="nav-style" href="/style/list?category=hot">STYLE</a>
					</li>
					<li>
						<a id="nav-shop" href="/shop/shop_allList">SHOP</a>
					</li>
					<li>
						<a id="nav-brandshop" href="/brandshop/index">BRAND</a>	
						<!-- href가 기본적으로 GetMapping -> Controller를 탄다 -->
					</li>
					<li>
						<a id="nav-rental" href="/rental/index">RENTAL</a>
					</li>
					<li>
						<a id="nav-codishop" href="/codishop/list">CODI</a>
					</li>
					<li>
						<a id="nav-community" href="/community/oriList">COMMUNITY</a>
					</li>
				</ul>
			</div>
		</div>
		<div id="pageNavigator">
			<a href="#">
				<div>▲</div>
				<div>top</div>
			</a>
		</div>
		<script type="text/javascript" defer>
			const now = location.pathname;
			const nowMenu = 'nav-'+ now.split('/')[1];
			const target = document.getElementById(nowMenu); 
			if (target != undefined && target != null) {
				target.className="header-on";
			}
			const pageTop = document.querySelector('#pageNavigator a');
			pageTop.addEventListener('click', function(e) {
				e.preventDefault();
				window.scrollTo({ top: 0, behavior: "smooth" });  
			});
		</script>
	</header>
	<main>
		<div class="wrapper clearfix">
		

	
	