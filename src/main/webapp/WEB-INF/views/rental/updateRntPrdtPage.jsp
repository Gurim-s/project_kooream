<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<div id="title"><h1>렌탈 상품 수정</h1></div>
<div id="addBox">
	<form action="/rental/updateRntPrdt" id="MyForm" method="post">
		<input type="hidden" name="p_no" value="${pvo.p_no }"/>
		<table>
			<tr>
				<td style="width: 100px;">브랜드</td>
				<c:choose>
					<c:when test="${pvo.b_no eq 9999}">
						<td><span>GUCCI</span> </td>
					</c:when>
					<c:when test="${pvo.b_no eq 9998}">
						<td><span>DIOR</span> </td>
					</c:when>
					<c:when test="${pvo.b_no eq 9997}">
						<td><span>LOUISVUITTON</span> </td>
					</c:when>
					<c:when test="${pvo.b_no eq 9996}">
						<td><span>CHANEL</span> </td>
					</c:when>
					<c:otherwise>
						<td><span>PRADA</span> </td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td>상품명</td>
				<td><input name="p_name_ko" type="text" value="${pvo.p_name_ko }"/> </td>
			</tr>
			<tr>
				<td>상품명_EN</td>
				<td><input name="p_name_en" type="text" value="${pvo.p_name_en }"/> </td>
			</tr>
			<tr>
				<td>모델번호</td>
				<td><input name="p_model_no" type="text" value="${pvo.p_model_no }"/> </td>
			</tr>
			<tr>
				<td>발매가</td>
				<td><input name="p_release_price" type="text" value="${pvo.p_release_price }"/> </td>
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
				<td><input name="p_stock" type="number" value="${pvo.p_stock }"/> </td>
			</tr>
			<tr>
				<td>대여금액</td>
				<td><input name="r_price" type="number" value="${pvo.r_price }"/> </td>
			</tr>
			<tr>
				<td>상품이미지</td>
				<td class="uploadResult">
					<input id="file" type="file" name="uploadFile" multiple="multiple"/>
					<!-- 기존 저장되어 있는 파일 보여주기 -->
					<div id="fileResult">
						<c:forEach var="fvo" items="${fvoList }">
							<a class="fileCheck" href="/download?fileName=${fvo.uploadPath }/${fvo.uuid}_${fvo.fileName}">${fvo.fileName }</a>
							<span data-file="${fvo.uploadPath }/${fvo.uuid}_${fvo.fileName}" data-uuid="${fvo.uuid }">X</span><br/>
						</c:forEach>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" id="btn">
					<input type="reset"  value="다시 작성"/>
					<input type="button" id="modifyBtn" value="상품 수정"/>	<!-- 이 버튼을 기준으로 submit 재작성 필요 -->
					<input type="button" onclick="history.go(-1)" value="상세페이지로 이동"/>
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
		
		var str = '';
		var strUuid = $("#strUuid").val();
		
		for(var i=0; i<uploadResultArr.length; i++){
			var obj = uploadResultArr[i];
			
			var fileCallPath = encodeURIComponent(obj.uploadPath + '/' + obj.uuid + "_" + obj.fileName);	// 인코딩
			
            str += '<a class="fileCheck" href="/download?fileName='+fileCallPath+'">';
            //str += '<img src="/resources/img/attach.png" style="width:15px">' + obj.fileName;
            str += obj.fileName;
            str += '</a>';
            str += '<span data-file="'+fileCallPath+'" data-uuid="'+obj.uuid+'"> X </span><br/>';		// X표시 만들어서 파일 삭제할 수 있게 기능 넣을 예정
			
            // 파일 업로드시 uuid를 문자열로 가져가서 @기준으로 자르고 해당 uuid 가지고 있으면 p_no를 업데이트함
            strUuid += "@" + obj.uuid;
		}
		$(".uploadResult").children().last().append(str);	// children() : 자식 요소, last() : 그 중 마지막 요소
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
				deleteSapn.prev().prev().remove();
				deleteSapn.prev().remove();
				deleteSapn.remove();
			}
		});
		
		
	});
	// 상품 수정 버튼 클릭 이벤트
	$("#modifyBtn").on("click", function(){
		var check = 0;
		$("input[type='text'], input[type='number']").each(function(index, item){ // foreach문과 동일. 같은 태그가 여러개일때 j쿼리로 가져오는 경우 사용가능
			if(!$(item).val()){ // val이 없으면
				var str = $(item).parent().prev().text() // item 부모의 형제가 가지고 있는 text
				alert(str + "을(를) 입력해주세요.");
				check=1;
				return false; // .each() 사용시 return은 이렇게 적어줘야함!
			}
		});
		$("input[type='number']").each(function(index, item){
			if($(item).val()<=0){
				alert($(this).parent().prev().text()+"에 0보다 큰 수를 입력해주세요.");
				check=1;
				return false;
			}
		});
		var price = $("input[name='p_release_price']").val();
		var numPrice = parseInt(price);
		if(!$.isNumeric(price)){
			alert("발매가를 숫자로 입력해주세요.");
			check=1;
			return;
		}else if(numPrice<=0){
			alert("발매가를 0보다 큰 수로 입력해주세요.");
			check=1;
			return;
		}
		
		if(check==0){
			if(!$(".fileCheck").length){
				alert("파일을 등록해주세요.");
				return;
			}
			$("#MyForm").submit();
		}
	});

	
	

});
</script>
	
<jsp:include page="../include/footer.jsp"/>