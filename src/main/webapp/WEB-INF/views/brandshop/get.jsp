<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="../include/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.div{
		width : 100%;		
	}
	.brand{
		width : 50%;
		float : left;
	}
	.p_right{
		width : 50%;
		float : right;
	}
	.full{
		clear: both;
	}
	.btn button{
		width: 100%; 
		height: 50px;
	}
	.admin_btn button{
		width: 100%;
	}
	.brand_member {
		border: 1px solid black;
		border-collapse: collapse;
		width: 100%;
	}
	.full{
		position: center;
		
	}
	




</style>
</head>
<body>
	<div>
		<h1 class="page-header"> 상세보기 페이지</h1>
	</div>
		<div >
			<%-- <label>상품 번호</label>
			<input name ="p_no" value="${vo.p_no }" readonly="readonly"/> --%>
			<label>상품 메인 이미지</label>
				<div class= "brand">
					<ul>
						<li>
<%-- 							<c:url var="imgSrc" value="${vo.attachList.get(0).uploadPath + vo.attachList.get(0).uuid +vo.attachList.get(0).fileName}" /> --%>
<%-- 							<c:out value="imgSrc"></c:out> --%>
<!-- 							<img src="/brandfile/display?fileName=   "/> -->
							
							<c:url value="/brandfile/display" var="imgSrc"><!-- c:url 자동 인코딩  -->
								<c:param name="fileName" value="${vo.attachList.get(0).uploadPath }/${vo.attachList.get(0).uuid }_${vo.attachList.get(0).fileName }"></c:param>
								<!-- get(0)은 attachList가 list 형태이기 때문에 맨 처음 사진만 불러오려고 0번으로 지정해서 불러오는 중임 -->
							</c:url>
							<img alt="상품이미지" src="${imgSrc }">
						</li>
					</ul>
				</div>
			<%-- <div>
			${vo.b_name }"</div> --%>
				<div class = "p_right">
				<div>${vo2.b_name }</div>
				<div>${vo.p_name_en }</div>
				<div>${vo.p_name_ko }</div>
			<br/>
			<div><span>옵션</span></div>
			<div><a href ="#" class = "btn_size">
			<span style="font-size: 20px; float: right;">옵션선택</span></a></div>
			<br/>
			<br/>
			<hr/>
		
			<br/>
			<div>구매가</div>
			<div><span style="font-size: 25px; float: right;">${vo.p_release_price }원</span></div>
			<br/>
			<br/>
			<div class = "btn">
			<button id = "product_cart" style="background: red; color: white;">구매하기</button><br/>
			<br/>
			<button id = "product_cart">장바구니</button><br/>
			<br/>
			</div>
			<div class = "admin_btn"><!--  버튼 이어 붙이기,,,,, -->
			<button type="button" id = "product_modify"> 수정하기</button><!--  관리자만 볼 수 있게 -->
			<!-- <button type="button" id = "product_remove"> 삭제하기</button> -->
			</div>
				<form action="/brandshop/modify" method="get" id="operForm">
				<input type="hidden" name="pageNum" value="${cri.pageNum }">
				<input type="hidden" name="amount" value="${cri.amount }">
				
			</form>
			
			</div>
	</div>
	
	<div class = "full" >
	<label>상품 여러이미지ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ</label>
	<hr/>
	<br/>
	<div style="margin-left:auto; margin-right:auto;">본 상품은 '${vo2.b_name }' 브랜드 판매자가 배송하는 상품입니다.</div>
	</div>
	<div style="margin: 100px;">
	<ul>
		<li>
		<c:forEach var="index" begin="1" end="${vo.attachList.size() - 1 }" step="1"> 
		<!-- 메인이미지 제외(0번)하고 1번부터 for문 시작해서 끝은 리스의 길이는 size라고 함 근데 -1 해줘야함 검색해보기 -->
			<c:set var="attachDate" value="${vo.attachList.get(index) }"></c:set>
		<!-- index가 1 부터 list 끝까지 / get안에 index를 넣어서 그 길이만큼 for문 돌리기   -->
			<c:url value="/brandfile/display" var="imgSrc"><!-- c:url 자동 인코딩  -->
				<c:param name="fileName" value="${attachDate.uploadPath }/${attachDate.uuid }_${attachDate.fileName }"></c:param>	
			</c:url> <!-- if문  -->
			<img alt="상품이미지" src="${imgSrc }" style="float: center;">
		</c:forEach>
		
		</li>
	
	</ul>
	</div>
	<div class = "brands">
	</div>
	<br/>

	
	<h3>판매자 정보</h3>
	<br/>
	<table class="brand_member" border="1" >
		<tr>
			<th>상호명</th>
			<td>${vo2.b_name }</td>
		</tr>
		<tr>
			<th>사업자 등록번호</th>
			<td>${vo2.b_bnum }</td>
		</tr>
		<tr>
			<th>대표자</th>
			<td>${vo2.b_boss }</td>
		</tr>
		<tr>
			<th>사업장 소재지</th>
			<td>${vo2.b_badress }</td>
		</tr>
		<tr>
			<th>고객센터</th>
			<td>${vo2.b_managernum }</td>
		</tr>
		
	</table>
	
	<br/>
	<br/>
	


<script type="text/javascript">


$(function name() {	// 수정페이지로 이동
	var p_noValue = '${vo.p_no}';
	
	var operForm = $("#operForm");
	
	$("#product_modify").click(function () {
		location.href="/brandshop/modify?p_no=${vo.p_no}"
/* 		var str = '<input type="hidden" name="pageNum" value="'+${cri.pageNum }+'">';
			str += '<input type="hidden" name="amount" value="'+${cri.amount }+'">';
			str += '<input type="hidden" name="p_no" value="'+${vo.p_no }+'">';
			operForm.html(str);
			operForm.submit();
			/* operForm.attr("action", "/brandshop/modify"); */
		
		
	});
});







</script>

</body>
</html>
<jsp:include page="../include/footer.jsp"/>
