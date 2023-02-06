<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<style>
	#title{
		text-align: center;
		font-family: -apple-system,BlinkMacSystemFont,Roboto,AppleSDGothicNeo-Regular,NanumBarunGothic,NanumGothic,나눔고딕,Segoe UI,Helveica,Arial,Malgun Gothic,Dotum,sans-serif;
		margin-top: 85px;
	}
	#addBox{
		width: 600px;
		margin: auto;
		margin-top: 58px;
	}
	input[type="text"],input[type="number"],select{
		 width: 450px;
	}
	#btn{
		text-align: center;
	}
	input[type="text"],input[type="number"]{
		border: 0px;
	}
	#content{
		border-bottom: 1px solid gray;
	}
	td:nth-child(odd){
		text-align: center;
		font-weight: bold;
		font-family: -apple-system,BlinkMacSystemFont,Roboto,AppleSDGothicNeo-Regular,NanumBarunGothic,NanumGothic,나눔고딕,Segoe UI,Helveica,Arial,Malgun Gothic,Dotum,sans-serif;
		height: 45px;
		width: 100px;
	}
	select{
		height: 40px;
	}
	#btn input{
		font-family: -apple-system,BlinkMacSystemFont,Roboto,AppleSDGothicNeo-Regular,NanumBarunGothic,NanumGothic,나눔고딕,Segoe UI,Helveica,Arial,Malgun Gothic,Dotum,sans-serif;
		border: 0;
		width: 145px;
		height: 53px;
		border-radius: 7px;
		color: white;
		background-color: black;
		cursor: pointer;
	}
	td:nth-child(even){
		border-bottom: 1px solid gray;
	}
	
</style>
<div id="title"><h1>렌탈 상품 등록</h1></div>
<div id="addBox">
	<form action="/rental/addRntPrdt" id="MyForm" method="post">
		<table>
			<tr>
				<td>브랜드</td>
				<td>
					<select name="b_no">
						<option value="9999">GUCCI</option>
						<option value="9998">DIOR</option>
						<option value="9997">LOUISVUITTON</option>
						<option value="9996">CHANEL</option>
						<option value="9995">PRADA</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>상품명</td>
				<td class="content"><input name="p_name_ko" type="text" maxlength="150"/> </td>
			</tr>
			<tr>
				<td>상품명_EN</td>
				<td class="content"><input name="p_name_en" type="text" maxlength="150"/> </td>
			</tr>
			<tr>
				<td>모델번호</td>
				<td class="content"><input name="p_model_no" type="text" maxlength="30"/> </td>
			</tr>
			<tr>
				<td>발매가</td>
				<td class="content"><input name="p_release_price" type="number" maxlength="10"/> </td>
			</tr>
			<tr>
				<td>카테고리</td>
				<td>
					<select name="p_category">
						<option value="bag">가방</option>
						<option value="clothes">의류</option>
						<option value="accessories">패션잡화</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>재고</td>
				<td class="content"><input name="p_stock" type="number"/> </td>
			</tr>
			<tr>
				<td>대여금액</td>
				<td class="content"><input name="r_price" type="number" maxlength="10"/> </td>
			</tr>
			<tr>
				<td>상품이미지</td>
				<td class="uploadResult">
					<input id="file" type="file" name="uploadFile" multiple="multiple"/>
				
				</td>
			</tr>
			<tr>
				<td colspan="2" id="btn">
					<input type="reset"  value="다시 작성"/>
					<input type="button" id="registBtn" value="상품 등록"/>	<!-- 이 버튼을 기준으로 submit 재작성 필요 -->
					<input type="button" onclick="history.go(-1)" value="목록으로 이동"/>
					<input type="hidden" id="strUuid" name="strUuid"/>
				</td>
			</tr>
		</table>
	</form>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
