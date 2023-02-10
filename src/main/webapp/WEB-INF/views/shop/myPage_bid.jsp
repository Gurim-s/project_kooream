<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<jsp:include page="../include/header.jsp"/>
<jsp:include page="../include/myPageCategory.jsp"/>
<style>
	
	.product_image {
		height : 75px;
		width : 75px;
	}
	.product_info{
		margin-bottom: 20px;
	}
	
	.p_infobox{
		
	}

</style>
	<h2>- 구매 입찰 내역 -</h2>
	<div class="buy_bid_window">
		<c:forEach items="${bvo}" var="bvo">
		<c:forEach items="${bvo.productvo }" var="pvo">
			<c:choose>
				<c:when test="${bvo.bid_sell eq 0 }">
				</c:when>
				<c:otherwise>
					<div class="p_infobox">
						<div class="image_window">
							<img class="product_image" src="${bvo.imageUrls.get(0) }">
						</div>
						<div class="product_info">
							<div class="brand_namekr" >상품명 : ${pvo.p_name_ko }</div>
							<div class="brand_nameen" >상품명 : ${pvo.p_name_en }</div>
							<div class="p_size" >상품 사이즈 : ${bvo.pp_size }</div>
							<div class="brand_name" >구매 입찰 금액 : ${bvo.bid_sell }</div>
							<button id="remove_btn" onclick="remove(${bvo.bid_no })">구매입찰 철회하기</button>
						</div>
					</div>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		</c:forEach>
	</div>
	
	<h2>- 판매 입찰 내역 -</h2>
	<c:forEach items="${bvo}" var="bvo">
	<c:forEach items="${bvo.productvo }" var="pvo">
		<c:choose>
			<c:when test="${bvo.bid_buy eq 0 }">
			</c:when>
			<c:otherwise>
				<img class="product_image" src="${bvo.imageUrls.get(0) }">
				<div class="brand_name" >상품명 : ${pvo.p_name_ko }</div>
				<div class="brand_name" >상품명 : ${pvo.p_name_en }</div>
				<div class="p_size" >상품 사이즈 : ${bvo.pp_size }</div>
				<button id="remove_btn" onclick="remove(${bvo.bid_no })">판매입찰 철회하기</button>
				<p>------------------------</p>
			</c:otherwise>
		</c:choose>
	</c:forEach>
	</c:forEach>
	
	<h2>- 즉시 구매 내역 -</h2>
	<c:forEach items="${buyvo }" var="payvo">
	<c:forEach items="${buyvo.productvo }" var="paypvo">
		<img class="product_image" src="${payvo.imageUrls.get(0) }">
		<div class="brand_name" >상품명 : ${paypvo.p_name_ko }</div>
		<div class="brand_name" >거래 번호 : ${payvo.buy_no }</div>
		<div class="brand_name" >거래 날짜 : ${payvo.buy_date }</div>
		<div class="brand_name" >거래 금액 : ${payvo.pay_price }</div>
		<p>------------------------</p>
	</c:forEach>
	</c:forEach>

	

<jsp:include page="../include/footer.jsp"/>
<script type="text/javascript">
	function remove(bid_no) {
		if (confirm("입찰 철회하시겠습니까?")) {
			alert("삭제 되었습니다.");
			location.href = "/shop/bidremove/" + bid_no;
		} else {
			alert("취소되었습니다.");
		}
	}



</script>