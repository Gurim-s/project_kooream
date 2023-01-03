<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="../include/header.jsp"/>
<style>
	#title{
		text-align: center;
	}
	#addBox{
		width: 600px;
		margin: auto;
	}
	input[type="text"],input[type="number"],select{
		 width: 450px;
	}
	#btn{
		text-align: center;
	}
	
</style>
<div id="title"><h1>렌탈 상품 등록</h1></div>
<div id="addBox">
	<form action="/rental/addRntPrdt" method="post">
		<table>
			<tr>
				<td style="width: 100px;">브랜드</td>
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
				<td><input name="p_name_ko" type="text"/> </td>
			</tr>
			<tr>
				<td>상품명_EN</td>
				<td><input name="p_name_en" type="text"/> </td>
			</tr>
			<tr>
				<td>모델번호</td>
				<td><input name="p_model_no" type="text"/> </td>
			</tr>
			<tr>
				<td>발매가</td>
				<td><input name="p_release_price" type="text"/> </td>
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
				<td><input name="p_stock" type="number"/> </td>
			</tr>
			<tr>
				<td>대여금액</td>
				<td><input name="r_price" type="number"/> </td>
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
					<input type="submit" value="상품 등록"/>
					<input type="button" onclick="history.go(-1)" value="목록으로 이동"/>
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
	
		for(var i=0; i<uploadResultArr.length; i++){
			var obj = uploadResultArr[i];
			
			var fileCallPath = encodeURIComponent(obj.uploadPath + '/' + obj.uuid + "_" + obj.fileName);	// 인코딩
			
            str += '<br/><a href="/download?fileName='+fileCallPath+'">';
            //str += '<img src="/resources/img/attach.png" style="width:15px">' + obj.fileName;
            str += obj.fileName;
            str += '</a>';
            str += '<span data-file="'+fileCallPath+'"> X </span>';		// X표시 만들어서 파일 삭제할 수 있게 기능 넣을 예정
		}
		uploadResult.html(str);				
	}	//------------------------------------------------------------------------end showUploadFile();

// ------------------------------------------------------------------------------파일 삭제 ajax
uploadResult.on("click", "span", function(){
	var targetFile = $(this).data("file");
	
	$.ajax({
		url : "/rntfile/deleteFile",
		data : {fileName: targetFile},
		type : "post",
		dataType : "text",
		success : function(result){
			console.log(result);					// upload한 파일이 upload드 되고나서 리스트 리턴
		}
	});
	
	
});



});
</script>
	
<jsp:include page="../include/footer.jsp"/>