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
	<form action="/community/oriUpdate" method="post" id="form">
		<div>
			<div>${vo.oriname }</div>
			<div><input type="text" name="orititle" value="${vo.orititle }"></div>
			<div><small>*이미지 파일은 제품에 대한 정품 판별 의견 때문에 수정 불가합니다.</small></div>
			<div>${vo.brandname }</div>
			<div><small>*브랜드 수정은 제품에 대한 정품 판별 의견 때문에 수정 불가합니다.</small></div>
			<div></div>
			<div><textarea rows="15" cols="150%" style="resize: none" name="oricon">${vo.oricon }</textarea></div>
			<div>
				<button data-oper="oriUpdate">수정버튼</button>
				<button data-oper="oriList">목록</button>
				<input type="hidden" name="orino" value="${vo.orino }">
			</div>
		</div>
	</form>
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