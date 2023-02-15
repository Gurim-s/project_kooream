<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	#main{
		margin-left: 130px;
	}
	button{
		border: 0;
		width: 100px;
		height: 50px;
	}
	#btn{
		text-align: center;
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
</style>
</head>
<body>
	<ul id="menu_list">
		<li><a href="/community/oriList">정품판별</a></li>
		<li><a href="/community/talkList?pageNum=1&amount=10">구림톡</a></li>
	</ul>
	<div>
		<span><strong>정품판별</strong></span>
	</div>
	<br/>
	<div id="main">
	<hr/>
	<br/>
	<form action="/community/oriUpdate" method="post" id="form">
		<div>
			<div><small><strong>작성자</strong></small></div>
			<div>${vo.oriname }</div>
			<div style="height: 20px;"></div>
			<div><small><strong>제목</strong></small></div>
			<div><input type="text" name="orititle" value="${vo.orititle }"></div>
			<div style="height: 20px;"></div>
			<div><small>*이미지 파일은 제품에 대한 정품 판별 의견 때문에 수정 불가합니다.</small></div>
			<div style="height: 20px;"></div>
			<div><small><strong>브랜드</strong></small></div>
			<div>${vo.brandname }</div>
			<div style="height: 20px;"></div>
			<div><small>*브랜드 수정은 제품에 대한 정품 판별 의견 때문에 수정 불가합니다.</small></div>
			<div style="height: 20px;"></div>
			<div></div>
			<div><textarea rows="15" cols="150%" style="resize: none" name="oricon">${vo.oricon }</textarea></div>
			<div style="height: 40px;"></div>
			<div id="btn">
				<button data-oper="oriUpdate">수정버튼</button>
				<button data-oper="oriList">목록</button>
				<input type="hidden" name="orino" value="${vo.orino }">
			</div>
		</div>
	</form>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		var form = $("#form");
		var oper = $(this).data("oper");
		
		$("button").click(function(e) {
			e.preventDefault();
			
			if(oper == 'oriList'){
				form.attr("action", "/community/oriList");
				form.submit();
			}else{
				if($("input[name=orititle]").val() == ""){
					alert('수정할 제목을 입력 해주세요.')
					return false;
				}
				if($("textarea[name=oricon]").val() == ""){
					alert('수정할 내용을 입력 해주세요.')
					return false;
				}
				
				form.submit();
			}
		})
		
		
	})
</script>
</html>

<jsp:include page="../include/footer.jsp"/>