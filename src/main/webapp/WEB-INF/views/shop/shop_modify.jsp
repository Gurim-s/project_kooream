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
							<option value="0">브랜드 선택</option>
							<option value="1">Nike</option>
							<option value="2">New Balance</option>
							<option value="3">Adidas</option>
							<option value="4">Converse</option>
							<option value="5">Apple</option>
						</select>
					</td>
				</tr>	
				<tr>
					<td>상품명_한글</td>
					<td><input type="text" name="p_name_ko" id="p_name_ko" value="${vo.p_name_ko}"></td>
				</tr>
			<tr>
				<td>상품명_영문</td>
				<td><input type="text" name="p_name_en" id="p_name_en" value="${vo.p_name_en}"></td>
			</tr>
			<tr>		
				<td>상품분류</td>
				<td class="form-inline">
					<select id="Category1">
						<option value="1">선택</option>
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
				<td><input type="text" name="p_model_no" id="p_model_no" value="${vo.p_model_no}"></td>
			</tr>
			<tr>
				<td>판매금액</td>
				<td><input type="number" name="p_release_price" id="p_release_price" value="${vo.p_release_price}"></td>
			</tr>

			<tr>
				<td>카테고리 설정</td>
					<td>
					<select class="Category2" name="p_category" id="p_category">
						<option value="1">카테고리 선택</option>
						<option value="brand_clothes">의류</option>
						<option value="brand_shoes">신발</option>
						<option value="brand_acc">패션잡화</option>
					</select></td>
			</tr>
			<tr>
				<td>출시일</td>
				<td class="date_set"><input type="date" name="p_release_date" id="p_release_date"></td>
			</tr>
			<tr>
				<td class="register_button">
					<button type="submit" data-oper="modify">수정완료</button>
					<button data-oper="list" id="list">목록으로</button>
					<input type="hidden" name="p_no" value="${vo.p_no }"/>
				</td>
			</tr>		
	</table>
	</form>
	</div>
<script type="text/javascript">
	$('#Category1').change(function () {
		var result =$('#Category1 option:selected').val();
		if(result == 'top'){
			$('.T_Category').show();
			$('.T_Category').attr('name','p_size');	// name='p_size' 가 들어간다
			$('.B_Category').hide();
			$('.S_Category').hide();
			$('.A_Category').hide();
			
		}else if(result == 'bottom'){
			$('.B_Category').show();
			$('.B_Category').attr('name','p_size');
			$('.T_Category').hide();
			$('.S_Category').hide();
			$('.A_Category').hide();
		}else if(result == 'shoes'){
			$('.S_Category').show();
			$('.S_Category').attr('name','p_size');
			$('.T_Category').hide();
			$('.B_Category').hide();
			$('.A_Category').hide();
		}else{
			$('.A_Category').show();
			$('.A_Category').attr('name','p_size');
			$('.T_Category').hide();
			$('.B_Category').hide();
			$('.S_Category').hide();	
		};
	});
	
	$(function(){
	      var formObj = $("form");
	      
      $("button").click(function(e){   
         e.preventDefault();
         
         var oper = $(this).data("oper");
         
         if(oper == 'list'){
            location.href='/shop/shop_allList'
         }else{
  		   if($('#brand_select').val() == 0){
 		      alert("[브랜드]를 선택해주세요");
 			  return false;
 		     }
  		   
  		   if($('#p_name_ko').val() == ''){
 		      alert("[상품명_한글]을 입력해주세요");
 			  return false;
 		     }

  		   if($('#p_name_en').val() == ''){
 		      alert("[상품명_영문]을 입력해주세요");
 			  return false;
 		     }
  		   
  		   if($('#Category1').val() == 1){
 		      alert("[상품분류]을 입력해주세요");
 			  return false;
 		     }
  		   
  		   if($('#p_model_no').val() == ''){
 		      alert("[모델번호]을 입력해주세요");
 			  return false;
 		     } 
  		   
  		   if($('#p_release_price').val() == ''){
 		      alert("[판매금액]을 입력해주세요");
 			  return false;
 		     }
 		     
  		   if($('#p_release_price').val() < 1){
 		      alert("[판매금액]을 확인해주세요");
 			  return false;
 		     }
  		   
  		   if($('#p_category').val() == 1){
 		      alert("[카테고리]를 선택해주세요");
 			  return false;
 		     }
 		     
  		   if($('#p_release_date').val() == ''){
 		      alert("[출시일]을 선택해주세요");
 			  return false;
 		     }
  			 formObj.submit();
         }
      });
    });
</script>
</body>
</html>

<jsp:include page="../include/footer.jsp"/>