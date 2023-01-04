<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../include/header.jsp"/>
<style>
	#categroyBox{
		width: 300px;
		margin-top: 160px;

	}
	.category{
		padding: 16px 0;
		cursor: pointer;
    	border-bottom: 1px solid #ebebeb;
    	width: 180px;
    	font-weight: bold;
	}
	ul li{
		padding: 6px;
	}
	.hideMenu{
		display: none;
	}
	.category span{
		float: right;
    	margin-right: 11px;
    	font-size: 24px;
    	margin-top: -2px;
    	color: #00000061;
    	font-family: cursive
	}
	
</style>
	<!-- 좌측 카테고리 박스------------------------------------------------------- -->
	<div id="categroyBox">
		<ul>
			<li class="category">카테고리<span>+</span></li>
			<li class="hideMenu">
				<ul>
					<li>
						<input type="checkbox" name="bag" value ="bag"/>&nbsp;&nbsp;가방<br/>
					</li>
					<li>
						<input type="checkbox" name="accessories" value ="accessories">&nbsp;&nbsp;패션잡화<br/>
					</li>
				</ul>
			</li>
			
			<li class="category">브랜드<span>+</span></li>
			<li class="hideMenu">
				<ul>
					<li>
						<input type="checkbox" class="brandType" value ="9999">&nbsp;&nbsp;GUCCI<br/>
					</li>
					<li>
						<input type="checkbox" class="brandType" value ="9999">&nbsp;&nbsp;GUCCI<br/>
					</li>
					<li>GUCCI</li>
					<li>DIOR</li>
					<li>LOUISVUITTON</li>
					<li>CHANEL</li>
					<li>PRADA</li>
				</ul>
			</li>
			
			<li class="category">가격<span>+</span></li>
			<li class="hideMenu">
				<input type="checkbox" name="price" value ="five">&nbsp;&nbsp;5만원이하<br/>
				<input type="checkbox" name="price" value ="ten">&nbsp;&nbsp;10만원이하<br/>
				<input type="checkbox" name="price" value ="twenty">&nbsp;&nbsp;20만원이하<br/>
			</li>
		</ul>
	</div>
	<!-- 상품 리스트-------------------------------------------------------------- -->
	<div>
		<c:forEach var="img_url" items="${vo}">
			<img src="/display/" + ${img_url}>
		</c:forEach>
	</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script  type="text/javascript">
	$(function(){
		$(".category").on("click", function(e){
			if($(this).next().css("display") == "none"){
				$(this).children("span").text("-")
				$(this).next().slideDown();
			}else{
				$(this).children("span").text("+")
				$(this).next().slideUp();
			}
			
		});
		
	});

</script>
<jsp:include page="../include/footer.jsp"/>