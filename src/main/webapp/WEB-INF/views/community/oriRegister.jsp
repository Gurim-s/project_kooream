<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<jsp:include page="../include/header.jsp"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#menu_list{
		float: left;
		height: 500px;
		width: 130px;
	}
	span{
		font-size: 30px;
	}
	#btn{
	text-align: center;
	}
	form{
		margin-left: 180px;
	}
</style>
</head>
<body>
	<ul id="menu_list">
		<li>뉴스</li>
		<li><a href="/community/oriList">정품판별</a></li>
		<li><a href="/community/talkList?pageNum=1&amount=10">구림톡</a></li>
	</ul>
	<div>
		<span>정품판별</span>
	</div>
	<br/>
	<hr/>
	<br/>
	<div>
		<form action="/community/oriRegister" method="post">
			<div>작성자</div>
			<div>
				<input type="text" name="oriname">
				<input type="text" name="m_no">
			</div>
			<br/>
			<div>제목</div>
			<div><input type="text" name="orititle"></div>
			<br/>
			<div>이미지 첨부</div>
			<div>
				<input type="file" name="uploadFile" multiple="multiple">
			</div>
			<div class="uploadResult">
				<ul></ul>
			</div>
			<br/>
			<div>브랜드</div>
			<div>
				<select name="brandname">
					<option value="노스페이스">노스페이스</option>
					<option value="나이키">나이키</option>
					<option value="슈프림">슈프림</option>
				</select>
			</div>
			<br/>
			<div>내용</div>
			<div>
				<textarea rows="20" cols="130" name ="oricon" style="resize: none"></textarea>
			</div>
		</form>
		<div id="btn">
			<br/>
			<button id="registerBtn" data-oper="oriRegister">등록</button>
			<button id="listBtn" data-oper="oriList">목록</button>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		var form = $("form");
		
		// 버튼 클릭 ---------------------------------------
		
		$("button").click(function(e) {
			e.preventDefault();	// 기본 이벤트 막기
			
			var oper = $(this).data("oper");
			
			if(oper == 'oriList'){
				location.href = '/community/oriList';
			}else if(oper == 'oriRegister'){
				
				var str = '';
				$(".uploadResult ul li").each(function(i, obj) {
					
					var jobj = $(obj);
					
					str += '<input type="hidden" name="attachList['+i+'].fileName" value="'+jobj.data("filename")+'" >';
					str += '<input type="hidden" name="attachList['+i+'].uuid" value="'+jobj.data("uuid")+'" >';
					str += '<input type="hidden" name="attachList['+i+'].uploadPath" value="'+jobj.data("path")+'" >'; 
				});
				
				form.append(str);				
				form.submit();
			}
			
		});
		
		
		
		// 파일 업로드 스크립트 ------------------------------
		var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");	// 업로드 막아둔 파일 확장자
		var maxSize = 5242880;	// 5MB 첨부할 수 있는 파일의 최대 사이즈
		
		// 파일 검증 함수 start-----------------------------
		function checkExtension(fileName, fileSize) {
			console.log(fileSize);
			if(fileSize >= maxSize){
				alert("파일 크기 초과 입니다.");
				return false;
			}
			if(regex.test(fileName)){
				alert("해당 종류의 파일은 업로드 할 수 없습니다.");
				return false;
			}
			return true;
		}	// 파일 검증 함수 end----------------------------
		
		$("input[type='file']").change(function() {
			var formData = new FormData();	// 스크립트에서 새로운 Form 태그 생성
			var inputFile = $("input[name='uploadFile']");	// 업로드 할 파일 태그 부분
			var files = inputFile[0].files;
			
			// 파일을 여러 개 첨부할 수 있기 때문에 첨부한 파일 위에 만든 함수로 검증
			for(var i=0; i<files.length; i++){
				
				if(!checkExtension(files[i].name, files[i].size)){
					return false;	
				}
				
				formData.append("uploadFile", files[i]);	// 새로 만든 폼 태그에 붙이기
			}
			
			// 파일 첨부 비동기 (컴퓨터에 업로드) 
			$.ajax({
				url : '/uploadAjaxAction',
				processData : false,
				contentType : false,
				data : formData,
				type : 'post',
				dataType : 'json',
				success : function(result) {
					console.log(result);
					showUploadFile(result);
				}
			});
		});
		
		
		// 파일 업로드 후 업로드 된 파일 결과 화면에 보여주기 start -------
		var uploadResult = $(".uploadResult ul");
		function showUploadFile(uploadResultArr) {
			var str = '';
			
			for(var i=0; i<uploadResultArr.length; i++){
				var obj = uploadResultArr[i];
				
				var fileCallPath = encodeURIComponent(obj.uploadPath + "/" +
														obj.uuid + "_" +
														obj.fileName);
				
				str += '<li data-path="'+obj.uploadPath+'" data-uuid="'+obj.uuid+'" data-fileName="'+obj.fileName+'">';
				str += obj.fileName;
				str += '<span data-file="'+fileCallPath+'"> X </span>';
				str += '</li>';
				
			}
			
			uploadResult.html(str);
		} // 파일 업로드 후 업로드 된 파일 결과 화면에 보여주기 end --------
		
		
		
		// 선택한 파일 지우는 비동기 (DB 가기 전 파일만 선택 했을 때 상태)
		uploadResult.on("click", "span", function() {
			var targetFile = $(this).data("file");
			var targetLi = $(this).closest("li");
			
			$.ajax({
				url : "/deleteFile",
				data : {fileName: targetFile},
				type : "post",
				dataType : "text",
				success : function(result) {
					targetLi.remove();
				}
			})
		});// 화면단 파일 삭제 end-------------------------------
		
		
		
		
		
	});



	

</script>
</html>
<jsp:include page="../include/footer.jsp"/>