<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="include/header.jsp"/>
<link rel="stylesheet" href="/resources/css/main/main.css">
	<div id="mainSlideContainer">
		<div id="slideShow">
			<ul class="slides">
				<li>
					<a href="/member/mainPage">
						<img alt="" src="../resources/img/main/KOOREAM.png">
					</a>
				</li>
				<li>
					<a href="/style/list?category=hot">
						<img alt="" src="../resources/img/main/STYLE.png">
					</a>
				</li>
				<li>
					<a href="/shop/shop_allList">
						<img alt="" src="../resources/img/main/SHOP.png">
					</a>
				</li>
				<li>
					<a href="/brandshop/index">
						<img alt="" src="../resources/img/main/BRAND.png">
					</a>
				</li>
				<li>
					<a href="/rental/index">  
						<img alt="" src="../resources/img/main/RENTAL.png">
					</a>
				</li>
				<li>
					<a href="/codishop/list">
						<img alt="" src="../resources/img/main/CODI.png">
					</a>
				</li>
				<li>
					<a href="/community/oriList">
						<img alt="" src="../resources/img/main/COMMUNITY.png">
					</a>
				</li>
			</ul>
		</div>
		<div class="controller">
			<!-- 화살표 -->
			<span class="prev">&lang;</span>
			<span class="next">&rang;</span>
		</div>
	</div>
	<div id="mainContents">
		<br/>
			<div id="style" class="clearfix">
			<h3>Style Focus</h3>
			<span>최신 스타일 목록</span>
			<hr/>
			<div id="style-list" class="clearfix">
				<div class="style-column" id="first">
				</div>
				<div class="style-column" id="second">
				</div>
				<div class="style-column" id="third">
				</div>
				<div class="style-column" id="fourth">
				</div>
			</div>
		</div>
		<div id="codi" class="clearfix">
			<h3>Codi Focus</h3>
			<span>추천 코디 목록</span>
			<hr/>
			<div id="codi-list" class="clearfix">
				<div class="list-column" id="first">
				</div>
				<div class="list-column" id="second">
				</div>
				<div class="list-column" id="third">
				</div>
				<div class="list-column" id="fourth">
				</div>
			</div>
		</div>
		<div id="brand" class="clearfix">
			<h3>Brand Focus</h3>
			<span>최신 브랜드 목록</span>
			<hr/>
			<div id="brand-list" class="clearfix">
				<div class="brand-column" id="first">
				</div>
				<div class="brand-column" id="second">
				</div>
				<div class="brand-column" id="third">
				</div>
				<div class="brand-column" id="fourth">
				</div>
			</div>
		</div>
	</div>
<script type="module" src="/resources/js/page/main/main.js"></script>
<jsp:include page="include/footer.jsp"/>