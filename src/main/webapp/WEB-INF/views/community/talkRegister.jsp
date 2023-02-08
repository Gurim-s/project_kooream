<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
	#main{
		margin-left: 130px;
	}
	input[type=text] {
		width: 500px;
		height: 40px;
		font-size: 15px;
		border: 1;
		border-radius: 5px;
		outline: none;
		padding-left: 10px;
	}
	#btn{
		text-align: center;
	}
	button{
		border: 0;
		width: 100px;
		height: 50px;
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
	<div id="main">
	<hr/>
	<br/>
	<form action="/community/talkRegister" method="post" role="form">
			<div>
				<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.member" var="mvo"/>
				<td><strong>${ mvo.m_nickname}</strong></td>
				<td><input type="hidden" name="talkname" value="${ mvo.m_nickname}"></td>
				<td><input type="hidden" name="m_no" value="${ mvo.m_no}"></td>
				</sec:authorize>
			</div>
			<div style="height: 30px;"></div>
			<div>
				<input type="text" name="talktitle" placeholder="제목을 입력해주세요.">
			</div>
			<div style="height: 30px;"></div>
			<div>	
				<textarea name="talkcon" id="mytextarea"></textarea>
			</div>
			<div style="height: 30px;"></div>
			<div id="btn">
				<button class="btn-insert" data-oper="talkregister">등록</button>
				<button class="btn-list" data-oper="talklist">목록</button>
			</div>
		<div>
			<input type="hidden" name="pageNum" value="${cri.pageNum }">
			<input type="hidden" name="amount" value="${cri.amount }">
		</div>
	</form>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		
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

		
		
		
		var form = $("form");
		
		// 아래 talklist를 위해 표현식을 담은 것
		var amount = '${cri.amount}';
		var pageNum = '${cri.pageNum}';
		
		$("button").click(function(e) {
			e.preventDefault();	// 버튼에 걸린 기본 이벤트 삭제
		
			var oper = $(this).data("oper");	//해당 버튼의 data가 oper인 것
			var talkcon = tinymce.activeEditor.getContent();
			
			if(oper == 'talkregister'){	//게시글 등록
				if( $("input[name=talktitle]").val() == ""){
					alert('제목을 적어 주세요.');
					return;
				}
				if( $("input[name=talkname]").val() == ""){
					alert('닉네임을 적어 주세요.');
					return;
				}
				if( talkcon == ''){
					alert('내용을 적어 주세요.');
					return;
				}
				
				form.submit();	// 해당 form 데이터 보내기
				
			}else if( oper == 'talklist'){
				location.href = '/community/talkList?pageNum='+pageNum+'&amount='+amount;
				// submit 하면 form의 action 따라가므로 400 에러 발생 주의할 것
			}
			
			
		})
		
		
		
		
		
		
		
		
	});
	
</script>

</html>

<jsp:include page="../include/footer.jsp"/>