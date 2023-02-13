<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="../include/header.jsp"/>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.tiny.cloud/1/no-api-key/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>

<style type="text/css">
	#menu_list{
		float: left;
		height: 500px;
		width: 130px;
	}
	span{
		font-size: 30px;
	}
</style>
</head>
<body>
	<ul id="menu_list">
		<li><a href="/community/oriList">정품판별</a></li>
		<li><a href="/community/talkList?pageNum=1&amount=10">구림톡</a></li>
	</ul>
	<div>
		<span>구림톡</span>
	</div>
	<br/>
	<hr/>
	<br/>
	<form action="/community/talkUpdate" method="post" id="form">
		<div>제목<input type="text" name="talktitle" value="${vo.talktitle }"></div>
		<div><input type="hidden" name="talkname" value="${vo.talkname }">${vo.talkname }</div>
		<div><textarea name="talkcon" id="mytextarea">${vo.talkcon }</textarea></div>
		<div>
			<input type="hidden" name="talkno" value="${vo.talkno }">
			<button class="btn-insert" data-oper="talkupdate">수정 완료</button>
			<button class="btn-list" data-oper="talklist">목록</button>
		</div>
		<div>
			<input type="hidden" name="pageNum" value="${cri.pageNum }">
			<input type="hidden" name="amount" value="${cri.amount }">
		</div>
	</form>
</body>
<script type="text/javascript">
	$(function () {
		
		var plugins = [
	        "advlist", "autolink", "lists", "link", "charmap", "print", "preview", "anchor",
	        "searchreplace", "visualblocks", "code", "fullscreen", "insertdatetime", "table",
	        "paste", "code", "help", "wordcount", "save"
	 	];
		var edit_toolbar = 'formatselect fontselect fontsizeselect |'
	               + ' forecolor backcolor |'
	               + ' bold italic underline strikethrough |'
	               + ' alignjustify alignleft aligncenter alignright |'
	               + ' bullist numlist |'
	               + ' table tabledelete';

    	tinymce.init({
    		language: "ko_KR",
        	selector: '#mytextarea',
	        height: 500,
	        menubar: false,
	        plugins: plugins,
	        toolbar: edit_toolbar,
	        content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
    	 });
		
		
		
		
		
		var form = $("#form");
		var oper = $(this).data("oper");
		
		$("button").click(function(e) {
			e.preventDefault();	// 버튼 기본 이벤트 막기
			
			if(oper == 'talklist'){
				form.attr("action", "/community/talkList");
				form.submit();
			}else{
				if($("input[name=talktitle]").val() == ""){
					alert('수정할 제목을 입력 해주세요.')
					return false;
				}
				if($("textarea[name=talkcon]").val() == ""){
					alert('수정할 내용을 입력 해주세요.')
					return false;
				}
				
				form.submit();
			}
			
		});
	})
</script>

</html>

<jsp:include page="../include/footer.jsp"/>