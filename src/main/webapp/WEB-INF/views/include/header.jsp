<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %><!-- 시큐리티 태그 -->

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
<!-- 	<link rel="stylesheet" type="text/css" href="WEB-INF/views/include/common.css"> -->
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/common/common.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/common/header.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/common/main.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/common/footer.css'/>">
	<script type="text/javascript" src="<c:url value='/resources/js/jquery/jquery-3.4.1.js'/>"></script>
</head>
<body>
	<header>
		<div class="header-top">
			<div class="member-nav clearfix">
				<ul>
					<li><a href="#">고객센터</a></li>
					<li><a href="/rental/interestList">관심상품</a></li>
          			<li><a href="#">장바구니</a></li>
						<sec:authorize access="hasRole('ROLE_USER')">
							<li><a href="/member/myPage">마이페이지</a></li>
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
			<div>
				<ul>
					<li>
						<a href="/style/list?category=hot">STYLE</a>
					</li>
					<li>
						<a href="/shop/shop_allList">SHOP</a>
					</li>
					<li>
						<a href="/brandshop/index">BRAND</a>	
						<!-- href가 기본적으로 GetMapping -> Controller를 탄다 -->
					</li>
					<li>
						<a href="/rental/index">RENTAL</a>
					</li>
					<li>
						<a href="/codishop/list">CODI</a>
					</li>
					<li>
						<a href="/community/oriList">COMMUNITY</a>
					</li>
					<li>
						<a href="#">검색</a>
					</li>
				</ul>
			</div>
		</div>
	</header>
	<main>
		<div class="wrapper clearfix">
		
<script type="text/javascript" src='/resources/js/rental/slick.min.js'></script>
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
	
	