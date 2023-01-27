<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	<script type="text/javascript" src="<c:url value='/resources/js/common/common.js'/>"></script>
</head>
<body>
	<header>
		<div class="header-top">
			<div class="member-nav clearfix">
				<ul>
					<li><a href="#">고객센터</a></li>
					<li><a href="#">관심상품</a></li>
					<li><a href="/member/myPage">마이페이지</a></li>
					<li>
						<c:choose>
							<c:when test="${mvo.m_id ne null }">
								<a href="/member/logout">로그아웃</a>
							</c:when>
							<c:otherwise>
								<a href="/member/loginPage">로그인</a>
							</c:otherwise>
						</c:choose>
					</li>
				</ul>
			</div>
		</div>
		<div class="header-bottom clearfix">
			<div class="logo-container">
				<a href="#">
					<img alt="로고이미지" src="<c:url value='/resources/img/kooream.png'/>">
				</a>
			</div>
			<div>
				<ul>
					<li>
						<a href="/style/list">STYLE</a>
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
						<a href="/community/index">COMMUNITY</a>
					</li>
					<li>
						<a href="#">검색</a>
					</li>
				</ul>
			</div>
		</div>
	</header>
	<main>
		<div class="wrapper">
		
				
	
	