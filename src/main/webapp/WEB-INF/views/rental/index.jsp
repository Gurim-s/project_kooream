<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../include/header.jsp"/>
<style>
	main .wrapper{
		padding: 0;
		margin: 0;
		width: 100%;
		max-width: none;
	}
	main{
		padding: 0;
	}
	#bannerImage{
		width: 100%;
		margin-bottom: 80px;
	}
	#imageList{
		width: 500px;
		margin: auto;
	}
	#imageList li{
		margin-top: 10px;
	}
</style>
	<div id="banner">
<!-- 		<img id="bannerImage" src="/rantalimage/banner.png"> -->
		<img id="bannerImage" src="<c:url value='/resources/img/product/banner.png'/>">
	</div>
	<div id="imageList">
		<ul>
<!-- 			<li><img id="9996" src="/rantalimage/brand_banner/index image/chanel.jpg"></li> -->
<!-- 			<li><img id="9997" src="/rantalimage/brand_banner/index image/louisvuitton.jpg"></li> -->
<!-- 			<li><img id="9998" src="/rantalimage/brand_banner/index image/dior.jpg"></li> -->
<!-- 			<li><img id="9999" src="/rantalimage/brand_banner/index image/gucci.jpg"></li> -->
<!-- 			<li><img id="9995" src="/rantalimage/brand_banner/index image/prada.jpg"></li> -->
			<li><img id="9996" src="<c:url value='/resources/img/product/brand_banner/index image/chanel.jpg'/>"></li>
			<li><img id="9997" src="<c:url value='/resources/img/product/brand_banner/index image/louisvuitton.jpg'/>"></li>
			<li><img id="9998" src="<c:url value='/resources/img/product/brand_banner/index image/dior.jpg'/>"></li>
			<li><img id="9999" src="<c:url value='/resources/img/product/brand_banner/index image/gucci.jpg'/>"></li>
			<li><img id="9995" src="<c:url value='/resources/img/product/brand_banner/index image/prada.jpg'/>"></li>
		</ul>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script  type="text/javascript">
	$("li img").on("click", function(){
		location.href = "/rental/rentalList?brandType="+$(this).attr("id");
	});

</script>


<jsp:include page="../include/footer.jsp"/>