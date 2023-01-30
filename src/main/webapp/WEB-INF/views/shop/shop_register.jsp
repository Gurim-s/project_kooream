<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<jsp:include page="../include/header.jsp"/>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style type="text/css">
	.register{
		margin-left:auto;
		margin-right:auto; 
		padding: 50px;
		width: 100%;
		height: 100%;
	}
	.register td{
		height: 50px;
		width: 100px;
		font-size: 20px;
		font-weight: bold ;
	}
	.register td input{
		width: 90%;
	}

</style>
</head>
<body>
	<h1>샵 상품등록</h1><br/>
	<div class="container">
		<form name="shop_register" action="/shop/shop_register" method="post">
			<table class="register">
			<tr>
				<td>이미지 등록</td>
					<td><input type="file" name="uploadFile" multiple="multiple" id="imageUpload"></td>
			<td class="uploadResult">
				<ul></ul>
			</td>
			</tr>
			<tr>
				<td>브랜드</td>
					<td class="form-inline">
						<select id="brand_select" name="b_no" onchange="ChangeValue()">
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
					<td><input type="text" name="p_name_ko" id="p_name_ko"></td>
				</tr>
				<tr>
					<td>상품명_영문</td>
					<td><input type="text" name="p_name_en" id="p_name_en"></td>
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
					<td><input type="text" name="p_model_no" id="p_model_no"></td>
				</tr>
			  	<tr>
					<td>판매금액</td>
					<td><input type="number" name="p_release_price" id="p_release_price"></td>
				</tr>
<!-- 			<tr>
				<td>상세이미지</td>
				<td><input type="file" name="Brand_productImages"></td>
			</tr> -->
			<tr>
				<td>카테고리 설정</td>
				<td>
					<select class="Category2" name="p_category" id="p_category">
						<option value="1">카테고리 선택</option>
						<option value="brand_clothes">의류</option>
						<option value="brand_shoes">신발</option>
						<option value="brand_acc">패션잡화</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>출시일</td>
				<td class="date_set"><input type="date" name="p_release_date" id="p_release_date"></td>
			</tr>
			<tr>
				<td class="Brand_name"></td>
			</tr>
			<tr>
				<td class="register_button">
					<button data-oper="submit">등록</button>
					<button data-oper="reset">취소</button>
					<button data-oper="list">목록으로</button>
