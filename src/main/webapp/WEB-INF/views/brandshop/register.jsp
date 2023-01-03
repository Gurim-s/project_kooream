<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<jsp:include page="../include/header.jsp"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상품등록</h1>
	<div class="container">
		<form name="newProduct" action="#" class="form-horizontal" method="post" enctype="multipart/form-data">

			<div>
				<label>메인이미지 등록</label>
				<div>
					<input type="file" name="Brand_productMainImage">
				</div>
			</div>
			<div>
				<label>상품명_영문</label>
				<div>
					<input type="text" name="Brand_productEnName">
				</div>
			</div>
			<div>
				<label>상품명_한글</label>
				<div>
					<input type="text" name="Brand_productKoName">
				</div>
			</div>
			<div>
				<label>상품분류</label>
					<div class="form-inline">
						<select class="form-control" id="productList">
							<option value="top">1. 상의</option>
							<option value="botton">2. 하의</option>
							<option value="shoes">3. 신발</option>
							<option value="acc">4. 패션잡화</option>
						</select>
							<%-- <c:if test="${ productList eq top }"></c:if> 상의면 --%>
							<select class="form-control" id="productList">
								<option value="topSize_S">S</option>
								<option value="topSize_M">M</option>
								<option value="topSize_L">L</option>
							</select>
							<%-- <c:if test="${ productList eq botton }"></c:if> 하의면 --%>
							<select class="form-control" id="productList">
								<option value="bottonSize_46">46</option>
								<option value="bottonSize_48">48</option>
								<option value="bottonSize_50">50</option>
							</select>
							<%-- <c:if test="${ productList eq shoes }"></c:if> 신발이면 --%>
							<select class="form-control" id="productList">
								<option value="shoesSize_240">46</option>
								<option value="shoesSize_250">48</option>
								<option value="shoesSize_260">50</option>
							</select>
							<%-- <c:if test="${ productList eq shoes }"></c:if> acc이면 --%>
							<select class="form-control" id="productList">
								<option value="acc_FREE">FREE</option>
							</select>

				</div>
					<label>모델번호</label>
				<div>
					<input type="text" name="Brand_productNumber">
				</div>
			  </div>
			  <div>
				<label>판매금액</label>
				<div>
					<input type="number" name="Brand_productprice">
				</div>
			</div>
			<div>
				<label>상세이미지</label>
				<div>
					<input type="file" name="Brand_productImages">
				</div>
			</div>
			<div>
				<label>카테고리 설정</label>
					<select class="form-control" id="productList">
						<option value="brand_clothes">의류</option>
						<option value="brand_shoes">신발</option>
						<option value="brand_acc">패션잡화</option>
					</select>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="button" class="btn btn-primary" value="등록" onclick="CheckAddProduct()">
					<input type="reset" class="btn btn-primary" value="취소" onclick="CheckAddProduct()">
				</div>
			</div>		




	
	</form>
	</div>
	
		

</body>
</html>
<jsp:include page="../include/footer.jsp"/>