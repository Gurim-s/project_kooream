<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			<div><input type="file" name="orifile" multiple="multiple"></div>
			<div class="uploadResult">
				<ul></ul>
			</div>
			<br/>
			<div>브랜드</div>
			<div>
				<select name="oribrandname">
					<option value="노스페이스">노스페이스</option>
					<option value="나이키">나이키</option>
					<option value="슈프림">슈프림</option>
				</select>
			</div>
			<br/>
			<div>내용</div>
			<div>
				<textarea rows="20" cols="130" style="resize: none";></textarea>
			</div>
		</form>
		<div id="btn">
			<br/>
			<button id="registerBtn">등록</button>
			<button id="listBtn">목록</button>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		
		
	})




	var uploadResult = $(".uploadResult ul");
	function showUploadFile(uploadResultArr){
		var str = '';
		
		for(var i=0; i<uploadResultArr.length; i++){
			var obj = uploadResultArr[i];
			
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + 
													obj.uuid + "_" + 
													obj.fileName);
			
			str += '<li data-path="'+obj.uploadPath+'" data-uuid="'+obj.uuid+'" data-fileName="'+obj.fileName+'">';
			//str += '<a href="/download?fileName='+fileCallPath+'">';
			str += '<img src="/resources/img/attach.png" style="width:15px">' + obj.fileName;
			//str += '</a>';
			str += '<span data-file="'+fileCallPath+'"> X </span>';
			str += '</li>';
		}
	
	uploadResult.html(str);
	}// end showUploadFile();

	uploadResult.on("click","span", function() {
	var targetFile = $(this).data("file");
	var targetLi = $(this).closest("li");
	$.ajax({
		url : "/deleteFile",
		data : {fileName: targetFile},
		type : "post",
		dataType : "text",
		success : function(result) {
			//alert(result);
			targetLi.remove();
		}
	})
	
});



});
</script>
</html>
<jsp:include page="../include/footer.jsp"/>