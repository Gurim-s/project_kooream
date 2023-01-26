<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.modify{
		margin-left:auto;
		margin-right:auto; 
		padding: 50px;
		width: 100%;
		height: 100%;
	}
	.modify td{
		height: 50px;
		width: 100px;
		font-size: 20px;
		font-weight: bold ;
	}
	.modify td input{
		width: 90%;
	}
</style>

</head>
<body>
	<h1>상품 수정 / 삭제 + 수정할때 사이즈 꼭 선택해주고 수정하기,,,</h1><br/>
	<div class="container">
		<form action="/shop/shop_modify" method="post" id="operForm">
			<table class = "modify">

			<tr>
				<td>브랜드</td>
					<td class="form-inline">
						<select id="brand_select" name="b_no">
							<option value="51">LE17SEPTEMBRE</option>
							<option value="52">Polar Skate Co.</option>
							<option value="53">Punch Drunk Parties</option>
							<option value="54">THE IDENTITY PROJECT</option>
							<option value="55">The Museum Visitor</option>
						</select>
					</td>
				</tr>	
				<tr>
					<td>상품명_한글</td>
					<td><input type="text" name="p_name_ko" value="${vo.p_name_ko}"></td>
				</tr>
			<tr>
				<td>상품명_영문</td>
				<td><input type="text" name="p_name_en" value="${vo.p_name_en}"></td>
			</tr>
			<tr>		
				<td>상품분류</td>
				<td class="form-inline">
						<select id="Category1">
							<option value="">선택</option>
							<option value="top">1. 상의</option>
							<option value="bottom">2. 하의</option>
							<option value="shoes">3. 신발</option>
							<option value="acc">4. 패션잡화</option>
						</select>
							<select class="T_Category" name="">
								<option value="S">S</option>
								<option value="M">M</option>
								<option value="L">L</option>
							</select>
							<select class="B_Category" name="">
								<option value="46">46</option>
								<option value="48">48</option>
								<option value="50">50</option>
							</select>
							<select class="S_Category" name="">
								<option value="230">230</option>
								<option value="240">240</option>
								<option value="250">250</option>
								<option value="260">260</option>
							</select>

							<select class="A_Category" name="">
								<option value="FREE">FREE</option>
							</select> 

				</td>
			</tr>
			<tr>
				<td>모델번호</td>
				<td><input type="text" name="p_model_no" value="${vo.p_model_no}"></td>
			</tr>
			<tr>
				<td>판매금액</td>
				<td><input type="number" name="p_release_price" value="${vo.p_release_price}"></td>
			</tr>

			<tr>
				<td>카테고리 설정</td>
					<td>
					<select class="Category2" name="p_category">
						<option value="brand_clothes">의류</option>
						<option value="brand_shoes">신발</option>
						<option value="brand_acc">패션잡화</option>
					</select></td>
			</tr>
			<tr>
				<td>파일 첨부</td>
					<td><input type="file" name="uploadFile" multiple="multiple"></td>
				<td class="uploadResult">
				<ul></ul>
				</td>
			</tr>
<!-- 			<tr>
					<td class = "Brand_name"><input type="hidden" name ="p_brand" value=""></td>
			</tr> -->
			<tr>
				<td class="register_button">
					<button type="submit" data-oper="modify">수정완료</button>
					<input type="hidden" name="p_no" value="${vo.p_no }"/>
				</td>
			</tr>		
	</table>
	</form>
	</div>	
</body>
</html>
<jsp:include page="../include/footer.jsp"/>