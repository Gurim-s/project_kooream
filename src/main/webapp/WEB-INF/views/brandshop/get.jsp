<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		width: 50%;
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
				</div>
			<%-- <div>
			${vo.b_name }"</div> --%>
				<div class = "p_right">
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
	<div class = "full">
	<label>상품 여러이미지</label>
	<div class = "brands">
	</div>
	<br/>

	
	<h3>판매자 정보</h3>
	<table>
		<tr>
			<th>상호명</th>
			<td></td>
		</tr>
		<tr>
			<th>사업자 등록번호</th>
			<td></td>
		</tr>
		<tr>
			<th>대표자</th>
			<td></td>
		</tr>
		<tr>
			<th>사업장 소재지</th>
			<td></td>
		</tr>
		<tr>
			<th>고객센터</th>
			<td></td>
		</tr>
		
	</table>
	</div>
	
	

<script type="text/javascript">

$(function() {		// 메인이미지 (한장만 보여주기)
 		$.ajax({
 			url:'/brandshop/getList',
 			type: 'get',
 			dataType:"json",
 			contentType:"application/json",
 		})
 		.done(function(json) {
			var str='<ul id="container">';
			console.log(json);
			for(var i=0; i<json.length; i++) {
				str += '<li class="product_list">';
				
				// 이미지 하나만 보여주기 
				if(json[i].attachList.length > 0) {
					var uploadPath = json[i].attachList[0].uploadPath;
					var uuid = json[i].attachList[0].uuid;
					var fileName = json[i].attachList[0].fileName;
					var fileCallPath = encodeURIComponent(uploadPath + "/" + uuid + "_" + fileName);
					str += '<div><img src="/brandfile/display?fileName='+ fileCallPath + '" /></div>';
				}
				
				str += '</li>';
			}
			
			str += '</ul>';
			$('.brand').append(str);
		});	
 	});



$(function() {	// 상품 여러이미지 보여주기
	$.ajax({
		url:'/brandshop/getList',
		type: 'get',
		dataType:"json",
		contentType:"application/json;  charset=utf-8",
	})
	.done(function(json) {
		var str='<ul id="container">';
		console.log(json);
		for(var i=0; i<json.length; i++) {
			str += '<div>'; 
		// 이미지 하나만 보여주기 
		
		
/* 		if(json[i].attachList.length > 0) {
			var uploadPath = json[i].attachList[0].uploadPath;
			var uuid = json[i].attachList[0].uuid;
			var fileName = json[i].attachList[0].fileName;
			var fileCallPath = encodeURIComponent(uploadPath + "/" + uuid + "_" + fileName);
			str += '<div><img src="/brandfile/display?fileName='+ fileCallPath + '" /></div>';
		} */
		//상품 이미지 태그 추가	// 이건 이미지 여러개 보여줄때 사용
			for(var j=0; j<json[i].attachList.length; j++) {
				var uploadPath = json[i].attachList[j].uploadPath;
				var uuid = json[i].attachList[j].uuid;
				var fileName = json[i].attachList[j].fileName;
				var fileCallPath = encodeURIComponent(uploadPath + "/" + uuid + "_" + fileName);
				str += '<img src="/brandfile/display?fileName='+ fileCallPath + '" />';
			}

				str += '</div>';
		}
				str += '</ul>';
	$('.brands').append(str);
	});	
});

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
