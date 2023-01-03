<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="/resources/css/codi/codi.css" />

<body class="cordishop">
<jsp:include page="../include/header.jsp"/>
	<div class="codi_box">

		<div class="social_title">
			<h1>CodiShop</h1>
		</div><br/>
		<div class="social_header">
			<a href="#" class="teb_item">검색</a>
		</div>
		<br/>
		<div class="container social">
			<div class="keyword_bind">
				<a href="#" class="brand_keyword">#Nike</a>
				<a href="#" class="brand_keyword">#adidas</a>
				<a href="#" class="brand_keyword">#new balance</a>
				<a href="#" class="brand_keyword">#nerdy</a>
				<a href="#" class="brand_keyword">#THE NORTH FACE</a>
				<a href="#" class="brand_keyword">#KOOREAM STANDARD</a>
			</div>
			<br/><br/>
			<div class="regBtngo">
				<a id="regBtn" class="btn btn_reg" href="/codishop/register">새 코디 등록</a>
			</div>
		</div>
		<div class="social_feeds" style="position: relative; height: 100%">
			<div class="masonry_posts">
				<div class="feed_card" style="position: absolute; left:0px; top:0px;">
					<a>
						<div class="card_box">
							<div class="codi_img_box" style="width: 279px; height: 376px; background-color: black; border-radius: 10px">
								
							</div>
							<div class="card_detail">
								<div class="model_box">
									<img alt="" src="">
									<p class="model_name">모델명</p>
								</div>
								<p class="text_box">내용</p>
							</div>
						</div>
					</a>
				</div>
				<div class="feed_card" style="position: absolute; left:307px; top:0px;">
					<a>
						<div class="card_box">
							<div class="codi_img_box" style="width: 279px; height: 376px; background-color: black; border-radius: 10px">
								
							</div>
							<div class="card_detail">
								<div class="model_box">
									<img alt="" src="">
									<p class="model_name">모델명</p>
								</div>
								<p class="text_box">내용</p>
							</div>
						</div>
					</a>
				</div>
				<div class="feed_card" style="position: absolute; left:614px; top:0px;">
					<a>
						<div class="card_box">
							<div class="codi_img_box" style="width: 279px; height: 376px; background-color: black; border-radius: 10px">
								
							</div>
							<div class="card_detail">
								<div class="model_box">
									<img alt="" src="">
									<p class="model_name">모델명</p>
								</div>
								<p class="text_box">내용</p>
							</div>
						</div>
					</a>
				</div>
				<div class="feed_card" style="position: absolute; left:921px; top:0px;">
					<a>
						<div class="card_box">
							<div class="codi_img_box" style="width: 279px; height: 376px; background-color: black; border-radius: 10px">
								
							</div>
							<div class="card_detail">
								<div class="model_box">
									<img alt="" src="">
									<p class="model_name">모델명</p>
								</div>
								<p class="text_box">내용</p>
							</div>
						</div>
					</a>
				</div>
			</div>
		</div>
	</div>
		<form action="/codishop/index" method="get" id="actionForm">
			
		</form>
</body>

<script type="text/javascript">

</script>


</html>
<jsp:include page="../include/footer.jsp"/>