<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="WEB-INF/views/include/common.css">
	<style type="text/css">
		* {
			padding:0;
			margin:0;
			box-sizing: border-box;
			text-decoration: none;
			color: #000;
		}
		a {
		 	color: #000;
		 	text-decoration: none;
		 	outline: none
		}
		a:hover, a:active {
			text-decoration: none;
			color:#000;
			background-color:#f59000;
		}
		ul li {
			list-style: none;
		}
	</style>
	<style type="text/css">
		.clearfix {
			*zoom:1;
		}
		.clearfix::after {
			clear:both;
		}
		.clearfix::after, .clearfix::before {
			display:block;
			content: '';
			line-height: 0;
		}
		header {
			
		}
		header .header-top {
			height: 30px;
			border-top: 1px;
			text-align: center;
			border-bottom: 1px solid #ccc;
			padding: 0 30px;
		}
		header .header-top .member-nav {
			display: inline-block;
			float: right;
			margin: auto 0;
			font-size: 13px;
			vertical-align: middle;
			position: relative;
  			top: 50%;
  			transform: translateY(-50%);
		}
		header .header-top:after {
			
		}
		header .header-top .member-nav ul li{
			float: left;
			margin-left: 10px;
		}
		header .header-bottom {
			padding: 0 30px;
			height: 70px;
		}
		header .header-bottom .logo-container {
			display: inline-block;
			vertical-align: middle;
			position: relative;
  			top: 50%;
  			transform: translateY(-50%);
		}
		header .header-bottom .logo-container a {
			display: inline-block;
		}
		header .header-bottom .logo-container a img {
			width: 200px;
		}
		header .header-bottom div:nth-child(2){
			float: right;
			position: relative;
  			top: 50%;
  			transform: translateY(-50%);
		}
		header .header-bottom div:nth-child(2) ul li {
			float : left;
			padding-left: 10px;
		}
	</style>
	<style type="text/css">
		footer {
			height: 300px;
			background-color: #a99;
			line-height: 300px;
		}
		footer h1 {
			text-align: center;	
		}
	</style>
	<style type="text/css">
		main {
			min-height: 800px;
			width: 100%;
			padding: 0 30px;
		}
		main .wrapper {
			width: 1200px;
			margin: 0 auto;
		}
	</style>
</head>
<body>
	<header>
		<div class="header-top">
			<div class="member-nav clearfix">
				<ul>
					<li><a href="#">고객센터</a></li>
					<li><a href="#">관심상품</a></li>
					<li><a href="#">마이페이지</a></li>
					<li><a href="#">로그인</a></li>
				</ul>
			</div>
		</div>
		<div class="header-bottom clearfix">
			<div class="logo-container">
				<a href="#">
<!-- 					<img alt="로고이미지" src="resources/img/kooream.png"> -->
					<img alt="로고이미지" src="<c:url value='/resources/img/kooream.png'/>">
				</a>
			</div>
			<div>
				<ul>
					<li>
						<a href="#">STYLE</a>
					</li>
					<li>
						<a href="#">SHOP</a>
					</li>
					<li>
						<a href="#">BRAND</a>
					</li>
					<li>
						<a href="#">RENTAL</a>
					</li>
					<li>
						<a href="#">COORDI</a>
					</li>
					<li>
						<a href="#">COMMUNITY</a>
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
		
				
	
	