<%-- 					<input type="hidden" name="pageNum" value="${cri.pageNum}"/>
					<input type="hidden" name="amount" value="${cri.amount}"/> --%>
				</td>
			</tr>
	</table>	
	</form>
	</div>

		<script type="text/javascript">
		  //-------------------------버튼 클릭 스크립트-----------------------------------
		   $(function(){
			      var formObj = $("form");
			      
			      $("button").click(function(e){   
			         e.preventDefault();   // 기본 이벤트 삭제==기능정지
			         
			         //위 3가지 버튼 중 하나 클릭하면 그거에 맞는 데이터가 들어옴
			         var oper = $(this).data("oper");   //data-oper가 remove, list해서 ..
			         
			         if(oper == 'list'){
			            location.href='/shop/shop_allList'
			         }else if(oper == 'reset'){
			            formObj[0].reset();
			         }else{
   			  		   if($('#imageUpload').val() == ''){
 			 		      alert("[이미지 등록]을 해주세요");
 			 			  return false;
 			 		     }

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
						
  			  		   
			  		   
/* 			  		   if($('#imageUpload').value == null || $('#imageUpload').value ==''){
				 		      alert("파일을 업로드 해주세요.")
				 			  return false;
				 		     } */
			            
			            console.log("submit clicked");
			            
			            var str = '';
			            
			            //upload 안에 li들을 갖고 for문 돌릴거임
			            $(".uploadResult ul li").each(function(i, obj){
			               var jobj = $(obj);   //특정 요소 변수에 담음
			               str += '<input type="hidden" name="attachList['+i+'].fileName" value="'+jobj.data("filename")+'" >';
			               str += '<input type="hidden" name="attachList['+i+'].uuid" value="'+jobj.data("uuid")+'" >';
			               str += '<input type="hidden" name="attachList['+i+'].uploadPath" value="'+jobj.data("path")+'" >';
			            });   
			            
			            console.log(formObj);
			            formObj.append(str);
			            formObj.submit();
			         }   
			      });
			   });
		  
		  
		  
		  
	// 업로드 전 제약
		$(function () {
			var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");		// 확장자 (정규식) 업로드할수없는 파일
			var maxSize = 5242880;	//5MB
			
			function checkExtension(fileName, fileSize) {
				if(fileSize >= maxSize){
					alert("파일 사이즈 초과");
					return false;
				} 
				if(regex.test(fileName)){
					alert("해당 종류의 파일은 업로드 할 수 없습니다.");
					return false;
				}				
				return true;				
			}// end checkExtension();	함수가 끝나는 곳 표시한것
		
	

	// 업로드
		$("input[type='file']").change(function(){
			var formData = new FormData();	// 스크립트에서 Form태그 생성
	        var inputFile = $("input[name='uploadFile']");
			var files = inputFile[0].files;			// 0번에 있는 파일	f12누르면 fileList
			console.log(files);
			
			for(var i=0; i<files.length; i++){

				if(!checkExtension(files[i].name, files[i].size)){
					return false;
				}
				
				formData.append("uploadFile", files[i]);
			}
			
			$.ajax({
	            url : '/brandfile/uploadAjaxAction',
	            processData : false,            // 쓰임새는 없지만 필요해서 작성 //현재상황에서는 안쓰지만 필수데이터 false를 해야 전송이 된다
	            contentType : false,            // 쓰임새는 없지만 필요해서 작성
	            data : formData,
	            type : 'post',
	            dataType : 'json',				// json타입으로 업로드
	            success : function(result){
	            	console.log(result);		// 우리가 업로드한 파일을 담고 리턴해준다(?)
	              	showUploadFile(result);
	            }
	         });
		});	// click 함수 end
		
		// 파일 업로드 후 업로드 된 파일 결과 화면에 보여주기
		var uploadResult = $(".uploadResult ul");
		function showUploadFile(uploadResultArr) {
			
			var str='';	// 태그들을 한번에 동적으로 실행
			
			for(var i=0; i<uploadResultArr.length; i++){	// 리스트 갯수만큼 li를 만들어서 동적으로 넣는다
				var obj = uploadResultArr[i];
				
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/" +		// 인코딩
														obj.uuid + "_" +
														obj.fileName);
				
/* 				var orginPath = obj.uploadPath + "\\" + obj.uuid + "_" + obj.fileName;
					orginPath = originPath.replace(new RegExp(/\\/g),"/"); */
			
				
				 str += '<li data-path="'+obj.uploadPath+'" data-uuid="'+obj.uuid+'" data-filename="'+obj.fileName+'">';// vo값을 던질 수 있게 수정
	               //str += '<a href="/download?fileName='+fileCallPath+'">';
	               str += '<img src="/resources/img/attach.png" style="width:15px">' + obj.fileName;
	               str += '<span data-file="'+fileCallPath+'"> X </span>';   //X파일 하나 만들어서 파일 삭제할 수 있게 하자
	               str += '</li>';
			
			}
			
			uploadResult.html(str);
		}// end showUploadFile();
		
		uploadResult.on("click", "span", function () {
			var targetFile = $(this).data("file");
			var targetLi = $(this).closest("li");
			
			$.ajax({
				url:"/brandfile/deleteFile",		// Controller에서 deleteFile 찾는다
				data : {fileName:targetFile},
				type : "post",
				dataType : "text",
				success : function (result) {
					targetLi.remove();
				}
			});
		});
	});
	// 사이즈 선택-----------------------------------------------------------------
		
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
	// 사이즈 선택 끝-----------------------------------------------------------		
	
	// 브랜드 이름 // 내 생각은 브랜드 선택할때 값이 51이면 Brand_name에 value = 
/* 		$('#brand_select').change(function () {
			var result2 = $('#brand_select option:selected').val();
			var Le = 'LE17SEPTEMBRE';
			if(result2 == "51"){
				$('input[name=p_brand]').attr('value',Le)

			}else{
				
			};
		});
 */
			
	function ChangeValue() {
		var target = document.getElementById("brand_select");
		var brand = target.options[target.selectedIndex].text;
		var a = '<input type="hidden" name ="p_brand" value="'+ brand +'">';
		
// 		var test = $('<input/>'); // 인풋 태그 생성;
// 		$(test).val(brand);
		
		console.log(brand);
		$('.Brand_name').html(a);
	}
 
/*  	$('#regist_submit').on('click', function(){
		   if($('#p_name_ko').value == null || $('#p_name_ko').value ==''){
		      alert("ㅇㅇ")
			  return false;
		     }
		}); */
</script>
</body>
</html>
<jsp:include page="../include/footer.jsp"/>