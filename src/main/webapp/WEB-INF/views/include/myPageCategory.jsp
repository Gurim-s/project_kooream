<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %><!-- 시큐리티 태그 -->

<style>
	#myPage{
		font-size: 20px;
		font-weight: bold;
		color:black;
	}
	#mcategroyBox{
		width: 300px;
		margin-top: 160px;
		float:left;
		display:inline-block;
	}
	.mcategory{
		padding: 9px 0;
		cursor: pointer;
    	width: 180px;
    	font-weight: bold;
    	font-size: 17px;
    	color: black;
	}
	.mul li{
		padding: 6px;
	}
	a{
		color: #22222280;
	}
	
</style>
<div id="mcategroyBox">
	<div id="myPage" >마이 페이지</div>
	<div class="mcategory">&nbsp;쇼핑 정보</div>	
	<ul class="mul">
		<li><a href="#">구매 내역</a></li>	
		<li><a href="/rsvt/RntConfirm">예약 내역</a></li>	
		<li><a href="#">판매 내역</a></li>	
		<li><a href="#">보관 판매</a></li>	
		<li><a href="/rental/interestList">관심 상품</a></li>	
		<li><a href="#">스타일</a></li>	
		<li><a href="#">코디</a></li>	
	</ul>
	<div class="mcategory">&nbsp;내 정보</div>	
	<ul class="mul">
		<li><a href="/member/profile">프로필 정보</a></li>	
		<li><a href="#">주소록</a></li>	
		<li><a href="#">결제 정보</a></li>	
		<li><a href="#">판매 정산 계좌</a></li>	
		<li><a href="#">현금영수증 정보</a></li>	
		<li><a href="#">포인트</a></li>
	</ul>	
</div>	
	