$(function() {
	
	var regex = new RegExp("(.*?)\.(jpeg|jpg|png|JPEG|JPG|PNG)$");		// 정규식

	//----------------------------------------------------------------------------전송 전 체크(확장자명, 사이즈)
	function checkExtexsion(fileName){
		if(!regex.test(fileName)){							// 확장자 체크
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");	
			return false;
		}
		return true;
	}

	//---------------------------------------------------------------------------input 파일 change 이벤트 start
	$("input[type='file']").change(function(){
		var formData = new FormData();					// 스크립트에서 Form 태그 생성
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;					// 0번 인덱스의 파일스
		// console.log(files);
		
		for(var i=0; i<files.length; i++){
			
			if(!checkExtexsion(files[i].name)){
				return false;
			}
			
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url : '/rntfile/uploadAjaxAction',
			processData : false,						// 쓰임새는 없지만 필요해서 작성
			contentType : false,						// 쓰임새는 없지만 필요해서 작성
			data : formData,
			type : 'post',
			dataType : 'json',
			success : function(result){ 
				console.log(result);					// upload한 파일이 upload드 되고나서 리스트 리턴
				showUploadFile(result);
			}
		});
	});
	//---------------------------------------------------------------------------upload버튼 클릭 이벤트 end
	
	// 파일 업로드 후 업로드 된 파일 결과 화면에 보여주기
	var uploadResult = $(".uploadResult");
	function showUploadFile(uploadResultArr){	// 리스트 갯수만큼 li만들어서 uploadResult에다 동적으로 넣을것임
		
		var str = '<input id="file" type="file"/> ';
		var strUuid = '';
		
		for(var i=0; i<uploadResultArr.length; i++){
			var obj = uploadResultArr[i];
			
			var fileCallPath = encodeURIComponent(obj.uploadPath + '/' + obj.uuid + "_" + obj.fileName);	// 인코딩
			
            str += '<br/><a class="fileCheck" href="/download?fileName='+fileCallPath+'">';
            //str += '<img src="/resources/img/attach.png" style="width:15px">' + obj.fileName;
            str += obj.fileName;
            str += '</a>';
            str += '<span data-file="'+fileCallPath+'" data-uuid="'+obj.uuid+'"> X </span>';		// X표시 만들어서 파일 삭제할 수 있게 기능 넣을 예정
			
            strUuid += "@" + obj.uuid;
		}
		uploadResult.html(str);	
		$("#strUuid").val(strUuid);
		
	}	//------------------------------------------------------------------------end showUploadFile();

	// ------------------------------------------------------------------------------파일 삭제 ajax
	uploadResult.on("click", "span", function(){
		var deleteSapn = $(this)
		var targetFile = deleteSapn.data("file");
		var getUuid = $(this).data("uuid");
		
		$.ajax({
			url : "/rntfile/deleteFile",
			data : {fileName: targetFile, getUuid: getUuid},
			type : "post",
			dataType : "text",
			success : function(result){
				console.log(result);					// upload한 파일이 upload드 되고나서 리스트 리턴
				deleteSapn.prev().remove();
				deleteSapn.remove();
			}
		});
		
		
	});

	//상품 등록 버튼 클릭시 이벤트
	$("#registBtn").on("click", function(){
		
		var check = 0;
		var price = $("input[name='p_release_price']").val();
		$("input[type='text'], input[type='number']").each(function(index, item){ // foreach문과 동일. 같은 태그가 여러개일때 j쿼리로 가져오는 경우 사용가능
			if(!$(item).val()){ // val이 없으면
				var str = $(item).parent().prev().text() // item 부모의 형제가 가지고 있는 text
				alert(str + "을(를) 입력해주세요.");
				check=1;
				return false; // .each() 사용시 return은 이렇게 적어줘야함!
			}else if($(item).attr("type")=='number' && $(item).val()<=0){
				alert($(this).parent().prev().text()+"에 0보다 큰 수를 입력해주세요.");
				check=1;
				return false;	
			}else if($(item).attr("name")=='p_release_price' && !$.isNumeric(price)){
				alert("발매가를 숫자로 입력해주세요.");
				check=1;
				return false;	
			}
		});
		/*
		$("input[type='number']").each(function(index, item){
			if($(item).val()<=0){
				alert($(this).parent().prev().text()+"에 0보다 큰 수를 입력해주세요.");
				check=1;
				return false;
			}
		});
		var price = $("input[name='p_release_price']").val();
		if(!$.isNumeric(price)){
			alert("발매가를 숫자로 입력해주세요.");
			check=1;
			return;
		}
		*/
		if(!$(".fileCheck").length){
			alert("파일을 등록해주세요.");
			check=1;
			return;
		}
		if(check==0){
			$("#MyForm").submit();
		}
	});
	

}); // onload end-------------------------------------------------------------------------------------------


</script>
	
<jsp:include page="../include/footer.jsp"/>